<?php if (!defined('THINK_PATH')) exit(); if(is_array($logs)): foreach($logs as $key=>$msg): ?><li>
		<div class="noUserImg"><a class="userPic" href="/wp/snsBlog/admin/personal/view.shtml?id=<?php echo ($msg["id"]); ?>"><img src="/wp/snsBlog/Public/<?php echo ($msg["header_img"]); ?>" alt="" class="userImg" onerror="javascript:this.src='/wp/snsBlog/Public/images/user_default.png';"></a></div>

		<div class="notiDetail" style="position:relative;">
			<span style="width:90%;display:inline-block">
				<p class="notiUser"><a class="notiName" href="/wp/snsBlog/admin/personal/view.shtml?id=<?php echo ($msg["id"]); ?>"><?php echo ($msg["aliasname"]); ?></a><span class="notiDate"><?php echo ($msg["oper_date"]); ?></span></p>
				<p class="notiCon"><?php echo ($msg["oper_action"]); ?>了你的<?php echo W('Home/My/getLogTitle',array($msg['rid'], $msg['oper_table']));?></p>
			</span>
			
			<span style="display:inline-block;position:absolute;right:10px;margin-top:20px;"><input mid="<?php echo ($msg["mid"]); ?>" name="state" type="checkbox"></span>
		</div>

	</li><?php endforeach; endif; ?>