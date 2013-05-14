<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/common/taglibs.jsp" %>   

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="/common/meta.jsp" %>
	<title>流程审批</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/css/jquery-ui/jquery.ui.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/css/form.css" />
	
	<script src="${ctx}/js/entry.js" type="text/javascript"></script>
	<script src="${ctx}/js/entry.jquery.js" type="text/javascript"></script>
</head>

<body>
<div id="flow-form" style="width:70%;float:left">

	<table id="mainTab" class="ui-widget ui-widget-content">
		<thead>
			<tr class="ui-widget-header ">
				<th>审批人</th>
				<th>审批时间</th>
				<th>审批意见</th>
				<th>审批节点</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${process}" var="item">
		<tr>
			<td>${item.actor}</td>
			<td>${item.completeTime}</td>
			<td>${item.opinion}</td>
			<td>${item.nodeName}</td>
		</tr>	
		</c:forEach>
		</tbody>
	</table>		

</div>
<div style="width:120px;float:right;margin-top:25px;font-size:15px">
	<c:forEach items="${process}" var="item">
		<div style="height: 60px;" class="ui-state-highlight ui-comer-all">
			<span style="float:left;margin-right:3em;" class="ui-icon ui-icon-info"></span>
			<br>
			<div style="text-align:center">${item.actor}</div>
			<br>			
			
		</div>
		<center><img src="${ctx}/images/direction.jpg"/></center>
	</c:forEach>
		<div style="height: 60px;" class="ui-state-highlight ui-comer-all">
			<span style="float:left;margin-right:3em;" class="ui-icon ui-icon-info"></span>
			<br>
			<div style="text-align:center">结束</div>
			<br>			
		</div>	
</div>
</body>
</html>