<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtmBox">
<head>
   
    <title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/wp/snsBlog/Public/css/reset-min.css">
<link rel="stylesheet" type="text/css" href="/wp/snsBlog/Public/css/style.css">
<script type="text/javascript" src="/wp/snsBlog/Public/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/wp/snsBlog/Public/js/Common.js"></script>


    <style type="text/css">
    #tiles {
        text-align: center;
        list-style-type: none;
        position: relative;
        margin: 0;
        padding: 0;
    }
    #tiles li {
        width: 208px;
        background-color: #fff;
        border: solid 1px #e5e5e5;
        display: none;
        cursor: pointer;
    }
    </style>
    <script type="text/javascript" src="/wp/snsBlog/Public/js/plugins/Wookmark/jquery.wookmark.js"></script>
    <script type="text/javascript" src="/wp/snsBlog/Public/js/plugins/Wookmark/jquery.imagesloaded.js"></script>
</head>

<body>


    <div class="xsWrap">
        <!-- 顶导 -->
        	<div class="topNav clearfix">
			<div class="navBox">
				<div class="navSquare"><a class="navMode" href="/wp/snsBlog/cate"><span class="navLTxt">广场</span><em class="xsIcon navMore"></em></a>
					<div class="squareLayer" style="z-index:1000;">
						<ul class="layerColor">
							<li class="layerL"><a href="/wp/snsBlog/cate/1" class="colorIcon photoBox">
							<span class="xsIcon icon_photoS"></span></a>
							<a class="colorTxt" href="/wp/snsBlog/cate/1" >摄影</a></li>
							<li class="layerL"><a href="/wp/snsBlog/cate/2" class="colorIcon beautyBox">
							<span class="xsIcon icon_beautyS"></span></a>
							<a class="colorTxt" href="/wp/snsBlog/cate/2" >美妆服饰</a></li>
							<li class="layerL"><a href="/wp/snsBlog/cate/3" class="colorIcon beautyBox">
							<span class="xsIcon icon_foodS"></span></a>
							<a class="colorTxt" href="/wp/snsBlog/cate/3" >美食</a></li>
							<li class="layerL"><a href="/wp/snsBlog/cate/4" class="colorIcon sportBox">
							<span class="xsIcon icon_sportS"></span></a>
							<a class="colorTxt" href="/wp/snsBlog/cate/4" >运动</a></li>
							<li class="layerL"><a href="/wp/snsBlog/cate/5" class="colorIcon techBox">
							<span class="xsIcon icon_techS"></span></a>
							<a class="colorTxt" href="/wp/snsBlog/cate/5" >科技生活
							</a></li>
							<li class="layerL"><a href="/wp/snsBlog/cate/6" class="colorIcon gameBox">
							<span class="xsIcon icon_gameS"></span></a>
							<a class="colorTxt" href="/wp/snsBlog/cate/6" >游戏</a>
							</li>
							<li class="layerL"><a href="/wp/snsBlog/cate/7" class="colorIcon homeBox">
							<span class="xsIcon icon_homeS"></span></a>
							<a class="colorTxt" href="/wp/snsBlog/cate/7" >家居设计
							</a></li>
							<li class="layerL"><a href="/wp/snsBlog/cate/8" class="colorIcon petBox">
							<span class="xsIcon icon_petS"></span></a>
							<a class="colorTxt" href="/wp/snsBlog/cate/8" >宠物</a>
							</li>
							<li class="layerL"><a href="/wp/snsBlog/cate/9" class="colorIcon musicBox">
							<span class="xsIcon icon_musicS"></span></a>
							<a class="colorTxt" href="/wp/snsBlog/cate/9" >音乐</a></li>
							<li class="layerL"><a href="/wp/snsBlog/cate/10" class="colorIcon carBox">
							<span class="xsIcon icon_carS"></span></a>
							<a class="colorTxt" href="/wp/snsBlog/cate/10" >汽车</a>
							</li>

						</ul>					

					</div>

				</div>
				<div class="navSearch">
					<div class="navSearBox"><input id="header_keyword_" type="text" placeholder="请输入关键字" class="navSearInput"><span class="xsIcon icon_search header_icon_search"></span></div>
				</div>
			</div>

			<div class="navR">
				<!-- 已登录 -->
				<?php if(session('__user__') != null): ?><ul class="navRList clearfix">
					<li class="navli userAdd"><a class="navMode" href="##" onclick="diplayAddBlog('click')" ><span class="xsIcon icon_add"></span></a>
						<!-- 发布弹层 点击【+】出现 -->
						<div class="pubLayer">
							<p class="pubLi"><a href="/wp/snsBlog/post/add" class="logLiTxt">发布文章</a></p>
							<!-- 点击【发布专辑】出现 创建专辑弹层 -->	
							<p class="pubLi"><a href="/wp/snsBlog/album/add" class="logLiTxt">创建专辑</a></p>	
						</div>
						<!-- /发布弹层 -->
					</li>
					<li class="navli usermsg"><a class="navMode" href="/wp/snsBlog/admin/personal/getMsgList.shtml"><span class="xsIcon icon_msg"></span><em class="msgNum"><span id="msg_count">0</span>+</em></a></li>
					<li class="navli userNotice"><a class="navMode" href="javascript:showLog();"><span class="xsIcon icon_notice"></span></a>
						<div id="noticeLayer" class="noticeLayer">
							<p class="noticeTit">我的消息</p>
							<!-- 通知弹层 点击【我的消息】出现 -->
							<div class="noticeListBox"><!-- test <?php echo W('Home/My/getLogTitle', array(2, 'post_favorites'));?> -->
								<ul class="noticeList">										
									<?php echo W('Home/My/getPostLog');?>																		
								</ul>
								<p class="noticeMore"><a class="noticeMoreTxt" href="/wp/snsBlog/admin/personal/getLogList.shtml">查看所有消息>></a></p>
							</div>
							<!-- /通知弹层 -->
						</div>

					</li>
					<li class="navli userLog"><a class="navMode" href="/wp/snsBlog/admin/personal/view.shtml?id=<?php echo ($_SESSION['__user__']['id']); ?>"><img src="/wp/snsBlog/Public/<?php echo ($_SESSION['__user__']['header_img']); ?>" alt="" class="headImg" onerror="javascript:this.src='/wp/snsBlog/Public/images/user_default.png';"><em class="xsIcon navMore"></em></a>
						<!-- 用户弹层 -->
						<div class="logLayer">
							<p class="logLi"><a href="/wp/snsBlog/admin/personal/getLogList.shtml" class="logLiTxt">消息箱</a></p>	
							<p class="logLi"><a href="/wp/snsBlog/admin/personal/getAttentionList.shtml" class="logLiTxt">我的关注</a></p>	
							<p class="logLi"><a href="/wp/snsBlog/admin/user/setUser" class="logLiTxt">用户设置</a></p>	
							<p class="logLi"><a href="/wp/snsBlog/admin/user/logout" class="logLiTxt">退出登录</a></p>	
						</div>
						<!-- /用户弹层 -->
					</li>
				</ul>
				<!-- /已登录 -->
				<?php else: ?>
				<!-- 未登录 /未登录 -->
				<div class="unLogList"><a class="btnB" href="javascript:open_login('<?php echo ($_SERVER['REQUEST_URI']); ?>');">登录</a><a class="btnB" href="javascript:open_reg();">注册</a></div><?php endif; ?>

			</div>

			<div class="navLogo"><a class="logoBox" href="/wp/snsBlog"><img src="/wp/snsBlog/Public/images/logoM.png" alt=""></a></div>
		</div>
		<script type="text/javascript">
		$(function(){
			getMsg();
			setInterval("getMsg()",1000*60);

			$("#header_keyword_").keydown(function(e){				
            　if(e.keyCode == 13){
                 var keyword = $(this).val();
                if(keyword==null||keyword==""||keyword.length<2){
                    alert("请输入最少2个字符的关键字");
                    return;
                }
                location.href="/wp/snsBlog/cate/search?keyword="+keyword;
                 return false;
                }
            });
            $(".header_icon_search").on('click',function(){
            	 var keyword = $("#header_keyword_").val();
                if(keyword==null||keyword==""||keyword.length<2){
                    alert("请输入最少2个字符的关键字");
                    return;
                }
                location.href="/wp/snsBlog/cate/search?keyword="+keyword;
                 return false;
                
            });
		});

		function getMsg(){
			$.post("/wp/snsBlog/admin/personal/getMsgCount.shtml",{} ,function(data){
				
				 if (data.success){
				 	$("#msg_count").text(data.count);
				 }else{
				 	
				 }
			});
		}
		function diplayAddBlog(type){
			if ("click"==type) {
				$(".pubLayer").toggle();
			} else{
				$(".pubLayer").hide();
			};
					
		}
		
		function showLog(){
			if($('#noticeLayer').is(":hidden")){
				$('#noticeLayer').show();	
			}else{
				$('#noticeLayer').hide();
			}
			
		}
		</script>
        <!-- /顶导 -->
        <!-- main -->
        <div class="mainBox clearfix">

            <!-- 分类nav -->
            <div class="sortsNav">
                <div class="sortsFbox clearfix">
                    <h3 class="sortsTit"><?php echo ($category); ?></h3>
                </div>
                <div class="showMain clearfix">
                    <div class="showNavBox clearfix">
                        <ul class="showNav">
                            <li><a class="showMod" href="/wp/snsBlog/cate/<?php echo ($category_id); ?>/post"><?php echo ($post_count); ?> 文章</a>
                            </li>
                            <li><a class="showMod cur" href="#"><?php echo ($album_count); ?> 专辑</a>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
            <!-- /分类nav -->

            <!-- 瀑布流 -->
            <div class="fallMain">
                <div class=" " id="wmain" style="position: relative;margin-top:10px;">
                    <ul id='tiles'>
                        <!-- <li>
                            <a class="albumAddBox" href="/wp/snsBlog/album/add?cate=<?php echo ($category_id); ?>">
                                <span class="albumAdd"></span>
                                <p class="albumAddTxt">添加专辑</p>
                            </a>
                        </li> -->
						<?php if(is_array($album_list)): foreach($album_list as $key=>$vo): ?><li>
                            <div class="albumMain">
                                <a class="albumImgBox" href="/wp/snsBlog/album/<?php echo ($vo["id"]); ?>">
                                    <?php echo W('My/getImg4Album',array($vo['id']));?>
                                </a>
                            </div>
                            <div class="albumACBox clearfix">
                                <p class="albumTit">
                                    <a class="albumName" href="/wp/snsBlog/album/<?php echo ($vo["id"]); ?>"><?php echo ($vo["name"]); ?></a>
                                </p>
                                <p class="albumAtt"><a class="btnC" href="##" album_id='<?php echo ($vo["id"]); ?>'>关注</a>
                                </p>
                            </div>
                        </li><?php endforeach; endif; ?>



                    </ul>


                </div>
            </div>
            <!-- /瀑布流 -->

        </div>

        <!-- /main -->

    </div>

    <!-- 弹层 -->
    <link rel="stylesheet" href="/wp/snsBlog/Public/js/plugins/validator-0.7.3/jquery.validator.css">
