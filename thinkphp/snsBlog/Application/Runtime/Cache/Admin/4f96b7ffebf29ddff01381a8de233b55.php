<?php if (!defined('THINK_PATH')) exit(); if(is_array($list)): foreach($list as $key=>$vo): ?><li>
		<div class="noUserImg"><a class="userPic" href="/wp/snsBlog/admin/personal/view.shtml?id=<?php echo ($vo["user_star"]); ?>"><img src="/wp/snsBlog/Public/<?php echo W('Home/My/getUserVal',array($vo['user_star'],'header_img'));?>" alt="" class="userImg" onerror="javascript:this.src='/wp/snsBlog/Public/images/user_default.png';"></a></div>

		<div class="notiDetail" style="position:relative;">
			<span style="width:90%;display:inline-block">
				<p class="notiUser"><a class="notiName" href="/wp/snsBlog/admin/personal/view.shtml?id=<?php echo ($vo["user_fan"]); ?>"><?php echo W('Home/My/getUserVal',array($vo['user_fan']));?></a><span class="notiDate"><?php echo ($vo["create_date"]); ?></span></p>
				<p class="notiCon">关注了<a class="notiName" href="/wp/snsBlog/admin/personal/view.shtml?id=<?php echo ($vo["user_star"]); ?>"><?php echo W('Home/My/getUserVal',array($vo['user_star']));?></a></p>
			</span>
			
			<span style="display:inline-block;position:absolute;right:10px;margin-top:20px;"><input mid="<?php echo ($vo["id"]); ?>" name="state" type="checkbox"></span>
		</div>

	</li><?php endforeach; endif; ?>