<?php if (!defined('THINK_PATH')) exit(); if(is_array($comment_list)): foreach($comment_list as $key=>$vo): ?><li class="clearfix">
        <div class="noUserImg">
            <a class="userPic" href="#">
                <img src="/wp/snsBlog/Public/images/userL.jpg" alt="" class="userImg">
            </a>
        </div>
        <div class="notiDetail">
            <div class="notiFBox">
                <p class="notiUser"><a class="notiName" href="#">
                <?php echo W('My/getUserVal',array($vo['user_id'],'aliasname'));?></a>
                    <span class="notiDate"><?php echo ($vo["create_date"]); ?></span>
                </p>
                <p class="notiR"> <a class="notiRly">回复</a><a class="notiRly">举报</a>
                </p>
            </div>
            <p class="notiCon clearfix"><?php echo ($vo["content"]); ?></p>
        </div>

    </li><?php endforeach; endif; ?>