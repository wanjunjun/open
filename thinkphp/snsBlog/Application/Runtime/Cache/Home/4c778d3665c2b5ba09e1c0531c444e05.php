<?php if (!defined('THINK_PATH')) exit(); if(is_array($logList)): foreach($logList as $key=>$vo): ?><li class="clearfix">
		<a class="noticeImg"><img src="/wp/snsBlog/Public/<?php echo W('My/getUserVal',array($vo['oper_user_id'],'header_img'));?>" alt></a>
		<div class="noticeMain">
			<p class="noticeName"><a class="nameTxt"><?php echo W('My/getUserVal',array($vo['oper_user_id']));?></a></p>
			<p class="noticeCon">转采了的专辑<a class="noAlName">小小花蛤</a>到<a class="noAlNameT">小小花蛤</a></p>
		</div>
	</li><?php endforeach; endif; ?>