<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/common/taglibs.jsp" %>   
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="/common/meta.jsp" %>
	<title>流程审批</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/css/jquery-ui/jquery.ui.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/css/form.css" />
	
	<script src="${ctx}/js/entry.js" type="text/javascript"></script>
	<script src="${ctx}/js/entry.jquery.js" type="text/javascript"></script>
	<script type="text/javascript">
	function _print(){
		window.print();
	}
	</script>
</head>

<body>
<%@include file="../../base/tree/depoTree.jsp" %>
<div id="flow-form">
<div><input class="ui-state-default button" type="button" value="打印" onclick="_print()"></div>
<form id="ff" action="${ctx}/business/transport/approveFlow.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="id" value="${formData.flowProcess.id}">
	<table id="mainTab" class="ui-widget ui-widget-content">
		<thead>
			<tr class="ui-widget-header ">
				<th colspan="4">领用流程审批单</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>领用司机</td>
				<td>${formData.driver}</td>
				<td>车牌号</td>
				<td>${formData.carNo}</td>
			</tr>
			<tr>
				<td>目的仓库</td>
				<td>${formData.depo.name}</td>
				<td>备注</td>
				<td>${formData.remark}</td>
			</tr>
			<tr>
				<td>领用日期</td>
				<td><fmt:formatDate value="${formData.startDate}" pattern="yyyy-MM-dd"/></td>
				<td>录单日期</td>
				<td><fmt:formatDate value="${formData.createDate}" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td>录单人</td>
				<td colspan="3">${flowProcess.user.userName}</td>
			</tr>
		</tbody>
	</table>
		
	<table id="itemTab" class="ui-widget ui-widget-content">
		<thead>
			<tr class="ui-widget-header ">
				<th>芯片ID</th>
				<th>芯片类型</th>
				<th>状态</th>
				<th>备注</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${formData.details}" var="detail">
		<tr>
			<td>${detail.boxId}</td>
			<td>${detail.boxType}</td>
			<td>${detail.status}</td>
			<td>${detail.remark}</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
</form>	
</div>
</body>
</html>