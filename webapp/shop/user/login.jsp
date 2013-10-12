<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
        <meta name="data-spm" content="a261o">
       <%@include file="/common/meta.jsp"%>
<title>IN ADMIN PANEL | Powered by INDEZINER</title>
     
        <link href="${ctx}/shop/css/fdev-float.css" rel="stylesheet">
        <link href="${ctx}/shop/css/signin.css" rel="stylesheet">      
  </head>
    <body data-spm="2206477">
        <div id="doc">
            <div class="w952" id="masthead-v4">               
               <div class="ali-logo">
                        <h1>
                     <a class="main-logo" target="_self" title="商人的网站" href="http://exodus.1688.com/">阿里巴巴</a>
                     <span class="sub-logo">登录</span>
                  </h1>
                    </div>                       
   </div>
        
            <div id="content" class="w952" data-spm="5817989">
<div class="main">
			
	<div class="feature">	    	         
		<img src="${ctx}/shop/images/20130916.jpg" alt=""/>    
	</div>
	
	<div class="formarea">
	    <div id="loginchina-wrapper" class="signin">
			<div id="loginchina">
				
				<%@include file="login_iframe.jsp" %>
				<div class="signin-type" style="margin-top:10px">
					
					<a class="free-regist" href="http://exodus.1688.com/member/join.htm" target="_blank">免费注册</a>
	            </div>
			</div>
	    </div>	
				
	</div>
</div>

             </div>
         
           <%@include file="/shop/footer.jsp" %>
            
            <div style="color:#FFF">
                cbulogin-web13.xyi<br>Server is OK
            </div>
        </div>
        <img src="login_files/clear.png">

    

</body>
</html>