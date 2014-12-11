<?php if (!defined('THINK_PATH')) exit();?><div class="albumP1">
    <?php if(is_array($img_list)): $i = 0; $__LIST__ = array_slice($img_list,0,1,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><img src="<?php echo ($vo["img_val"]); ?>" alt="" class="albumPic1" width="200" height="252"><?php endforeach; endif; else: echo "" ;endif; ?>
</div>
<div class="albumPO clearfix">  
    <?php if(is_array($img_list)): $i = 0; $__LIST__ = array_slice($img_list,1,4,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><p class="albumP2">
        <img src="<?php echo ($vo["img_val"]); ?>" alt="" class="albumPic2" width="60" height="60">
    </p><?php endforeach; endif; else: echo "" ;endif; ?>
</div>