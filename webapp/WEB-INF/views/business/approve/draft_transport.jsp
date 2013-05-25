<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/common/taglibs.jsp" %>   

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="/common/meta.jsp" %>
	<title>流程申请</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/css/jquery-ui/jquery.ui.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/css/form.css" />
	
	<script src="${ctx}/js/entry.js" type="text/javascript"></script>
	<script src="${ctx}/js/entry.jquery.js" type="text/javascript"></script>	
	<script src="${ctx}/jqueryui/datepicker/main.js" type="text/javascript"></script>	
	<script src="${ctx}/js/Common.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(function(){
		$("#startDate").datepicker({showOn: "button", buttonImage: "${ctx}/images/calendar.gif", buttonImageOnly: true});
		$("#startDate").datepicker( "option", "dateFormat", "yy-mm-dd");
		$("#createDate").val(Common.getDate());
	});
	var itemSize = ${formData.details.size()};
	function add(){
		var table = $("#itemTab");
		var size = table[0].rows.length;
		var tr = '<tr><td><input type="text" name="items['+itemSize+'].boxId" class="ui-widget-content"></td>';
		tr += '<td><input type="text" name="items['+itemSize+'].boxType" readonly="readonly"= class="ui-widget-content"></td>';
		//tr += '<td><select name="items['+itemSize+'].isArrived">是否到货<option value="是">是</option><option value="否">否</option></select></td>';
		tr += '<td><input type="text" name="items['+itemSize+'].remark" class="ui-widget-content"></td>';
		tr += '<td><a href="#" onclick="del(this)">删除</a></td>';
		table.append(tr);
		itemSize++;
	}
	
	function del(a){
		var table = $("#tform");
		var tr = null;
		tr = $(a).parent().parent();	
		tr.remove();
	}	
	function getDepoTreeNode(node){
		$("#depoId").val(node.id);
		$("#depoName").val(node.text);
	}
	function apply(){
		$("#ff").submit();
	}
	function save(){
		$("#ff").attr("action","${ctx}/business/transport/saveFlow.do");
		$("#ff").submit();
	}
	</script>
</head>

<body>
<%@include file="../../base/tree/depoTree.jsp" %>
<div id="flow-form">
<div>
	<input class="ui-state-default button" type="button" value="申请" onclick="apply()">
	<input class="ui-state-default button" type="button" value="保存" onclick="save()">
</div>
<form id="ff" action="${ctx}/business/transport/submitDraft.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="id" value="${flowProcess.id}">
	<input type="hidden" name="flow.id" value="${flowProcess.flow.id}">
	<input type="hidden" name="formState" value="${flowProcess.formState}">
	<input type="hidden" name="user.id" value="<security:authentication property="principal.id"/>">
	<table id="mainTab" class="ui-widget ui-widget-content">
		<thead>
			<tr class="ui-widget-header ">
				<th colspan="4">领用流程申请单</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>领用司机</td>
				<td><input type="text" name="driver" class="ui-widget-content" value="${formData.driver}"></td>
				<td>车牌号</td>
				<td><input type="text" name="carNo" class="ui-widget-content" value="${formData.carNo}"></td>
			</tr>
			<tr>
				<td>目的仓库</td>
				<td colspan="3">
					<input type="hidden" id="depoId" name="depo.id" class="ui-widget-content" value="${formData.depo.id}">
					<input type="text" id="depoName" name="depo.name" readonly="readonly" class="ui-widget-content" value="${formData.depo.name}">
					<a href="#" onclick="showTree()">选择</a>
				</td>				
			</tr>
			<tr>
				<td>领用日期</td>
				<td>
					<input type="text" id="startDate" name="startDate" class="ui-widget-content" value="${formData.startDate}">
				</td>
				<td>录单日期</td>
				<td><input type="text" id="createDate" name="createDate" class="ui-widget-content" value=""></td>
			</tr>
			<tr>
				<td>录单人</td>
				<td colspan="3">
					<security:authentication property="principal.username"/>
				</td>
			</tr>
			<tr>
				<td>备注</td>
				<td colspan="3"><textarea name="remark" cols="80">${formData.remark}</textarea></td>
			</tr>
		</tbody>
	</table>
	<div style="text-align:right;margin-top:25px"><input class="ui-state-default button" type="button" value="添加芯片" onclick="add()"></div>	
	<table id="itemTab" class="ui-widget ui-widget-content">
		<thead>
			<tr class="ui-widget-header ">
				<th>芯片ID</th>
				<th>芯片类型</th>
				<th>备注</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${formData.details}" var="detail" varStatus="status">
		<tr>
			<td><input type="text" name="items[${status.index}].boxId" class="ui-widget-content" value="${detail.boxId}"></td>
			<td><input type="text" name="items[${status.index}].boxType" class="ui-widget-content" readonly="readonly" value="${detail.boxType}"></td>			
			<td><input type="text" name="items[${status.index}].remark" class="ui-widget-content" value="${detail.remark}"></td>
			<td><a href="#" onclick="del(this)">删除</a></td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
</form>	
</div>
</body>
</html>