<?php
/**
 ���ݹ���
 1.PHPҳ������ֻ�ܰ���һ����Ԫ�أ����������ǩԪ�أ��Ƽ�"div"Ԫ�أ�
 2.��Ԫ���ඨ�������class="tb-module tshop-um tshop-um-nav_mine"��class���Կ����������Ҫ����ѡ�������壩
 3.Ԫ��class����ֵ��ֹ��"tb-"��"J_T"�ַ���ͷ,��[tb-module, J_TWidget, J_CartPluginTrigger, J_TokenSign]����
 4.��ֹʹ��<style>��ǩ��Ԫ�أ�
 5.��ֹʹ��<script>��ǩ��Ԫ�أ�
 6.��ֹʹ��<link>��ǩ��Ԫ�أ�
 7.��ֹʹ�ñ�ǩ��Ԫ�أ���id����
 8.����ʹ��Ԫ������style����
 */
?>
<div class="tb-module tshop-um tshop-um-nav_mine">
<?php
/**
 * ��ʼ���PHPҳ��
 */
	// echo $_MODULE["key"];
	// $param = json_decode($_MODULE["cate_1"]);
	// echo $param[0]->rid;
?>
	<div class="hot">
		
		<?php
			/*$categorys = $shopCategoryManager->queryAll();
			foreach ($categorys as $cate) {
				echo $cate->id.":".$cate->name."<br>";
			}*/
			
			// $items = $itemManager->queryByCategory($param[0]->rid, "hotsell", 10);
			$items = $itemManager->queryByKeyword($_MODULE["key"], "hotsell", 20);
			$count = 1;
			foreach ($items as $item) {
				
				if($count%3 == 0){
					echo '<dl class="item last">';	
				}else{
					echo '<dl class="item">';	
				}
				$count++;

				echo '<dt><a href="#"><img src="'.$item->getPicUrl(230).'"/></a></dt>';
				echo '<dd><div class="title">'.$item->title.'</div> <div class="price">��'.$item->price.'</div></dd>';
				// echo $item->id.":".$item->title."<br>";
				echo "</dl>";
			}
		?>
		
	</div>
</div>

