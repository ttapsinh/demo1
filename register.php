<?php
    if(isset($_POST['username'])):
    	$username = $_POST['username'];
    	$query = "select*from customer where username='$username'";
    	$result = $connect->query($query);
    	if(mysqli_num_rows($result)!=0):
    		$alert = " Tên đăng nhập này không có sẵn. Mời bạn chọn 1 tên khác!";
    	else:
    		$password = md5($_POST['password']);
    		$fullname = $_POST['fullname'];
    		$mobile = $_POST['mobile'];
    		$address = $_POST['address'];
    		$email = $_POST['email'];
    		$query = "insert customer (username, password, fullname, mobile, address, email) values ('$username','$password','$fullname','$mobile','$address','$email')";
    		$connect->query($query);
    		$alert = "Bạn đã đăng ký thành công tài khoản";
    		header("location: ?option=home");
    	endif;
    endif;
?>
<section>
    <h1 style="font-size: 30px; font-weight: bold;">Đăng ký tài khoản</h1><?=isset($alert)?$alert:""?>
    <section>
	    <form method="post" onsubmit="if(repassword.value!=password.value){alert('Xác nhận mật khẩu không đúng!');return false;}">
	    <section>
		    <label style="margin-left:30px">Username: </label><input type="text" name="username" required minlength="3">
	    </section>
	    <section>
		    <label style="margin-left:35px">Password: </label><input type="password" name="password" required minlength="4" maxlength="10">
	    </section>
	    <section>
		    <label style="margin-left:7px">Re-password: </label><input type="password" name="repassword" required>
	    </section>
	    <section>
		    <label style="margin-left:35px">Fullname: </label><input type="text" name="fullname" required minlength="2">
	    </section>
	    <section>
		    <label style="margin-left:52px">Mobile: </label><input type="tel" name="mobile" required pattern="0\d{9}">
	    </section>
	    <section>
		    <label style="margin-left:30px">Address: </label><textarea name="address" rows="3" required></textarea>
	    <section>
		    <label style="margin-left:66px">Email: </label><input type="email" name="email">
	    </section>
	    <section>
		    <input style="margin-left:100px" type="submit" name="Đăng nhập" style="font-size: 20px;">
	    </section>
	    </form>
    </section>
</section>