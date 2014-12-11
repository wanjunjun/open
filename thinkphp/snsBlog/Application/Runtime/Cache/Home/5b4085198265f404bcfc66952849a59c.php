<?php if (!defined('THINK_PATH')) exit(); if(count($logList) > 0): if(is_array($logList)): foreach($logList as $key=>$vo): ?><li class="clearfix">
		<a class="noticeImg" href="/wp/snsBlog/admin/personal/view.shtml?id=<?php echo ($vo["oper_user_id"]); ?>"><img src="/wp/snsBlog/Public/<?php echo W('Home/My/getUserVal',array($vo['oper_user_id'],'header_img'));?>" onerror="javascript:this.src='/wp/snsBlog/Public/images/user_default.png';"></a>
		<div class="noticeMain">
			<p class="noticeName"><a class="nameTxt" href="/wp/snsBlog/admin/personal/view.shtml?id=<?php echo ($vo["oper_user_id"]); ?>"><?php echo W('Home/My/getUserVal',array($vo['oper_user_id']));?></a></p>
			<p class="noticeCon"><?php echo ($vo['oper_action']); ?>了你的<?php echo W('Home/My/getLogTitle',array($vo['opered_id'], $vo['oper_table']));?></p>
		</div>
	</li><?php endforeach; endif; ?>

<?php else: ?>
<p style="font-size:12px;margin-top:10px;text-align:center;">最近没有消息</p><?php endif; ?>