<script type="text/javascript" src="/wp/snsBlog/Public/js/plugins/validator-0.7.3/jquery.validator.js"></script>
<script type="text/javascript" src="/wp/snsBlog/Public/js/plugins/validator-0.7.3/local/zh_CN.js"></script>
<script type="text/javascript" src="/wp/snsBlog/Public/js/plugins/preview/uploadPreview.min.js"></script>
<!--弹出层-->
<!-- 弹层蒙层（黑色半透明） -->
<div class="mask" style="display:none;z-index:9998"></div>
<!-- 弹层蒙层（黑色半透明） -->

<!-- 登录弹层 -->
<div class="xsLoginLayer" style="display:none; top:100px; left:400px;background: #fff;z-index:9999;">
    <a class="closeBtn">
        <span class="xsIcon icon_close"></span>
    </a>
    <p class="logoBox">
        <span class="logoImg logoL"></span>
    </p>
    <p class="slogan">－ slogan －</p>
    <div class="LaylogWrap">
        <div class="LayLogBox">
            <p class="logInput logName">
                <input type="text" name="username" placeholder="用户名">
            </p>
            <p class="logInput logPsw">
                <input type="password" name="password" id="key_password" placeholder="密码" >
            </p>
        </div>
        <p class="LaylogBtn"><a class="logBtn" href="javascript:login();">登录</a>
        </p>
        <p class="LayOth clearfix"><a class="forgetPsw" href="javascript:openDialog('findPassword')">忘记密码></a>
            <span class="noAcc">还没有账号？ <a class="cliReg" href="javascript:open_mail_reg();">点击注册></a>
            </span>
        </p>
    </div>
    <!-- <div class="LayShareBox">
        <a class="shareIconBtn shareLogWeibo" href="#"></a>
        <a class="shareIconBtn shareLogQq" href="#"></a>
        <a class="shareIconBtn shareLogDoban" href="#"></a>
        <a class="shareIconBtn shareLogRen" href="#"></a>
    </div> -->
