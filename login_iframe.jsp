<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html class="ks-gecko23 ks-gecko ks-firefox23 ks-firefox">
<head>
<%@include file="/common/meta.jsp"%>
<link href="${ctx}/shop/css/mini.css" rel="stylesheet">
</head>
<body>


<div id="page2">
<div id="content">
	<div id="J_LoginBox" class="login-box no-longlogin module-static">
		
		<div class="bd">    	 	
			
<div id="J_Message" style="display:none;" class="login-msg msg">
	
	<p class="error"></p>
	
</div>

   <div id="J_Static" class="static">
   <a href="#" id="J_SC_Guide" tabindex="1" style="position:absolute; left:-9999px;">点击回车可关闭安全控件</a>
    <form id="J_StaticForm" action="${ctx}/user/authenticate.do" method="post">
    	<input type="hidden" name="targetURL" value="${targetURL}">
    	<input type="hidden" id="theme" name="theme" value="jdp">
        <div class="field username-field">
            <label for="TPL_username_1">登录名</label>
           <!--  <a href="#" class="forget-pw" target="_blank">忘记登录名？</a> -->
            <!-- <span class="ph-label">手机号/会员名/邮箱</span>  -->
            <input name="j_username" id="TPL_username_1" class="login-text J_UserName" maxlength="32" tabindex="1" type="text">            	
        </div>
			<div class="field pwd-field">
				<label id="password-label" for="TPL_password_1">登录密码</label>
				<!-- <a href="#" target="_blank" id="forget-pw-safe" class="forget-pw">忘记登录密码?</a> -->
				<span id="J_StandardPwd">
					<input aria-labelledby="password-label" name="j_password" id="TPL_password_1" class="login-text" maxlength="20" tabindex="2" type="password">
				</span>				    
								
			</div>
			
			<button type="submit" class="J_Submit" tabindex="5" id="J_SubmitStatic">登录</button>
		
    </form>
</div>
	
		</div>
	</div>
</div>

</div>

</body>
</html>