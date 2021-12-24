<?php 
  $option='home';
  $query="select*from products where status=1";
  if(isset($_GET['brandid'])){
  	$query.=" and brandid=".$_GET['brandid'];
    $option='showproducts&brandid='.$_GET['brandid'];
  }
  elseif(isset($_GET['keyword'])){
  	$query.=" and name like '%".$_GET['keyword']."%'";
    $option='showproducts&keyword='.$_GET['keyword'];
  }
  elseif(isset($_GET['range'])){
  	$query.=" and price<=".$_GET['range'];
    $option='showproducts&range='.$_GET['range'];
  }
  $page=1;
  if(isset($_GET['page'])){
  	$page=$_GET['page'];
  }
  $productsperpage=2;
  $from=($page-1)*$productsperpage;
  $totalProducts=$connect->query($query);
  $totalPages=ceil(mysqli_num_rows($totalProducts)/$productsperpage);

  $query.=" limit $from,$productsperpage";
  $result=$connect->query($query);
?>
<section class="products">
	<?php foreach($result as $item):?>
		<section class="product">
			<section class="img"><a href="?option=productdetail&id=<?=$item['id']?>"><img src="images/<?=$item['image']?>" width="69%"></a></section>
			<section style="font-size:20px";><?=$item['name']?></section>
			<section class="price" style="font-size:20px";><?=number_format($item['price'],0,',','.')?>đ</section>
			<section style="font-size: 10px; "><input class="button" type="button" value="Đặt mua" onclick="location='?option=cart&action=add&id=<?=$item['id']?>';"></section>
		</section>
	<?php endforeach;?>
</section>
<section class="pages">
  <?php for($i=1; $i<=$totalPages; $i++):?>
    <a class="<?=(empty($_GET['page'])&&$i==1)||(isset($_GET['page'])&&$_GET['page']==$i)?'highlight':''?>" href="?option=<?=$option?>&page=<?=$i?>"><?=$i?></a>
  <?php endfor;?>
</section>