</div>
<!-- /登录弹层 -->

<!-- 注册弹层 -->
<div id="xsReg1" class="xsRegLayer" style="display:none; top:100px; left:400px;z-index:9999">
<form id="form0">
    <a class="closeBtn">
        <span class="xsIcon icon_close"></span>
    </a>
    <p class="logoBox">
        <span class="logoImg logoL"></span>
    </p>
    <p class="regWay"><a href="javascript:open_mail_reg();">使用邮箱注册</a></p>
    <div class="LayRegWrap" style="position:relative;">
        <div class="LayRegBox">
            <p class="logInput logName">
                <input type="text" name="regname" placeholder="用户名" class="xsInput regInput1" data-rule="required;remote[/wp/snsBlog/admin/user/regCheck.shtml]">
            </p>
            <!-- <p class="logInput logVer">
                <input type="text" name="code" placeholder="验证码" class="xsInput regInput2">
                <img id="mcode" style="cursor:pointer;" src="/wp/snsBlog/home/index/ver.shtml?" alt="" onclick="flash_img('mcode')"/>
                <span class="verImg">
                </span>
            </p> -->
        </div>
        <p class="LaylogBtn"><a class="logBtn" href="javascript:reg();">注册</a>
        </p>
        <div id="regErr" style="display:none;position:absolute;right:5px;bottom:5px;color:red;width:120px;">验证码错误</div>
    </div>
    
    <!-- <div class="LayShareBox">
        <p class="regWay">使用第三方账号注册</p>
        <a class="shareIconBtn shareLogWeibo" href="#"></a>
        <a class="shareIconBtn shareLogQq" href="#"></a>
        <a class="shareIconBtn shareLogDoban" href="#"></a>
        <a class="shareIconBtn shareLogRen" href="#"></a>
    </div> -->
