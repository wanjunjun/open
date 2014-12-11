<?php if (!defined('THINK_PATH')) exit(); if(is_array($post_list)): foreach($post_list as $key=>$vo): ?><li>
        <div class="blogMain">

            <div class="blogCon">
                <a href="/wp/snsBlog/post/<?php echo ($vo["id"]); ?>">
                    <img src="/wp/snsBlog/Public/images/pic2.jpg" alt="" height="" width="">
                </a>
            </div>
            <p class="blogTit"><a href="/wp/snsBlog/post/<?php echo ($vo["id"]); ?>"><?php echo ($vo["title"]); ?></a>
            </p>
        </div>
        <div class="blogACBox clearfix">
            <p class="blogAuthor">
                <a class="authorHead">
                    <img src="/wp/snsBlog/Public/images/userS.jpg" alt="" height="" width="">
                </a>
                <a class="authorName"><?php echo W('My/getUserVal',array($vo['user_id'],'aliasname'));?></a>
            </p>

        </div>
        <div class="blogDate clearfix">
            <p class="blogAc">
                <a class="zan">赞(<?php echo W('My/postFavoritesCount',array($vo["id"],2));?>) </a>
                <a class="shoucang">收藏(<?php echo W('My/postFavoritesCount',array($vo["id"],1));?>)</a>
                <a class="comment">评论(<?php echo W('My/postCommentCount',array($vo["id"]));?>)</a>
            </p>
        </div>
    </li><?php endforeach; endif; ?>