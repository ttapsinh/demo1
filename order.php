<?php
$query="select*from customer where username='".$_SESSION['user']."'";
$customer=mysqli_fetch_array($connect->query($query));
?>
<?php
    if(isset($_POST['name'])){
    	$name=$_POST['name'];
    	$mobile=$_POST['mobile'];
    	$address=$_POST['address'];
    	$email=$_POST['email'];
    	$note=$_POST['note'];
    	$ordermethodid=$_POST['ordermethodid'];
    	$customer=$customer['id'];
    	$query="insert orders(ordermethodid,customerid,name,address,mobile,email,note) values($ordermethodid,$customer,'$name','$address','$mobile','$email','$note')";
    	$connect->query($query);
    	$query="select id from orders order by id desc limit 1";
    	$orderid=mysqli_fetch_array($connect->query($query))['id'];
    	foreach($_SESSION['cart'] as $key=>$value){
    		$productid=$key;
    		$number=$value;
    		$query="select price from products where id=$key";
    		$price=mysqli_fetch_array($connect->query($query))['price'];
    		$query="insert orderdetail values('',$productid,$orderid,$number,$price)";
    		$connect->query($query);
    		echo "Sp: ";
    	}
    	unset($_SESSION['cart']);
    	header("location: ?option=ordersuccess");
    }
?>
<h1 style="font-size:2em">ĐẶT HÀNG</h1>
<form method="post">
<h2>Thông tin người nhận hàng</h2>
    <section>
		<section>
		 	<label style="margin-left:65px">Họ tên: </label><input name="name" value="<?=$customer['fullname']?>" required minlength="3">
		</section>
		<section>
			<label style="margin-left:42px">Điện thoại: </label><input type="tel" name="mobile" value="<?=$customer['mobile']?>" required pattern="0\d{9}">
		</section>
		<section>
			<label style="margin-left:45px">Địa chỉ: </label><textarea name="address" rows="3" required><?=$customer['address']?> </textarea>
		</section>
		<section>
			<label style="margin-left:65px">Email: </label><input type="email" name="email" value="<?=$customer['email']?>" >
		</section>
		<section>
			<label style="margin-left:40px">Ghi chú: </label></label><textarea name="note" rows="3"></textarea>
		</section>
    </section>
    <h2 style="margin-left:35px">Chọn phương thức thanh toán</h2>
    <?php 
       $query="select*from ordermethod where status";
       $result=$connect->query($query);
    ?>
    <select name="ordermethodid" style="margin-left:90px">
    	<?php foreach($result as $item):?>
    		<option value="<?=$item['id']?>"><?=$item['name']?></option>
        <?php endforeach;?>
    </select>
    <section><input type="submit" value="Đặt hàng" style="margin-top: 20px; margin-left: 80px;"></section>
</form>