</form>    
</div>
<!-- /注册弹层 -->

<!-- 注册弹层 -->
<div id="xsReg2" class="xsRegLayer" style="display:none; top:100px; left:400px;z-index:9999">
    <a class="closeBtn">
        <span class="xsIcon icon_close"></span>
    </a>
    <p class="logoBox">
        <span class="logoImg logoL"></span>
    </p>
    <p class="regTipN">注册成功！</p>
    <div class="LayRegWrap">
        <div class="LayRegBox">
            
        </div>
        <p class="LayRegBack"><a class="" href="/wp/snsBlog">返回登录首页>></a>
        </p>
    </div>

</div>
<!-- /注册弹层 -->

<div id="mailReg1" class="xsRegLayer" style="display:none; top:100px; left:400px;z-index:9999">
<form id="form1">
    <a class="closeBtn">
        <span class="xsIcon icon_close"></span>
    </a>
    <p class="logoBox">
        <span class="logoImg logoL"></span>
    </p>
    <p class="regWay">邮箱注册</p>
    <div class="LayRegWrap" style="position:relative;">
        <div class="LayRegBox">
            <p class="logInput logName">
                <input type="text" name="mailname" placeholder="邮箱名" class="xsInput regInput1" data-rule="required;email;remote[/wp/snsBlog/admin/user/regMailCheck.shtml]">
            </p>
            <p class="logInput logVer">
                <input type="text" name="code" placeholder="验证码" class="xsInput regInput2">
                <img id="mcode" style="cursor:pointer;" src="/wp/snsBlog/home/index/ver.shtml?" alt="" onclick="flash_img('mcode')"/>
                <span class="verImg">
                </span>
            </p>
        </div>
        <p class="LaylogBtn"><a class="logBtn" href="javascript:mail_reg();">注册</a>
        </p>
        <div id="err_msg" style="display:none;position:absolute;right:5px;bottom:5px;color:red;width:120px;">验证码错误</div>
    </div>
