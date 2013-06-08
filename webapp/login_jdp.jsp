<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@include file="/common/meta.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>IN ADMIN PANEL | Powered by INDEZINER</title>
<link rel="stylesheet" type="text/css" href="${ctx}/css/jdp/style.css" />
<script type="text/javascript" src="${ctx}/css/jdp/jquery.min.js"></script>



<script type="text/javascript" src="${ctx}/css/jdp/jconfirmaction.jquery.js"></script>
<script language="javascript" type="text/javascript" src="${ctx}/css/jdp/niceforms.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/css/jdp/niceforms-default.css" />
<script type="text/javascript">
	
	$(document).ready(function() {
		//$('.ask').jConfirmAction();
	});
	
</script>



</head>
<body>
<div id="main_container">

	<div class="header_login">
    <div class="logo"><a href="${ctx}/css/jdp/#"><img src="${ctx}/css/jdp/images/logo.gif" alt="" title="" border="0" /></a></div>
    
    </div>

     
         <div class="login_form">
         
         <h3>Admin Panel Login</h3>
         
         <a href="${ctx}/css/jdp/#" class="forgot_pass">Forgot password</a> 
         
         <form action="" method="post" class="niceform">
         
                <fieldset>
                    <dl>
                        <dt><label for="email">Username:</label></dt>
                        <dd><input type="text" name="" id="" size="54" /></dd>
                    </dl>
                    <dl>
                        <dt><label for="password">Password:</label></dt>
                        <dd><input type="text" name="" id="" size="54" /></dd>
                    </dl>
                    
                    <dl>
                        <dt><label></label></dt>
                        <dd>
                    <input type="checkbox" name="interests[]" id="" value="" /><label class="check_label">Remember me</label>
                        </dd>
                    </dl>
                    
                     <dl class="submit">
                    <input type="submit" name="submit" id="submit" value="Enter" />
                     </dl>
                    
                </fieldset>
                
         </form>
         </div>  
          
	
    
    <div class="footer_login">
    
    	<div class="left_footer_login">IN ADMIN PANEL | Powered by <a href="${ctx}/css/jdp/http://indeziner.com">INDEZINER</a></div>
    	<div class="right_footer_login"><a href="${ctx}/css/jdp/http://indeziner.com"><img src="${ctx}/css/jdp/images/indeziner_logo.gif" alt="" title="" border="0" /></a></div>
    
    </div>

</div>		
</body>
</html>