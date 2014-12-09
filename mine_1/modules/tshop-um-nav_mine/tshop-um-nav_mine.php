<?php
/**
 内容规则：
 1.PHP页面内容只能包含一个根元素（允许任意标签元素，推荐"div"元素）
 2.根元素类定义包含：class="tb-module tshop-um tshop-um-nav_mine"（class属性可以添加您需要的类选择器定义）
 3.元素class属性值禁止以"tb-"和"J_T"字符开头,除[tb-module, J_TWidget, J_CartPluginTrigger, J_TokenSign]以外
 4.禁止使用<style>标签（元素）
 5.禁止使用<script>标签（元素）
 6.禁止使用<link>标签（元素）
 7.禁止使用标签（元素）的id属性
 8.允许使用元素内联style属性
 */
?>
<div class="tb-module tshop-um tshop-um-nav_mine">
<?php
/**
 * 开始设计PHP页面
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
				echo '<dd><div class="title">'.$item->title.'</div> <div class="price">￥'.$item->price.'</div></dd>';
				// echo $item->id.":".$item->title."<br>";
				echo "</dl>";
			}
		?>
		
	</div>
</div>