</form>
</div>

<!-- 提示弹层 -->
<div id="mailReg2" class="xsWLayer warnLayer" style=" display:none; top:300px; left:400px;z-index:9999">
    <a class="closeBtn">
        <span class="xsIcon icon_close"></span>
    </a>

    <div class="WLayerMain">
        <p class="WLayerTit2">提示</p>
        <div class="layerCon">
            <p class="regNotice">验证邮件已发送至 <span id="regmail" class="userEmail"></span><br>请<a id="toMail" class="cheMail" href="#" target="_blank">点击查收邮件</a>激活帐号。</p>
        </div>
        <p class="layerBtn"><a class="btnA" href="javascript:closeDialog();">离开</a>
        </p>

    </div>
</div>

<!-- 创建专辑弹层 -->
<div class="xsWLayer addAlbumLayer" 
style="display:none; top:300px; left:400px;z-index:9999">
    <a class="closeBtn">
        <span class="xsIcon icon_close"></span>
    </a>
    <div class="WLayerMain">
        <p class="WLayerTit">创建专辑</p>
        <div class="addAForm">
            <dl class="clearfix">
                <dt class="formTit">专辑标题</dt>
                <dd class="formInputBox">
                    <p class="formInput">
                        <input name="album_name" type="text" placeholder="请输入至少4个字符的专辑名" class="layInput">
                    </p>
                    <p class="formTip album_name_tip" style="display:none;">
                        <span class="xsIcon icon_wrong "></span>请输入至少4个字符的专辑名</p>
                </dd>
            </dl>
            <dl class="clearfix">
                <dt class="formTit">专辑分类</dt>
                <dd class="formInputBox">
                    <p class="formInput">
                        <select class="layInput laysel" name="album_category_id">
                                        <option value="1">摄影</option>
                                        <option value="2">美妆服饰</option>
                                        <option value="3">美食</option>
                                        <option value="4">运动</option>
                                        <option value="5">科技生活</option>
                                        <option value="6">游戏</option>
                                        <option value="7">家居设计</option>
                                        <option value="8">宠物</option>
                                        <option value="9">音乐</option>
                                        <option value="10">汽车</option>
                                        <option value="11">其它</option>
                                    </select>
                    </p>
                    <!-- <p class="formTip">
                        <span class="xsIcon icon_wrong"></span>请选择分类</p> -->
                </dd>
            </dl>
            <p class="formBtn"><a class="btnD" href="javascript:save_album();">创建专辑</a>
            </p>
        </div>

    </div>

</div>
<!-- /创建专辑弹层 -->

