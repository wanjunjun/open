
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/common/taglibs.jsp" %>


<html>
<head>
	<%@include file="/common/meta.jsp" %>

	<title>wbpm</title>
	<link rel="stylesheet" href="${ctx}/css/assets/reset.css"/>
    <link rel="stylesheet" href="${ctx}/css/assets/global.css"/>
    <link rel="stylesheet" href="${ctx}/css/assets/login.css"/>
    
    <script src="${ctx}/js/entry.js" type="text/javascript"></script>
	<script src="${ctx}/js/entry.jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/Common.js" type="text/javascript"></script>
	<%
	String type = request.getParameter("type");
	request.getSession().setAttribute("type", type);
	%>
    <script type="text/javascript">
	    $(function(){
	    	locationLoginJsp(); 
	    	Common.ajax("${ctx}/login/getLicense.do", null, function(data){
	    		if(data && data < 30)
	    			$("#msg").text("使用期限还剩"+data+"天");
	    	});
	    });
    	   	
    	function locationLoginJsp(){    		
    		if(window.location != top.location){
    			//alert(window.location);
    			top.location.href = window.location;
    		}
    	}
        function onload(){
            document.getElementById("username").focus();
        }
        
    </script>
</head>
<body onload="onload()">
<div id="main-container">
    <form id="login" method="POST" action="${ctx}/j_spring_security_check">
        <img class="logo" src="${ctx}/css/assets/img/big-logo.png" alt=""/>

        <h2>帐户<span id="msg" style="color:red; font-size:13px ;margin-left:8px"></span></h2>
        <input type="text" class="user" id="username" name="j_username" placeholder="帐户名">
        <input type="password" class="pwd" id="password" name="j_password" placeholder="密码">
        <input type="submit" class="login" value=" "/>

		<!-- -->
        <p class="deny-passport"><a href="#">无法登陆您的帐户</a></p>
		
        <p class="modify-password"><a href="#">修改密码</a></p>
		 
        <div class="high-mananger">
            <h2><span>高级管理人员帐户</span></h2>
            <input type="button" class="vpn-login">
        </div>
        
    </form>

    <div id="pic">
        <img src="${ctx}/css/assets/img/wcr.png">
        <h2>超越期待 尽善尽美</h2>
        
    </div>

</div>

<%@include file="/common/footer.jsp" %>

</body>
</html>