<?php
   if(isset($_POST['username'])):
      $username = $_POST['username'];
      $password = md5($_POST['password']);
      $query = "select*from customer where username='$username' and password='$password'";
      $result = $connect->query($query);
      if(mysqli_num_rows($result) == 0):
         $alert = 'Bạn nhập sai mật khẩu !';
       else:
          $user = mysqli_fetch_array($result);
          if($user['status'] == 0):
            $alert = "Tài khoản của bạn đang bị khóa !";
          else:
            $_SESSION['user']=$username;
            //echo"<script>location=?option=home';</script>";
            // đăng nhập thành công
            if(isset($_GET['order'])){
            header("location: ?option=order");
            }elseif($_GET['productid']){
               $customerid=$user['id'];
               $productid=$_GET['productid'];
               $content=$_SESSION['content'];
               $connect->query("insert comments(customerid,productid,date,content) values($customerid,$productid,now(),'$content')");
               echo "<script>alert('Your comment is submitted and it will be showed soon!'); location:'?option=productdetail&id=$productid';</script>";
            }else{
            header("location: ?option=home");
            }
          endif;
      endif;
   endif;
?>
<section >
   <h3 style="font-weight:bold">ĐĂNG NHẬP TÀI KHOẢN</h3>     
   <section><?=isset($alert)?$alert:""?></section>
   <section style="font-weight: bold;">
      <form method="post">
         <section>
            <label style="margin-left:5px; font-size:20px">Usename: </label><input type="text" name="username" >
         </section>
         <section>
            <label style="font-size:20px;">Password: </label><input type="password" name="password">
         </section>
         <section style="margin-left:70px; margin-top: 10px; font-size: 20px;"><input type="submit" value="login"></section>
      </form>
   </section>
</section>