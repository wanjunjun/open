<?php if (!defined('THINK_PATH')) exit(); if(is_array($messages)): foreach($messages as $key=>$msg): ?><li>
		<div class="noUserImg"><a class="userPic" href="/wp/snsBlog/admin/personal/view.shtml?id=<?php echo ($msg["id"]); ?>"><img src="/wp/snsBlog/Public/<?php echo ($msg["header_img"]); ?>" alt="" class="userImg" onerror="javascript:this.src='/wp/snsBlog/Public/images/user_default.png';"></a></div>

		<div class="notiDetail" style="position:relative;">
			<span style="width:90%;display:inline-block">
				<p class="notiUser"><a class="notiName" href="/wp/snsBlog/admin/personal/view.shtml?id=<?php echo ($msg["id"]); ?>"><?php echo ($msg["aliasname"]); ?></a><span class="notiDate"><?php echo ($msg["create_date"]); ?></span></p>
				<p class="notiCon"><?php echo ($msg["content"]); ?></p>
			</span>
						
		</div>

	</li><?php endforeach; endif; ?>