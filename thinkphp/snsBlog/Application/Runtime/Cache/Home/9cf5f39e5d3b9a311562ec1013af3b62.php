<?php if (!defined('THINK_PATH')) exit(); if(is_array($post_list)): foreach($post_list as $key=>$vo): ?><li>
        <div class="blogMain">

            <?php if($vo["has_picture"] == 2): ?><div class="blogCon">
                    <a href="/wp/snsBlog/post/<?php echo ($vo["id"]); ?>">
                        <img src="<?php echo W('My/getImgByPostId',array($vo['id']));?>" alt="" height="" width="">
                    </a>
                </div>
                <p class="blogTit"><a href="/wp/snsBlog/post/<?php echo ($vo["id"]); ?>"><?php echo ($vo["title"]); ?></a>
                </p>
                <?php else: ?>
                <p class="blogTit"><a href="/wp/snsBlog/post/<?php echo ($vo["id"]); ?>"><?php echo ($vo["title"]); ?></a>
                </p>
                <div class="blogCon">
                    <a href="/wp/snsBlog/post/<?php echo ($vo["id"]); ?>">
                        <span class="conTxt">
                            <?php echo (htmlspecialchars_decode($vo["content"])); ?></span>
                    </a>
                </div><?php endif; ?>
        </div>
        <div class="blogACBox clearfix">
            <p class="blogAuthor">
                <a class="authorHead" href="/wp/snsBlog/admin/personal/view.shtml?id=<?php echo ($vo["user_id"]); ?>">
                    <img src="/wp/snsBlog/Public/<?php echo W('My/getUserVal',array($vo['user_id'],'header_img'));?>" alt="" height="26" width="26">
                </a>
                <a class="authorName"><?php echo W('My/getUserVal',array($vo['user_id'],'aliasname'));?></a>
            </p>

        </div>
        <div class="blogDate clearfix">
            <p class="blogAc">
                <a class="zan <?php echo W('My/postFavoritesHave',array($vo["id"],2));?>" post_id="<?php echo ($vo["id"]); ?>">赞(<?php echo W('My/postFavoritesCount',array($vo["id"],2));?>)</a>
                <a class="shoucang <?php echo W('My/postFavoritesHave',array($vo["id"],1));?>" post_id="<?php echo ($vo["id"]); ?>">收藏(<?php echo W('My/postFavoritesCount',array($vo["id"],1));?>)</a>
                <a class="comment" post_id="<?php echo ($vo["id"]); ?>">评论(<?php echo W('My/postCommentCount',array($vo["id"]));?>)</a>
            </p>
        </div>
    </li><?php endforeach; endif; ?>