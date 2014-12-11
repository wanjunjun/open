<?php if (!defined('THINK_PATH')) exit(); if(count($visitors) > 0): if(is_array($visitors)): foreach($visitors as $key=>$vo): ?><li><a class="nearImg" href="/wp/snsBlog/admin/personal/view.shtml?id=<?php echo ($vo["visitor_id"]); ?>"><img src="/wp/snsBlog/Public/<?php echo W('Home/My/getUserVal',array($vo['visitor_id'],'header_img'));?>" onerror="javascript:this.src='/wp/snsBlog/Public/images/user_default.png';"></a></li><?php endforeach; endif; ?>

<?php else: ?>
<p style="font-size:12px;">最近没有来访者</p><?php endif; ?>