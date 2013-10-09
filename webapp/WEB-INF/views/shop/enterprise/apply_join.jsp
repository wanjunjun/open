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

<script src="${ctx}/js/entry.js" type="text/javascript"></script>
<script src="${ctx}/js/entry.jquery.js" type="text/javascript"></script>
<script src="${ctx}/js/Common.js" type="text/javascript"></script>
<script src="${ctx}/js/validate3/main.js" type="text/javascript"></script>

<script type="text/javascript">
jQuery(document).ready(function(){	
	$("#btn_upload").bind("click", upload);
	$("#createTime").val(Common.getDate());
});


function upload() {
	/*
	if(!tt.validateForm('form_upload')){
		return;
	}*/	
	$("#form_upload").attr("action", "${ctx}/logisIn/upload.do");
	$("#form_upload").submit();
}

</script>


</head>
<body class="bgcolor">
<div id="doc">
<div id="header" style="background-color: white">
<%@include file="/shop/header_top.jsp" %>
<div id="masthead-v5" class="w952 fd-clr">
<div class="ali-logo-v5">
	<a class="main-logo-v5"	href="#" titinle="xxxx"> 
	<img src="${ctx}/shop/images/mlogo.png" alt="xxxx" height="37" width="153"></a> 
	<span class="sub-logo-v5">企业申请入驻</span>
</div>

</div>
</div>

<div id="content" class="wborder">
<div class="w991">
<!-- <div class="switch-container"></div> -->

<div id="phone-tab" class="tab-part fd-clr">
<div class="form-part">
<form action="${ctx}/logisIn/upload.do" method="post" id="form_upload" name="form_upload" enctype="multipart/form-data">
<table>
	<tbody>
		<tr>
			<td class="col1 suggestline">
				<label>会员卡号</label>
			</td>
			<td class="col2 suggestline">
				<security:authentication property="principal.userCode" />
				<input type="hidden" name="user.id" value="<security:authentication property="principal.id"/>">   
			</td>
			<td class="col3 suggestline">
		
			</td>
		</tr>
		<tr>
			<td class="col1 suggestline">
				<label>申请时间</label>
			</td>
			<td class="col2 suggestline">
				<input type="text"   width="100px" name="createTime"  id="createTime" readonly="true"
				class="text">
			</td>
			<td class="col3 suggestline">
			
			</td>
		</tr>
		<tr>
			<td class="col1"><label>营业执照</label></td>
			<td class="col2">
				<input type="text" id="buslice"	name="buslice"  class="text">
			</td>
			<td class="col3">
			
			</td>
		</tr>
		<tr>
			<td class="col1"><label>营业执照图片</label></td>
			<td class="col2">
				<input type="file" id="buslicePic1" name="buslicePic1" class="text"/>
			</td>
			<td class="col3">
			
			</td>
		</tr>
		<tr>
			<td class="col1"><label>道路运输许可证</label></td>
			<td class="col2">
				<input id="roadTranPer" name="roadTranPer"  type="text"  class="text" />
			</td>
			<td class="col3">
			
			</td>
		</tr>
		<tr>
			<td class="col1"><label>道路运输许可证图片</label></td>
			<td class="col2">
				<input type="file" id="roadTranPerPic1"	name="roadTranPerPic1" class="text"/> 
			</td>
			<td class="col3"></td>
		</tr>	
		<tr>
			<td class="col1"><label>组织机构代码证</label></td>
			<td class="col2">
				<input type="text" id="orgCode" name="orgCode" class="text"/> 
			</td>
			<td class="col3"></td>
		</tr>
		<tr>
			<td class="col1"><label>组织机构代码证图片</label></td>
			<td class="col2">
				<input type="file" id="orgCodePic1"	name="orgCodePic1" class="text"/> 
			</td>
			<td class="col3"></td>
		</tr>
		<tr>
			<td class="col1"><label>税号</label></td>
			<td class="col2">
				<input type="text" id="taxCode" name="taxCode" class="text"/> 
			</td>
			<td class="col3"></td>
		</tr>
		<tr>
			<td class="col1"><label>税号图片</label></td>
			<td class="col2">
				<input type="file" id="taxCodePic1"	name="taxCodePic1" class="text"/> 
			</td>
			<td class="col3"></td>
		</tr>
		<tr>
			<td class="col1"><label>备注</label></td>
			<td class="col2">
				<textarea name="remark" cols="80" style="width: 75%"></textarea> 
			</td>
			<td class="col3"></td>
		</tr>	
		<tr>
			<td class="col1"></td>
			<td class="col2">
				<button hidefocus="true" id="btn_upload" class="submit"
				style="margin-left: -2px;" type="button">立即注册</button>
			</td>
			<td class="col3">
			
			</td>
		</tr>
	</tbody>
</table>


<div class="agreement">
<div><a href="#" target="_blank">《xxxx服务条款》</a>
</div>
</div></form></div>
<!-- <div class="info-part" style="margin-top:10px"></div> -->
</div>
</div>


</div>

<img src="${ctx}/shop/images/clear.png">


<!-- foot -->
<%@include file="/shop/footer.jsp" %>
</div>
</body>

</html>