<!-- 找回密码弹层 -->
    <div id="findPassword" class="xsRegLayer" style="display:none; top:100px; left:400px;z-index:9999">
        <form id="findPassword_form">
        <a class="closeBtn"><span class="xsIcon icon_close"></span></a>
        <p class="logoBox"><span class="logoImg logoL"></span></p>
        <p class="regWay">找回密码</p>
        <div class="LayRegWrap" style="position:relative;">
            <div class="LayRegBox">
                <p class="logInput logName"><input type="text" name="reg_mail" placeholder="注册邮箱" class="xsInput regInput1" data-rule="required;email"></p>
                <p class="logInput logVer"><input type="text" name="code2" placeholder="验证码" class="xsInput regInput2" >
                <img id="mcode2" style="cursor:pointer;" src="/wp/snsBlog/home/index/ver.shtml?id=2" alt="" onclick="flash_img('mcode2')"/>
                </p>
            </div>
            <p class="LaylogBtn"><a class="logBtn" href="javascript:mail_find();">发送邮件</a></p>
            <div id="findPasswordErr" style="display:none;position:absolute;right:5px;bottom:5px;color:red;width:120px;"></div>
        </div>
        <div class="LayMgeBox">
            <p class="regWay"><a href="javascript:open_login();">又想起来了</a></p>
            
        </div>
        </form>
    </div>
    <!-- /找回密码弹层 -->

    <!-- 提示弹层 -->
    <div id="findPasswordTip" class="xsWLayer warnLayer" style=" display:none; top:300px; left:400px;z-index:9999">
        <a class="closeBtn"><span class="xsIcon icon_close"></span></a>

        <div class="WLayerMain">
            <p class="WLayerTit2">提示</p>
            <div class="layerCon">
                <p class="warnTxt">重置密码链接已发送到您的邮箱，请<a id="toMail2" class="cheMail" href="#" target="_blank">点击查收邮件</a></p>
            </div>
            <p class="layerBtn"><a class="btnA" href="javascript:closeDialog();">确定</a></p>

        </div>
    </div>

    <!-- /提示弹层 -->


    <div id="sendMsg" class="xsRegLayer" style="display:none; top:100px; left:400px;z-index:9999">
        <a class="closeBtn">
            <span class="xsIcon icon_close"></span>
        </a>
        <p class="logoBox">
            <span class="logoImg logoL"></span>
        </p>
        <p class="regWay">给<span id="person"></span>发私信</p>
        <div class="LayRegWrap">
            <div class="LayRegBox">
                <p class="logInput logName">
                    <textarea id="msg" class="xsArea fwA01"></textarea>
                </p>            
            </div>
            <p class="LaylogBtn"><a class="logBtn" href="javascript:send_msg();">发送</a>
            </p>
        </div>       
    </div>

    <!-- 提示弹层 -->
    <div id="sendMsg2" class="xsWLayer warnLayer" style=" display:none; top:300px; left:400px;z-index:9999">
        <a class="closeBtn">
            <span class="xsIcon icon_close"></span>
        </a>

        <div class="WLayerMain">
            <p class="WLayerTit2">提示</p>
            <div class="layerCon">
                <p class="warnTxt">发送成功！</p>
            </div>
            <p class="layerBtn"><a class="btnA">确定</a>
            </p>

        </div>
    </div>


   


<!-- 转转隐藏uri -->
<input type="hidden" name="uri_hidden" >


