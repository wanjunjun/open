<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/common/meta.jsp"%>
<title>home</title>

<link href="${ctx}/shop/css/standard-v4-min.css" rel="stylesheet" type="text/css">
<link href="${ctx}/shop/css/register-merge.css" rel="stylesheet">
<link href="${ctx}/shop/css/standard-v0.css" rel="stylesheet">

<script src="${ctx}/js/entry.js" type="text/javascript"></script>
<script src="${ctx}/js/entry.jquery.js" type="text/javascript"></script>
<script src="${ctx}/js/Common.js" type="text/javascript"></script>
<script src="${ctx}/jqueryui/area/jquery.areaopt.js" type="text/javascript"></script>
<script src="${ctx}/jqueryui/area/areaopt.data.js" type="text/javascript"></script>

<script type="text/javascript">
jQuery(document).ready(function(){	

	 $("#btn_form_login").bind("click",register);
});


function register(){
	//alert(tt.validateForm('form_login'));
	//if(!tt.validateForm('form_login')){
	//	return;
	//}
	$("#form_login").attr("action","${ctx}/user/reg.do");
	$("#form_login").submit();
}

</script>


</head>
<body class="bgcolor">
<div id="doc">
<div id="header" style="background-color: white">
<!-- include head -->
<%@include file="header_top.jsp" %>

<div id="masthead-v5" class="w952 fd-clr">
<div class="ali-logo-v5"><a class="main-logo-v5"
	href="#" titinle="xxxx"> <img
	src="${ctx}/shop/images/mlogo.png" alt="xxxx" height="37" width="153"></a> <span
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
<table>
	<tbody>
		<tr>
			<td class="col1 suggestline">
			<label for="userCode_per" class="uname" data-icon="u">会员名</label>
			</td>
			<td class="col2 suggestline">
			<input id="userCode_per" name="userCode"  type="text" placeholder="mysuperusername690" class="text" />   
			</td>
			<td class="col3 suggestline">
		
			</td>
		</tr>
		<tr>
			<td class="col1 suggestline">
				<label for="pasword_per" class="youpasswd" data-icon="p">密码 </label>
			</td>
			<td class="col2 suggestline">
				<input id="pasword_per" name="pasword"  type="password" placeholder="eg. X8df!90EO" class="text"/>
			</td>
			<td class="col3 suggestline">
			
			</td>
		</tr>
		<tr>
			<td class="col1"><label for="pasword_per_confirm" class="youpasswd" data-icon="p">重复一下您的密码</label></td>
			<td class="col2">
				<input id="pasword_per_confirm" name="pasword_confirm"  type="password" placeholder="eg. X8df!90EO" class="text"/>
			</td>
			<td class="col3">
			
			</td>
		</tr>
		<tr>
			<td class="col1"><label for="userName_per" class="uname" data-icon="p">个人真实姓名</label></td>
			<td class="col2">
				<input id="userName_per" name="userName"  type="text" placeholder="eg. X8df!90EO" class="text"/>
			</td>
			<td class="col3">
			
			</td>
		</tr>
		<tr>
			<td class="col1"><label for="userPhone_per" class="uname" data-icon="u">手机号</label></td>
			<td class="col2">
				<input id="userPhone_per" name="userPhone"  type="text" placeholder="mysuperusername690" class="text" />
			</td>
			<td class="col3">
			
			</td>
		</tr>
		<tr>
			<td class="col1"><label for="userEmail_per" class="youmail" data-icon="e" >邮箱</label></td>
			<td class="col2">
				<input id="userEmail_per" name="userEmail"  type="email" placeholder="mysupermail@mail.com" class="text"/> 
			</td>
			<td class="col3">
			
			</td>
		</tr>		
		<tr>
			<td class="col1"></td>
			<td class="col2">
				<button hidefocus="true" onclick="tt.validateForm('form_login')"  id="btn_form_login" class="submit"
				style="margin-left: -2px;" name="submit" type="submit">立即注册</button>
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


<script id="talent_script">
			//下面这一行代码为4个字段添加了“非空”验证，同时会自动在4个字段上加上红色星号
			tt.vf.req.add("userCode","pasword","pasword_confirm","userName","userPhone","userEmail"); 
			
			
			
			tt.vf.email.add("userEmail");
			new tt.LV().set(5, 15).add("pasword");
			
			var pasword_per = new tt.Field('pasword', null, 'pasword');
			var pasword_per_confirm = new tt.Field("密码不一致", null, 'pasword_confirm');
			new tt.CV().add(pasword_per_confirm).set('v', "==", pasword_per,false);			
			tt.Conf.clearOtherError=true;
			tt.Conf.errCls=talentErrMsg;
			
			
			var ajaxConfig = {
					formId: 'form_login',      //要提交的form
					url : "${ctx}/login/CheckUserCode.do"
				};
				
				var remoteV = new tt.RemoteV().set(ajaxConfig);  
			
 </script>


</html>