<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtmBox">
<head>
	<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/wp/snsBlog/Public/css/reset-min.css">
<link rel="stylesheet" type="text/css" href="/wp/snsBlog/Public/css/style.css">
<script type="text/javascript" src="/wp/snsBlog/Public/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/wp/snsBlog/Public/js/Common.js"></script>


	<link rel="stylesheet" href="/wp/snsBlog/Public/js/plugins/validator-0.7.3/jquery.validator.css">
    <script type="text/javascript" src="/wp/snsBlog/Public/js/plugins/validator-0.7.3/jquery.validator.js"></script>
    <script type="text/javascript" src="/wp/snsBlog/Public/js/plugins/validator-0.7.3/local/zh_CN.js"></script>
	<script type="text/javascript" src="/wp/snsBlog/Public/js/plugins/preview/uploadPreview.min.js"></script>
	<script type="text/javascript" src="/wp/snsBlog/Public/js/plugins/My97Date/WdatePicker.js"></script>

<title></title>
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
		<form id="form1" action="/wp/snsBlog/admin/user/saveUser.shtml" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="<?php echo ($user["id"]); ?>">
		<div class="mainBox clearfix">
			<div class="xsNLayout">
				<!-- 编辑专辑 -->			
				
				<div class="editUserBox">
					<div class="xsTit">个人资料</div>
					<div class="editForm">
						<div class="formCata">
							<dl class="clearfix">
								<dt class="formName">登录名</dt>
								<dd class="formInput"><input class="xsInput fw01" type="text" value="<?php echo ($user["username"]); ?>" readonly="readonly"></dd>
								<dd class="formTip" style="display:none;"><span class="xsIcon icon_wrong"></span>请选择分类</dd>
							</dl>
							<dl class="clearfix">
								<dt class="formName">昵称</dt>
								<dd class="formInput"><input name="aliasname" class="xsInput fw01" type="text" value="<?php echo ($user["aliasname"]); ?>" data-rule="required;length[4~];"></dd>
								<dd class="formTip" style="display:none;"><span class="xsIcon icon_wrong"></span>不能为空</dd>
							</dl>
							<dl class="clearfix">
								<dt class="formName">安全邮箱</dt>
								<dd class="formInput"><input name="email" class="xsInput fw01" type="text" value="<?php echo ($user["email"]); ?>" data-rule="required;email;"></dd>
								<dd class="formTip" style="display:none;"><span class="xsIcon icon_wrong"></span>不能为空</dd>
							</dl>

							<dl class="clearfix">
								<dt class="formName">头像</dt>
								<dd class="formInput"><div class="userImgShow"><img id="userImg" src="/wp/snsBlog/Public/<?php echo ($user["header_img"]); ?>" alt=""></div><div class="picInput">
											<p class="picInfo">支持jpg、jpeg、png、gif格式；<br>
											建议尺寸：120pxX120px 文件不超过100K</p>						
											<p class="fileinput">
												<input type="file" id="img" name="img" class="formFile"></p>
										</div></dd>
								
							</dl>
							<dl class="clearfix">
								<dt class="formName">性别</dt>
								<dd class="formInput">
									<input type="hidden" id="grade" name="grade" value="">
									<label class="sexF"><input name="sex" type="radio" value="男" <?php if($user["grade"] == '男'): ?>checked<?php endif; ?>>男</label>
									<label class="sexF"><input name="sex" type="radio" value="女" <?php if($user["grade"] == '女'): ?>checked<?php endif; ?>>女</label>
									<label class="sexF"><input name="sex" type="radio" value="保密" <?php if($user["grade"] == '保密'): ?>checked<?php endif; ?>>保密</label>
								</dd>
								
							</dl>		
							<dl class="clearfix userbirth">
								<dt class="formName">生日</dt>
								<dd class="formInput">
									<input id="Wdate" class="Wdate" type="text" onClick="WdatePicker()" readonly="readonly">
									<input name="born_year" class="xsInput fw07" type="hidden" placeholder="年" value="<?php echo ($user["born_year"]); ?>">
									<input name="born_month" class="xsInput fw07" type="hidden"  placeholder="月" value="<?php echo ($user["born_month"]); ?>" >
									<input name="born_day" class="xsInput fw07" type="hidden"  placeholder="日" value="<?php echo ($user["born_day"]); ?>" >
								</dd>
								
							</dl>
							<dl class="clearfix">
								<dt class="formName">职业</dt>
								<dd class="formInput"><input name="professional" class="xsInput fw01" type="text" value="<?php echo ($user["professional"]); ?>"></dd>

							</dl>																				
						</div>
						<div class="formCata">
							<dl class="clearfix">
								<dt class="formName">个人主页</dt>
								<dd class="formInput"><input name="my_site" class="xsInput fw01" type="text" value="<?php echo ($user["my_site"]); ?>"></dd>

							</dl>							
							<dl class="clearfix">
								<dt class="formName">关于自己</dt>
								<dd class="formInput"><textarea name="introduce" class="xsArea fwA01"><?php echo ($user["introduce"]); ?></textarea></dd>
								
							</dl>
							<!-- <dl class="clearfix">
								<dt class="formName">个性网址</dt>
								<dd class="formInput"><span class="userURL">huaban.com/<input type="text" class="xsInput fw07" value="21212"></span></dd>
								
							</dl> -->							
						</div>

					</div>
					<p class="saveBtn"><a class="btnD" href="javascript:saveUser();">保存设置</a></p>

				</div>
				<!-- /编辑专辑 -->
			</div>
		</div>
		</form>
		<!-- /main -->

	</div>




</body>
</html>
<script type="text/javascript">
	$(function () {
		if("<?php echo ($user["born_year"]); ?>".length > 0 && "<?php echo ($user["born_month"]); ?>".length > 0 && "<?php echo ($user["born_day"]); ?>".length > 0){
			$("#Wdate").val("<?php echo ($user["born_year"]); ?>-"+"<?php echo ($user["born_month"]); ?>-"+"<?php echo ($user["born_day"]); ?>");
		}		
		$("input[name='sex']").bind({
			click: function(){
				$("#grade").val($(this).val());
			}
		});
    	$("#img").uploadPreview({ Img: "userImg", Width: 120, Height: 120 });
    });

	function saveUser(){
		var d = $("#Wdate").val();
		if(d.length > 0){
			var arr = d.split("-");
			$("input[name='born_year']").val(arr[0]);
			$("input[name='born_month']").val(arr[1]);
			$("input[name='born_day']").val(arr[2]);
		}
		
		$("#form1").submit();	
	}

</script>