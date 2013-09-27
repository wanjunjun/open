<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
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