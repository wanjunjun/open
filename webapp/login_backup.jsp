<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/common/meta.jsp" %>
<title>IN ADMIN PANEL | Powered by INDEZINER</title>

<link rel="stylesheet" type="text/css" href="${ctx}/css/jdp/style.css" />
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/css/jdp/niceforms-default.css" />

<script src="${ctx}/js/entry.js" type="text/javascript"></script>
<script src="${ctx}/js/entry.jquery.js" type="text/javascript"></script>
<script src="${ctx}/js/Common.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/css/jdp/jconfirmaction.jquery.js"></script>
<script type="text/javascript" src="${ctx}/css/jdp/niceforms.js"></script>

<script type="text/javascript">
    $(function(){
    	Common.ajax("${ctx}/login/getLicense.do", null, function(data){
    		if(data && data < 30){
    			$("#msg").text("使用期限还剩下"+data+"天");
    		}
    	});
    	locationLoginJsp();	
    	
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
    function ct(st){
    	$("#theme").val(st.value);
    }
</script>



</head>
<body>
<div id="main_container">

                    <div style="color:#ffffff;position:absolute;right:0px">
                    	系统风格
	                     <select id="sys_theme" style="border:1 solid #cccccc" onchange="ct(this)">
	                     	<option value="jdp">jdp</option>
	                     	<option value="">old</option>	                     	
	                     </select>
	                 </div>
                     
	<div class="header_login">
    <div class="logo"><a href="#"><img src="${ctx}/css/jdp/images/logo.gif" alt="" title="" border="0" /></a></div>
    
    </div>

     
         <div class="login_form">
         
         <h3>Admin Panel Login</h3>
         
         <a href="#" class="forgot_pass">Forgot password</a> 
                
         <form id="flogin" method="POST" action="${ctx}/user/authenticate.do" class="niceform">
         		<input type="hidden" id="theme" name="theme" value="jdp">
                <fieldset>
                    <dl>
                        <dt><label for="email">Username:</label></dt>
                        <dd><input type="text" id="username" name="j_username" size="54" /></dd>
                    </dl>
                    <dl>
                        <dt><label for="password">Password:</label></dt>
                        <dd><input type="password" id="password" name="j_password" size="54" /></dd>
                    </dl>
                    <!-- 
                    <dl>
                    	<dt><label for="theme">系统风格:</label></dt>
                    	<dd>
	                     <select name="theme">
	                     	<option value="">old</option>
	                     	<option value="jdp">jdp</option>
	                     </select>
	                     </dd>
                     </dl>
                      -->
                    <dl>
                        <dt><label></label></dt>
                        <dd>
                        	<h2><span id="msg" style="color:red;font-size:13px;margin-left:8px"></span></h2> 
                        </dd>
                    </dl>
                    
                     <dl class="submit">    
                            
                     <input type="submit" name="submit" id="submit" value="Enter"/>
                     </dl>
                    
                </fieldset>
                
         </form>
         </div>  
          
	
    
    <div class="footer_login">
    
    	<div class="left_footer_login">IN ADMIN PANEL | Powered by <a href="http://indeziner.com">INDEZINER</a></div>
    	<div class="right_footer_login"><a href="http://indeziner.com"><img src="${ctx}/css/jdp/images/indeziner_logo.gif" alt="" title="" border="0" /></a></div>
    
    </div>

</div>		
</body>
</html>