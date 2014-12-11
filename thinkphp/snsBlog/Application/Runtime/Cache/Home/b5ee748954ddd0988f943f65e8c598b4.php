<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtmBox">
<head>
   
    <title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/wp/snsBlog/Public/css/reset-min.css">
<link rel="stylesheet" type="text/css" href="/wp/snsBlog/Public/css/style.css">
<script type="text/javascript" src="/wp/snsBlog/Public/js/jquery-1.7.2.min.js"></script>


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
				<div class="navSquare"><a class="navMode" href="#"><span class="navLTxt">广场</span><em class="xsIcon navMore"></em></a>
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
					<div class="navSearBox"><input type="text" placeholder="请输入关键字" class="navSearInput"><span class="xsIcon icon_search"></span></div>
				</div>
			</div>

			<div class="navR">
				<!-- 已登录 -->
				<?php if(session('__user__') != null): ?><ul class="navRList clearfix">
					<li class="navli userAdd"><a class="navMode" href="##" onclick="diplayAddBlog('click')" ><span class="xsIcon icon_add"></span></a>
						<!-- 发布弹层 点击【+】出现 -->
						<div class="pubLayer">
							<p class="pubLi"><a href="__ROOT/post/add" class="logLiTxt">发布文章</a></p>
							<!-- 点击【发布专辑】出现 创建专辑弹层 -->	
							<p class="pubLi"><a href="/wp/snsBlog/album/add" class="logLiTxt">创建专辑</a></p>	
						</div>
						<!-- /发布弹层 -->
					</li>
					<li class="navli usermsg"><a class="navMode" href=""><span class="xsIcon icon_msg"></span><em class="msgNum">99+</em></a></li>
					<li class="navli userNotice"><a class="navMode" href=""><span class="xsIcon icon_notice"></span></a>
						<div class="noticeLayer">
							<p class="noticeTit">我的消息</p>
							<!-- 通知弹层 点击【我的消息】出现 -->
							<div class="noticeListBox">
								<ul class="noticeList">
									<li class="clearfix">
										<a class="noticeImg"><img src="/wp/snsBlog/Public/images/userS.jpg" alt></a>
										<div class="noticeMain">
											<p class="noticeName"><a class="nameTxt">用户昵称八个字啊</a></p>
											<p class="noticeCon">转采了你的专辑<a class="noAlName">小小花蛤</a>到<a class="noAlNameT">小小花蛤</a></p>
										</div>
									</li>
									<li class="clearfix">
										<a class="noticeImg"><img src="/wp/snsBlog/Public/images/userS.jpg" alt></a>
										<div class="noticeMain">
											<p class="noticeName"><a class="nameTxt">用户昵称八个字啊</a></p>
											<p class="noticeCon">转采了你的专辑<a class="noAlName">小小花蛤</a>到<a class="noAlNameT">小小花蛤</a></p>
										</div>
									</li>
									<li class="clearfix">
										<a class="noticeImg"><img src="/wp/snsBlog/Public/images/userS.jpg" alt></a>
										<div class="noticeMain">
											<p class="noticeName"><a class="nameTxt">用户昵称八个字啊</a></p>
											<p class="noticeCon">转采了你的专辑<a class="noAlName">小小花蛤</a>到<a class="noAlNameT">小小花蛤</a></p>
										</div>
									</li>
									<li class="clearfix">
										<a class="noticeImg"><img src="/wp/snsBlog/Public/images/userS.jpg" alt></a>
										<div class="noticeMain">
											<p class="noticeName"><a class="nameTxt">用户昵称八个字啊</a></p>
											<p class="noticeCon">转采了你的专辑<a class="noAlName">小小花蛤</a>到<a class="noAlNameT">小小花蛤</a></p>
										</div>
									</li>									
								</ul>
								<p class="noticeMore"><a class="noticeMoreTxt">查看所有消息>></a></p>
							</div>
							<!-- /通知弹层 -->
						</div>

					</li>
					<li class="navli userLog"><a class="navMode" href=""><img src="/wp/snsBlog/Public/images/userS.jpg" alt="" class="headImg"><em class="xsIcon navMore"></em></a>
						<!-- 用户弹层 -->
						<div class="logLayer">
							<p class="logLi"><a href="#" class="logLiTxt">消息箱</a></p>	
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

			<div class="navLogo"><a class="logoBox"><img src="/wp/snsBlog/Public/images/logoM.png" alt=""></a></div>
		</div>
		<script type="text/javascript">
		function diplayAddBlog(type){
			if ("click"==type) {
				$(".pubLayer").toggle();
			} else{
				$(".pubLayer").hide();
			};
					
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
                            <li><a class="showMod" href="#"><?php echo ($post_count); ?> 文章</a>
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
                        <li>
                            <a class="albumAddBox" href="/wp/snsBlog/album/add?cate=<?php echo ($category_id); ?>">
                                <span class="albumAdd"></span>
                                <p class="albumAddTxt">添加专辑</p>
                            </a>
                        </li>
						<?php if(is_array($album_list)): foreach($album_list as $key=>$vo): ?><li>
                            <div class="albumMain">
                                <a class="albumImgBox" href="/wp/snsBlog/album/<?php echo ($vo["id"]); ?>">
                                    <div class="albumP1">
                                        <img src="/wp/snsBlog/Public/images/pic1.jpg" alt="" class="albumPic1" width="200" height="252">
                                    </div>
                                    <div class="albumPO clearfix">
                                        <!-- <p class="albumP2"><img src="/wp/snsBlog/Public/images/pic3.jpg" alt="" class="albumPic2" width="60" height="60"></p>
										<p class="albumP2"><img src="/wp/snsBlog/Public/images/pic3.jpg" alt="" class="albumPic2" width="60" height="60"></p>
										<p class="albumP2"><img src="/wp/snsBlog/Public/images/pic3.jpg" alt="" class="albumPic2" width="60" height="60"></p> -->
                                    </div>
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
    <!--弹出层-->
<!-- 弹层蒙层（黑色半透明） -->
<div class="mask" style="display:none;"></div>
<!-- 弹层蒙层（黑色半透明） -->

<!-- 登录弹层 -->
<div class="xsLoginLayer" style="display:none; top:100px; left:400px;background: #fff;">
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
                <input type="password" name="password" placeholder="密码">
            </p>
        </div>
        <p class="LaylogBtn"><a class="logBtn" href="javascript:login();">登录</a>
        </p>
        <p class="LayOth clearfix"><a class="forgetPsw" href="#">忘记密码></a>
            <span class="noAcc">还没有账号？ <a class="cliReg" href="#">点击注册></a>
            </span>
        </p>
    </div>
    <div class="LayShareBox">
        <a class="shareIconBtn shareLogWeibo" href="#"></a>
        <a class="shareIconBtn shareLogQq" href="#"></a>
        <a class="shareIconBtn shareLogDoban" href="#"></a>
        <a class="shareIconBtn shareLogRen" href="#"></a>
    </div>
</div>
<!-- /登录弹层 -->

<!-- 注册弹层 -->
<div id="xsReg1" class="xsRegLayer" style="display:none; top:100px; left:400px;">
    <a class="closeBtn">
        <span class="xsIcon icon_close"></span>
    </a>
    <p class="logoBox">
        <span class="logoImg logoL"></span>
    </p>
    <p class="regWay"><a href="javascript:open_mail_reg();">使用邮箱注册</a></p>
    <div class="LayRegWrap">
        <div class="LayRegBox">
            <p class="logInput logName">
                <input type="text" name="regname" placeholder="用户名" class="xsInput regInput1">
            </p>
            <p class="logInput logVer">
                <input type="text" name="code" placeholder="验证码" class="xsInput regInput2">
                <img id="mcode" style="cursor:pointer;" src="/wp/snsBlog/home/index/ver.shtml" alt="" onclick="flash_img()">
                <span class="verImg">
                </span>
            </p>
        </div>
        <p class="LaylogBtn"><a class="logBtn" href="javascript:reg();">注册</a>
        </p>
    </div>
    <span id="err_msg" style="color:red;width:300px;font-size:12px;display:none;position:absolute; left:130px;top:250px;">验证码错误</span>
    <div class="LayShareBox">
        <p class="regWay">使用第三方账号注册</p>
        <a class="shareIconBtn shareLogWeibo" href="#"></a>
        <a class="shareIconBtn shareLogQq" href="#"></a>
        <a class="shareIconBtn shareLogDoban" href="#"></a>
        <a class="shareIconBtn shareLogRen" href="#"></a>
    </div>
</div>
<!-- /注册弹层 -->

<!-- 注册弹层 -->
<div id="xsReg2" class="xsRegLayer" style="display:none; top:100px; left:400px;">
    <a class="closeBtn">
        <span class="xsIcon icon_close"></span>
    </a>
    <p class="logoBox">
        <span class="logoImg logoL"></span>
    </p>
    <p class="regTipN">注册成功！</p>
    <div class="LayRegWrap">
        <div class="LayRegBox">
            <p class="regNotice">验证邮件已发送至
                <span class="userEmail">xxxx@xxx.com</span>
                <br>请<a class="cheMail">点击查收邮件</a>激活帐号。</p>
            <p class="regNotice">没有收到邮件？请耐心等待。或者<a class="sendMail">重新发送</a>
                <!--<span class="sendTime">重新发送 30</span>-->
            </p>
        </div>
        <p class="LayRegBack"><a class="" href="/wp/snsBlog">返回登录首页>></a>
        </p>
    </div>

</div>
<!-- /注册弹层 -->


<div id="mailReg1" class="xsRegLayer" style="display:none; top:100px; left:400px;">
    <a class="closeBtn">
        <span class="xsIcon icon_close"></span>
    </a>
    <p class="logoBox">
        <span class="logoImg logoL"></span>
    </p>
    <p class="regWay">邮箱注册</p>
    <div class="LayRegWrap">
        <div class="LayRegBox">
            <p class="logInput logName">
                <input type="text" name="mailname" placeholder="邮箱名" class="xsInput regInput1">
            </p>
            
        </div>
        <p class="LaylogBtn"><a class="logBtn" href="javascript:mail_reg();">注册</a>
        </p>
    </div>
   
</div>

<!-- 提示弹层 -->
<div id="mailReg2" class="xsWLayer warnLayer" style=" display:none; top:300px; left:300px;">
    <a class="closeBtn">
        <span class="xsIcon icon_close"></span>
    </a>

    <div class="WLayerMain">
        <p class="WLayerTit2">提示</p>
        <div class="layerCon">
            <p class="warnTxt">邮件发送成功！请查收</p>
        </div>
        <p class="layerBtn"><a class="btnA">确定</a>
        </p>

    </div>
</div>

<!-- 创建专辑弹层 -->
<div class="xsWLayer addAlbumLayer" style="display:none; top:300px; left:300px;">
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
                        <input type="text" class="layInput">
                    </p>
                    <p class="formTip" style="visibility:hidden;">
                        <span class="xsIcon icon_wrong"></span>请输入专辑名</p>
                </dd>
            </dl>
            <dl class="clearfix">
                <dt class="formTit">专辑分类</dt>
                <dd class="formInputBox">
                    <p class="formInput">
                        <select class="layInput laysel">
                            <option>选择分类</option>
                        </select>
                    </p>
                    <p class="formTip">
                        <span class="xsIcon icon_wrong"></span>请选择分类</p>
                </dd>
            </dl>
            <p class="formBtn"><a class="btnD" href="#">创建专辑</a>
            </p>
        </div>

    </div>

</div>
<!-- /创建专辑弹层 -->

<!-- 转转隐藏uri -->
<input type="hidden" name="uri_hidden" >


<script type="text/javascript">
        $(function(){
        	$(".closeBtn").bind({
        		click: function(){
        			$(".xsRegLayer").hide();
        			$(".xsWLayer").hide();
        			$(".mask").hide();
        		}
        	});
        });
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

				 };//undo 
                 if(uri==null || uri==""){
                    location.href='/wp/snsBlog/cate';
                }else{
                      location.href=uri;
                }
				 
			});
                
		}

		function open_reg(){
			$(".mask").show();
			$("#xsReg1").show();
		}

		function reg(){
			$("#err_msg").hide();
			var username = $("input[name=regname]").val();
			var code = $("input[name=code]").val();
			$.post("/wp/snsBlog/admin/user/reg",{'username':username,'code':code},function(data){
				 //alert(data.success);
				 if (data.success){
				 	$(".mask").hide();	
				 	$("#xsReg1").hide();	
				 	$("#xsReg2").show();
				 }else{
				 	$("#err_msg").show();	
				 	flash_img();
				 };//undo 
			})
		}

		function open_mail_reg(){
			//$(".mask").show();
			$("#xsReg1").hide();
			$("#mailReg1").show();
		}

		function mail_reg(){
			var mailname = $("input[name=mailname]").val();
			$.post("/wp/snsBlog/admin/active/mailReg",{'mailname':mailname},function(data){
				 //alert(data.success);
				 if (data.success){
				 	$(".mask").hide();	
				 	$("#mailReg1").hide();	
				 	$("#mailReg2").show();
				 }else{
				 	$("#err_msg").show();	
				 };//undo 
			})	
		}

		function flash_img(){
			$("#mcode").attr("src", $("#mcode").attr("src")+"?");
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
        var category_id = <?php echo ($category_id); ?>;
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
                    	}
                        
                    }
                });

                
            }
        };


        applyLayout();


        $window.bind('scroll.wookmark', onScroll);

        $("a[class=btnC]").on("click",function(){
        	var isLogin = ($(".unLogList").length <=0);
        	if (!isLogin) {
        		alert("请先登录，如果没有帐号请注册帐号。");
        		return;
        	};
            var album_id = $(this).attr("album_id");
            alert(album_id);
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

    })(jQuery);


    </script>
</body>

</html>