<script type="text/javascript">
        $(function(){
        	$(".closeBtn").bind({
        		click: function(){
        			// $(".xsRegLayer").hide();
        			// $(".xsWLayer").hide();
                    $("div[class$='Layer']").hide(); 
        			$(".mask").hide();
        		}
        	});

            $("#key_password").keydown(function(e){
            　if(e.keyCode == 13){
                 login();
                 return false;
                }
            });

            

        });
        function closeDialog(){
            // $(".xsRegLayer").hide();
            // $(".xsWLayer").hide();
            $("div[class$='Layer']").hide(); 
            $(".mask").hide();
        }
		function open_login(uri){
			//uri = uri;
            $("input[name=uri_hidden]").val(uri);
			$(".mask").show();
			$(".xsLoginLayer").show();
		}
		function login(){
			var username = $("input[name=username]").val();
			var password = $("input[name=password]").val();
			if(username==null || username==""){
				alert("用户名不能为空！");
				return;
			}
			if(password==null || password==""){
				alert("密码不能为空！");
				return;
			}
			$.post("/wp/snsBlog/admin/user/login",{'username':username,'password':password},function(data){
				 //alert(data.success);
                 var uri =  $("input[name=uri_hidden]").val();
				 if (data.success){
                     if(uri==null || uri==""){
                    location.href='/wp/snsBlog/cate';
                    }else{
                          location.href=uri;
                    }
				 }else{
                    alert("用户名密码错误或帐号未激活，导致登录失败！");
                 }
                
				 
			});
                
		}

		function open_reg(inLogin){
            if(inLogin=='inLogin'){
                $(".xsLoginLayer").hide();
            }
			$(".mask").show();
			$("#xsReg1").show();
		}

		function reg(){
            var valid = $('input[name="regname"]').trigger("validate");               
            if (!$('input[name="regname"]').isValid()) {
                return;
            }
			$("#err_msg").hide();
			var username = $("input[name=regname]").val();
			var code = $("input[name=code]").val();
			$.post("/wp/snsBlog/admin/user/reg",{'username':username,'code':code},function(data){
				 //alert(data.success);
				 if (data.success){
				 	$(".mask").hide();	
				 	$("#xsReg1").hide();	
				 	$("#xsReg2").show();

                    $("input[name=regname]").val("");    
                    $("#form0").validator( "cleanUp" );

				 }else{
				 	$("#regErr").show();	
				 	flash_img('mcode');
				 };//undo 
			})
		}

		function open_mail_reg(){
			//$(".mask").show();
			$("#xsReg1").hide();
			$("#mailReg1").show();
		}

		function mail_reg(){
            var valid = $('input[name="mailname"]').trigger("validate");               
            if (!$('input[name="mailname"]').isValid()) {
                return;
            }
			var mailname = $("input[name=mailname]").val();
            var code = $("input[name=code]").val();
			$.post("/wp/snsBlog/admin/active/mailReg",{'mailname':mailname, 'code':code},function(data){
				 //alert(data.success);
				 if (data.success){
				 	$(".mask").hide();	
				 	$("#mailReg1").hide();	
				 	$("#mailReg2").show();

                    $("#regmail").text(mailname);
                    var m1 = mailname.substring(mailname.indexOf("@")+1);
                    var domain = m1.substring(0,m1.indexOf("."));
                    $("#toMail").attr("href","http://mail."+domain+".com");

                    $("input[name=mailname]").val("");
                    $("#form1").validator( "cleanUp" );

				 }else{
				 	$("#err_msg").show();	
                    flash_img('mcode');
				 };//undo 

                 
			})	
		}

		function flash_img(img){
			$("#"+img).attr("src", $("#"+img).attr("src")+"&?");
		}

        function open_album(){
            $(".mask").show();
            $(".addAlbumLayer").show();
        }
        function save_album(){
            var name = $("input[name=album_name]").val();
            if(name==null||name==""||name.length<4){
                $(".album_name_tip").show();
                return;
            }
            var category_id = $("select[name=album_category_id]").val();
            $.post("/wp/snsBlog/album/saveAjax",
                {name:name,category_id:category_id},function(data){
                  var option = "<option value='"+data.id+"' >"+data.name+"</option>"  
                  $("select[name=album_id]").append(option);
                  $(".mask").hide();
                  $(".addAlbumLayer").hide();

            });
        }

        function openDialog(id){
            closeDialog();
            $(".mask").show();
            $("#"+id).show();
        }

        function mail_find(){
            var valid = $('input[name="reg_mail"]').trigger("validate");               
            if (!$('input[name="reg_mail"]').isValid()) {
                return;
            }
            var mailname = $("input[name=reg_mail]").val();
            var code2 = $("input[name=code2]").val();
            $.post("/wp/snsBlog/admin/active/sendFindMail",{'mailname':mailname, 'codeId':2, 'code2':code2},function(data){
                 //alert(data.success);
                 if (data.success){
                    openDialog('findPasswordTip');

                    $("#regmail").text(mailname);
                    var m1 = mailname.substring(mailname.indexOf("@")+1);
                    var domain = m1.substring(0,m1.indexOf("."));
                    $("#toMail2").attr("href","http://mail."+domain+".com");

                    $("input[name=reg_mail]").val("");
                    $("#findPassword_form").validator( "cleanUp" );

                 }else{
                    $("#findPasswordErr").show();   
                    $("#findPasswordErr").text(data.msg);
                 };//undo 

                 
            })  
        }

         /*$(function(){
            $(".closeBtn").bind({
                click: function(){
                    $(".xsRegLayer").hide();
                    $(".xsWLayer").hide();
                    $(".mask").hide();
                }
            });
        });*/
        

        function open_msg(person){
            $("#person").text(person);
            $(".mask").show();
            $("#sendMsg").show();
        }

        function send_msg(){
            var msg = $("#msg").val();
            
            var uid = $("#uid").val();
            $.post("/wp/snsBlog/admin/personal/sendMsg",{'msg':msg,'uid':uid},function(data){
                 //alert(data.success);
                 if (data.success){
                    $(".mask").hide();  
                    $("#sendMsg").hide();   
                    //$("#sendMsg2").show();
                 }//undo 
            })
        }

        jQuery(document).ready(function(){
            $(".closeBtn").on("click",function(e){
                e.preventDefault();
                $(".mask").hide();
                $(this).closest( "div" ).hide();
            });
        });
	</script>

    <!-- 弹层） -->

    <script type="text/javascript">
    <!--wookmark 瀑布流js-->
    (function($) {
    	var page_no = 2;//分页数 从第2页开始
        var category_id = '<?php echo ($category_id); ?>';
        var $tiles = $('#tiles'),
            $handler = $('li', $tiles),
            $main = $('#wmain'),
            $window = $(window),
            $document = $(document),
            options = {
                autoResize: true, // This will auto-update the layout when the browser window is resized.
                container: $main, // Optional, used for some extra CSS styling
                offset: 20, // Optional, the distance between grid items
                itemWidth: 210 // Optional, the width of a grid item
            };

        /**
         * 展示
         */
        function applyLayout() {
            $tiles.imagesLoaded(function() {
                // Destroy the old handler
                if ($handler.wookmarkInstance) {
                    $handler.wookmarkInstance.clear();
                }
                // Create a new layout handler.
                $handler = $('li', $tiles);
                $handler.wookmark(options);
            });
        }

        /**
         *scroll 事件
         */
        function onScroll() {
            // Check if we're within 100 pixels of the bottom edge of the broser window.
            var winHeight = window.innerHeight ? window.innerHeight : $window.height(), // iphone fix
                closeToBottom = ($window.scrollTop() + winHeight > $document.height() - 100);

            if (closeToBottom) {
                //AJAX载入的数据
                $.ajax({
                    url: "/wp/snsBlog/cate/wookmarkAjax",
                    dataType: "html",
                    data:{
                    	'page_no':page_no,
                    	'category_id':category_id
                    },
                    success: function(html) {                  	
                    	if(html!=null&&html!=""){
                    		page_no++;
                    		//把新数据追加到对象中
                       		$tiles.append(html);
                        	//重新展示
                        	applyLayout();
                            bindEvent();
                    	}
                        
                    }
                });

                
            }
        };


        applyLayout();
        bindEvent();


        $window.bind('scroll.wookmark', onScroll);

        function bindEvent(){
            $("a[class=btnC]").on("click",function(){
            var isLogin = ($(".unLogList").length <=0);
            if (!isLogin) {
                alert("请先登录，如果没有帐号请注册帐号。");
                return;
            };
            var album_id = $(this).attr("album_id");
           
            $.ajax({
                    url: "/wp/snsBlog/album/favorites",                    
                    dataType: "json",
                    data:{
                        'album_id':album_id                        
                    },
                    success: function(data) {
                        alert(data.success);                                           
                        if(data.success){
                            alert("关注成功！");
                        }
                    }
                });
        });
        }

        

    })(jQuery);


    </script>
</body>

</html>