<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page import="com.beyondsoft.bpm.core.util.SpringSecurityUtils" %>
<%@ page import="com.beyondsoft.ldap.LdapUserDetailsImpl"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%
	//String active
	LdapUserDetailsImpl user = SpringSecurityUtils.getCurrentUser();
%>		
	<script src="${ctx}/jqueryui/xbreadcrumbs/main.js" type="text/javascript"></script>
	<style type="text/css">
	.xbreadcrumbs LI{
		background:none;
	}
	</style>
	<script type="text/javascript">
	jQuery(document).ready(function(){
		$('#breadcrumbs').xBreadcrumbs();
	});
	</script>	
<div id="desktopHeader">
		<div id="desktopTitlebarWrapper">
			<div id="desktopTitlebar">
				<a href="${ctx}/account/index.do"><img src="${ctx}/images/logo.gif"/></a>
				<h1 class="applicationTitle">BPM</h1>
				<h2 class="tagline">Beyondsoft's <span class="taglineEm">BPM</span></h2>
				<div id="topNav">
					<ul class="menu-right">
						<li>您好，<%=user==null?"":user.getNameCn()%>!</li>
						<li><a href="${ctx }/j_spring_security_logout" >Sign Out </a></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="desktopNavbar" style="overflow:visible;">
			<div style="width:70%;float:left;">	
			<ul id="breadcrumbs" class="xbreadcrumbs">
				<li><a href="${ctx}/account/index.do?active=home" class='<c:if test="${active=='home' }">active</c:if>'>Home</a></li>
				<li>
					<a href="#">合同管理</a>
					<ul>
						<li><a href="${ctx}/contract/index.do">合同查询</a>
			            <li><a href="${ctx}/contract/index.do">审批设置</a>
			        </ul>
				</li>
				<li>
					<a href="#">采购管理</a>
					<ul>					
			        	<li><a href="${ctx}/purchase/apply/index.do">采购管理</a></li>
			        	<li><a href="${ctx}/suppliers/index.do">供应商管理</a></li>
			        	<li><a href="${ctx}/purchase/index.do">费用查看</a></li>	
			        	<li><a href="${ctx}/jqueryui/jqgrid/demo/reportSerach.jsp">报表查看</a></li>		          
			        </ul>
				</li>
				<li>
					<a href="#">办公用品管理</a>
					<ul>
			        	<li><a href="${ctx}/page.do?page=officeSupplies/index">办公用品维护</a></li>
			        	<li><a href="#">查询领用记录</a></li>
			        	<li><a href="#">办公用品领用</a></li>	
			        </ul>
				</li>
			</ul>	
			</div>		
			<div style="float:right;">
			<ul class="xbreadcrumbs">
				<li><a href="${ctx}/bflow/employeeFlow/index.do?active=workflow">个人办公</a></li>
				<li><a href="${ctx }/account/module/index.do?active=module">系统维护</a></li>
			</ul>
			</div>
			<!--  角色权限菜单
			<ul id="miniflex">
			<li><a href="${ctx }/account/index.do?active=home" class='<c:if test="${active=='home' }">active</c:if>'>Home</a></li>
			<c:forEach items="${moduleFunctions}" var="moduleFunction">				
				<li><a href="${ctx}/${moduleFunction.url}" class='<c:if test="${fn:endsWith(moduleFunction.url, active)}">active</c:if>'>${moduleFunction.nameCn}</a></li>
			</c:forEach>
			<ul id="miniflex">	-->
		</div><!-- desktopNavbar end -->
	</div><!-- desktopHeader end -->