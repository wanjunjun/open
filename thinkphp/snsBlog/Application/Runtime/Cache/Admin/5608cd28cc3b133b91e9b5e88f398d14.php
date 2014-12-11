<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtmBox">
<head>
	<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/wp/snsBlog/Public/css/reset-min.css">
<link rel="stylesheet" type="text/css" href="/wp/snsBlog/Public/css/style.css">
<script type="text/javascript" src="/wp/snsBlog/Public/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/wp/snsBlog/Public/js/Common.js"></script>


	<script type="text/javascript" src="/wp/snsBlog/Public/js/plugins/pagination/jquery.pagination.js"></script>
	<link type="text/css" rel="stylesheet" href="/wp/snsBlog/Public/js/plugins/pagination/css/pagination.css"/>
<title></title>
</head>

<body>

<form id="form1" action="/wp/snsBlog/admin/personal/updateUserMsgState.shtml" method="post">
	<input type="hidden" id="ids" name="ids">
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
		<input type="hidden" id="isRead" value="<?php echo ($read); ?>">
		<div class="mainBox clearfix">
			<div class="xsNLayout">
				<div class="xsBorBox">
					<div class="xsTabBox">
						<ul class="xsTab clearfix">
							<li class="tabList"><a href="/wp/snsBlog/admin/personal/getMsgList.shtml?read=1" class="tabTxt <?php if($read == 1): ?>cur<?php endif; ?>">私信(未读)</a></li>
							<li class="tabList"><a href="/wp/snsBlog/admin/personal/getMsgList.shtml?read=2" class="tabTxt <?php if($read == 2): ?>cur<?php endif; ?>">私信(已读)</a></li>					
						</ul>
					</div>
						
					<div id="dread" style="margin:10px 20px 10px 0;text-align:right;font-size:12px;padding-right:10px;"><a href="javascript:setRead();">设置为已读</a>
					<input type="checkbox" id="all_box">	
					</div>
					<div class="noticeWBox">
						<!-- 每页10条 -->
						<ul id="pageList" class="noticeWList">

						</ul>

						<div class="xsPageBox2" style="position:relative;">
							<div id="pagebar" class="xsPage" style="display:none;">
					        	<a href="">上一页</a>
					        	<a href="" class="cur">1</a>
					        	<a href="">2</a>
					        	<a href="">3</a>
					        	<a href="">下一页</a>
					        </div>
					        
					        <div id="Pagination" class="pagination" style="margin-left:15px"></div>
					        <span style="margin:10px 0 0 5px;font-size:13px;color:#999;float:left">共<span style="color:#26b;"><?php echo ($total["c"]); ?></span>条</span>
					    	
						</div>

					</div>


				</div>
			</div>
		</div>

		<!-- /main -->

	</div>



</form>
</body>
</html>
<script type="text/javascript">
	$(function(){
		initPage();
		if(<?php echo ($read); ?> == 2){
			$("#dread").hide();
		}

		$("#all_box").bind({
			click: function(){
				// alert($(this).attr("checked"));
				if($(this).attr("checked")=="checked"){
					$("input[name='state']").each(function(){
						$(this).attr("checked", "checked");
					});
				}else{
					$("input[name='state']").each(function(){
						$(this).attr("checked", false);
					});
				}
			}
		});
	});
	function read(s, a){
		$("#isRead").val(s);
		$(".tabTxt").removeClass("cur");
		$(a).addClass("cur");
	}

	var _size = 2;
	function initPage(c){
		var pageIndex = 0;     //页面索引初始值  
		var pageSize = _size;     //每页显示条数初始化，修改显示条数，修改这里即可  
		var optInit = {
			current_page : 0,
			items_per_page : pageSize,
			num_display_entries : 5,
			num_edge_entries : 1,
			prev_text : "上一页",
			next_text : "下一页",
			callback : PageCallback
		}
		$("#Pagination").pagination(<?php echo ($total["c"]); ?>, optInit);
	}
	
	function PageCallback(index) {
		var bean = new Object();
		bean.start = index*_size;
		bean.limit = _size;
		bean.read = $("#isRead").val();
		
        Common.ajax("/wp/snsBlog/admin/personal/getMsgFragment.shtml", bean, function(data){			
			$("#pageList").html(data);
		},"html"); 
    }

    function setRead(){
    	if($("input[name='state']:checked").length == 0){
    		alert("请选择一条记录");
    		return;
    	}
    	var ids = "0";
    	$("input[name='state']:checked").each(function(){
    		ids += ","+$(this).attr("mid");
    	});
    	$("#ids").val(ids);
    	$("#form1").submit();
    }
</script>