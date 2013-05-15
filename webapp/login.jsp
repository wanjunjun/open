
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/common/taglibs.jsp" %>


<html>
<head>
	<%@include file="/common/meta.jsp" %>

	<title>Beyondsoft APSA</title>
	<link rel="stylesheet" href="./css/assets/reset.css"/>
    <link rel="stylesheet" href="./css/assets/global.css"/>
    <link rel="stylesheet" href="./css/assets/login.css"/>
	<%
	String type = request.getParameter("type");
	request.getSession().setAttribute("type", type);
	%>
    <script type="text/javascript">
    	locationLoginJsp();    	
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
        <img class="logo" src="./css/assets/img/big-logo.png" alt=""/>

        <h2>帐户</h2>
        <input type="text" class="user" id="username" name="j_username" placeholder="帐户名">
        <input type="password" class="pwd" id="password" name="j_password" placeholder="密码">
        <input type="submit" class="login" value=" "/>

		<!-- -->
        <p class="deny-passport"><a href="#">无法登陆您的帐户</a></p>
		
        <p class="modify-password"><a href="https://changepwd.beyondsoft.com/iisadmpwd/">修改密码</a></p>
		 
        <div class="high-mananger">
            <h2><span>高级管理人员帐户</span></h2>
            <input type="button" class="vpn-login">
        </div>
        
    </form>

    <div id="pic">
        <img src="${ctx}/css/assets/img/CC.png">
        <h2>超越期待 尽善尽美</h2>
        <img src="${ctx}/images/apsa-logo1.png" height="55px" style="position:absolute;bottom:10px;right:5px">
        
    </div>

</div>

<%@include file="/common/footer.jsp" %>

</body>
</html>