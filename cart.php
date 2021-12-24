<?php
  if(empty($_SESSION['cart'])){
    $_SESSION['cart']=array();
  }
  if(isset($_GET['action'])){
    $id=isset($_GET['id'])?$_GET['id']:'';
    switch($_GET['action']){
        case'add';
          if(array_key_exists($id, array_keys($_SESSION['cart']))){
            $_SESSION['cart'][$id]++;
           }
           else{
            $_SESSION['cart'][$id]=1;
           }
           header("location: ?option=cart");
        break;
        case'delete':
          unset($_SESSION['cart'][$id]);
          break;
        case'deleteall':
          unset($_SESSION['cart']);
          break;
        case'update':
        if($_GET['type']=='asc')
         $_SESSION['cart'][$id]++;
       else
        if($_SESSION['cart'][$id]>1)
        $_SESSION['cart'][$id]--;
        header("location: ?option=cart");
        break;
      case'order':
        if(isset($_SESSION['user'])){
          header("location:?option=order");
        }else{
          header("location:?option=signin&order=1");
        }
        break;
    }
  }
?>
<section class= "cart">
<?php
if(!empty($_SESSION['cart'])):
  //$ids="0";
  //foreach (array_keys($_SESSION['cart']) as$key)
  //$ids.=",".$key;
  $ids= implode(',', array_keys($_SESSION['cart']));
  $query="select*from products where id in($ids)";
  $result=$connect->query($query);
?>
  <table border="1" width="100%" cellpadding="0" cellspacing="0">
    <thead> 
        <tr style="text-align: center; font-weight: bold;"> 
            <td>Ảnh sản phẩm</td>
            <td>Tên sản phẩm</td>
            <td>Giá tiền(vnđ)</td>
            <td>Số lượng</td>
            <td>Thành tiền</td> 
        </tr> 
    </thead>
    <tbody>
<?php
  $toTal=0;
  foreach ($result as $item ) :
    
?>
<tr style="text-align:center;">
    <td width="20%"><img width="100%" src="images/<?=$item['image']?>"></td>
    <td ><?=$item['name']?> <br><input class="button" type="button" value="Xóa" onclick="location='?option=cart&action=delete&id=<?=$item['id']?>';"></td>
    <td><?=number_format($item['price'],0,',','.')?></td>
    <td><input type="button" value="-" onclick="location='?option=cart&action=update&type=desc&id=<?=$item['id']?>';"><?=$_SESSION['cart'][$item['id']]?><input type="button" value="+" onclick="location='?option=cart&action=update&type=asc&id=<?=$item['id']?>';"></td>
    <td><?=number_format($subTotal=$item['price']*$_SESSION['cart'][$item['id']],0,',','.')?></td>
</tr>
<?php $toTal+=$subTotal;?>
<?php
 endforeach;
?>
<tr>
    
    <td colspan="5">
        <section style="text-align: right; margin-top:8px;">Tổng tiền: <?=number_format($toTal,0,',','.')?>(vnđ)</section>
        <section>
            <input class="button"type="button" value="Xóa tất cả" onclick="if(confirm('Bạn có chắc không'))location='?option=cart&action=deleteall';"><input class="button" type="button" value="Đặt hàng" onclick="location='?option=cart&action=order';">
        </section>  

    </td>
</tr>
</tbody>
</table>
<?php
else:
?>
<section style="text-align : center; color: black; font-weight: bold; font-size:28px; margin-top: 40px;">Giỏ hàng trống. Mời bạn thêm sản phẩm!</section>
<?php 
endif;
?>  
</section>