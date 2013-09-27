<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/common/meta.jsp"%>
<title>IN ADMIN PANEL | Powered by INDEZINER</title>

<link href="${ctx}/shop/css/standard-v4-min.css" rel="stylesheet" type="text/css">
<link href="${ctx}/shop/css/register-merge.css" rel="stylesheet">
<link href="${ctx}/shop/css/standard-v0.css" rel="stylesheet">

</head>
<body class="bgcolor">
<div id="doc">
<div id="header" style="background-color: white">
<div id="alibar" class="fd-clr">
<div id="alibar-v4">
<div class="alibar-container">
<div class="account-sign-status">
<ul>
	<li class="account-welcome">您好，<span class="account-id">欢迎来到xxxx</span>
	</li>	
	<li class="account-signin">
		<a rel="nofollow" href="http://localhost:8080/cwz"	title="请登录" data-trace="cn_alibar_login" target="_self">请登录</a>
	</li>
	<li class="account-signup"><a rel="nofollow"
		href="${ctx}/shop/user/register.jsp" title="免费注册"
		data-trace="cn_alibar_reg" target="_blank">免费注册</a></li>
	<li class="account-signout fd-hide"><a rel="nofollow"
		href="#" title="退出"
		data-trace="cn_alibar_quit" target="_blank">退出</a></li>
</ul>
</div>
<div class="topnav">
<ul>
	<li class="list-first">
	<div class="nav-title"><a href="#"
		title="xxxx首页" data-trace="cn_alibar_home" target="_blank">xxxx首页</a>
	</div>
	</li>

	<li class="topnav-purchaselist extra topnav-purchaselist-empty">
	<div class="nav-title"><a rel="nofollow" class="nav-arrow"
		href="#"
		title="进货单" data-trace="cn_alibar_cart" target="_blank"><span>&nbsp;</span>进货单(<em>0</em>)</a>
	</div>
	<div class="nav-content">
	<div class="product-list fd-clr">
	<p>进货单中暂未添加任何货品</p>
	</div>
	<div class="purchase-info fd-clr"><a class="btn-y" title="查看进货单"
		href="#"
		target="_blank">查看进货单</a></div>
	</div>
	</li>
	<li>
	<div class="nav-title"><a rel="nofollow"
		href="#" title="收藏夹"
		data-trace="cn_alibar_myali_fav" target="_blank">收藏夹</a></div>
	</li>
	
	<li>
	<div class="nav-title"><a
		href="#" title="供应商专区"
		data-trace="cn_alibar_supplier" target="_blank">供应商专区</a></div>
	</li>
		
</ul>
</div>
</div>

</div>
</div>
<div id="masthead-v5" class="w952 fd-clr">
<div class="ali-logo-v5"><a class="main-logo-v5"
	href="#" titinle="xxxx"> <img
	src="${ctx}/shop/images/logo-v4.png" alt="xxxx" height="37" width="153"></a> <span
	class="sub-logo-v5">企业账号注册</span></div>
<div class="fd-right" style="margin-top: 40px;"><a
	href="#">切换成个人账号注册&nbsp;&nbsp;&gt;&gt;</a>
</div>
</div>
</div>

<div id="content" class="wborder">
<div class="w991">
<div class="switch-container"></div>
<div id="phone-tab" class="tab-part fd-clr">
<div class="form-part">
<form action="" method="post" id="form_login">
<center>
<div style="font-size:30px;padding-top:100px;color:#FF8000">注册成功！</div>
</center>
</form></div>
<div class="info-part"></div>
</div>
</div>


</div>

<img src="${ctx}/shop/images/clear.png">


<div id="footer">
<div id="footer-v0">
<div class="footer-container">
<div class="ali-pages">
<p id="copyright">xxxx版权所有 1999-2012</p>
<ul>
	<li><a
		href="#"
		target="_self" title="著作权与商标声明">著作权与商标声明</a> |</li>
	<li><a
		href="#"
		target="_self" title="法律声明">法律声明</a> |</li>
	<li><a
		href="#"
		target="_self" title="服务条款">服务条款</a> |</li>
	<li><a
		href="#"
		target="_self" title="隐私声明">隐私声明</a> |</li>
	<li><a href="#"
		target="_self" title="联系我们">联系我们</a> |</li>
	<li><a href="#"
		target="_self" title="网站地图">网站地图</a> |</li>
	<li><a href="#"
		target="_self" title="用户体验计划">用户体验计划</a></li>
</ul>
</div>
</div>
</div>
</div>

</div>
</body>

</html>