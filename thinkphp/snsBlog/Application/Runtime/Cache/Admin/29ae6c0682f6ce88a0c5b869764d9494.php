<?php if (!defined('THINK_PATH')) exit();?><form id="personal_form1" action="/wp/snsBlog/admin/personal/addAttention.shtml" method="post">
<input type="hidden" name="id" value="<?php echo ($userId); ?>">
<div class="userMain clearfix">
	<div class="userInfoBox clearfix">
		<div class="userImgBox"><a class="userImg"><img src="/wp/snsBlog/Public/<?php echo W('Home/My/getUserVal',array($userId,'header_img'));?>" alt=""  onerror="javascript:this.src='/wp/snsBlog/Public/images/user_default.png';" ></a></div>
		<div class="userDetaiBox">
			<p class="userName"><a href=""><?php echo W('Home/My/getUserVal',array($userId));?></a></p>
			
		<?php if($userId != $_SESSION['__user__']['id']): ?><p class="deBox"><a class="sendMsg" href="javascript:open_msg('<?php echo ($person["username"]); ?>');"><span class="xsIcon icon_primsg"></span><span class="iconTxt">发私信</span></a></p>
			<p class="deBox">
				<?php if($exist == 0): ?><a class="addAtt" href="javascript:attention();">
						<span class="xsIcon icon_addatt"></span><span class="iconTxt">加关注</span>
					</a>
				<?php else: ?>
					<a class="addAtt" href="#">
						<span class="xsIcon icon_addatt"></span><span class="iconTxt">已关注</span>
					</a><?php endif; ?>
			</p><?php endif; ?>

		</div>
		<div class="userDataBox">
			<!-- 数字超过10000，用数字+“万”字表示，保留一位小数 -->
			<p class="userAttBox">
				<a class="dataBox" href="#">
					<span class="userNum"><?php echo ($attentions); ?></span>
					<span class="userTxt">关注</span>
				</a>
			</p>
			<p class="userFansBox">
				<a class="dataBox" href="#">
					<span class="userNum"><?php echo ($fans); ?></span>
					<span class="userTxt">粉丝</span>
				</a>
			</p>						
		</div>
	</div>
	<div class="nearCome clearfix">
		<p class="nearTit">最近来访者</p>
		<ul class="nearList">
			<?php if(count($visitors) > 0): if(is_array($visitors)): foreach($visitors as $key=>$vo): ?><li><a class="nearImg" href="/wp/snsBlog/admin/personal/view.shtml?id=<?php echo ($vo["visitor_id"]); ?>"><img src="/wp/snsBlog/Public/<?php echo W('Home/My/getUserVal',array($vo['visitor_id'],'header_img'));?>" onerror="javascript:this.src='/wp/snsBlog/Public/images/user_default.png';"></a></li><?php endforeach; endif; ?>

			<?php else: ?>
			<p style="font-size:12px;">最近没有来访者</p><?php endif; ?>				
		</ul>

	</div>				
</div>
</form>
<script type="text/javascript">
	function attention(){
		$("#personal_form1").submit();
	}
</script>