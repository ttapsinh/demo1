<?php
   if (isset($_POST['content'])):
      $content=$_POST['content'];
      $productid=$_GET['id'];
      if(isset($_SESSION['user'])):
      	$customerid=mysqli_fetch_array($connect->query("select*from customer where username='".$_SESSION['user']."'"));
      	$customerid=$customerid['id'];
      	$connect->query("insert comments(customerid,productid,date,content) values($customerid,$productid,now(),'$content')");
      	echo"<script>alert('Your commemt is submitted and it it will be showed soon!')</script>";
      else:
      	$_SESSION['content']=$content;
      	echo"<script>alert('Your must signin to comment!');location='?option=signin&productid=$productid';</script>";
      endif;
   endif;
?>
<?php
	 if(isset($_GET['id'])):
	 	$query = "select *from products where id=".$_GET['id'];
	 	$result = $connect->query($query);
	 	$item = mysqli_fetch_array($result);
	 endif;
?>
<h1 style="font-weight:bold;font-size: 23px;">Chi tiết sản phẩm</h1>
<section style="line-height: 18px;">
	<section><img src="images/<?=$item['image']?>" width="20%"></section><br>
	<section style="font-weight:bold; font-size: 19px;"><?=$item['name']?></section>
	<section style="font-size: 17px;"><?=number_format($item['price'],0,',','.')?>đ</section>
	<section style="font-size: 17px; "><input type="button" value="Đặt mua" onclick="location='?option=cart&action=add&id=<?=$item['id']?>';"></section><br>
	<section style="font-size: 15px"><?=$item['description']?></section>
</section>
<section>
	<h2 style="font-size:17px; font-weight: bold;">Comments:</h2>
	<?php
      $comments=$connect->query("select*from customer a join comments b on a.id=b.customerid join products c on b.productid=c.id where b.status and  productid=".$_GET['id']);
      if(mysqli_num_rows($comments)==0):
      	echo"<section style='color:green;font-size: 18px;float: left;'>No comments!</section>";
      else:
      	foreach($comments as $comment):
   ?>
         <section style="font-weight:bold; float: left;"><?=$comment['username']?></section><br>
         <section style="padding-left:2%; float: left;"><?=$comment['content']?></section>
   <?php
      	endforeach;
      endif;
	?>
	<form method="post">
		<section>
		    <textarea name="content" style="width: 100%; font-size: 19px" rows="2.9" class="form-control" placeholder="Viết bình luận vào đây..."></textarea>
		 </section>
		 <section><input type="submit" value="submit" class="btn btn-primary" style="font-size: 15px;"></section>
	</form>
</section>
