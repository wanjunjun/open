<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

	<script type="text/javascript">	
	$(document).ready(function(){
		//initWait();	
	});
	function initWait(){
		Common.ajax("${ctx}/bflow/basicFlow/getWaitNum.do?",null,function(data){
			if(data!=null){		
				$('#waitNum1').html(data+"+");
				$('#waitNum2').html("待办工作("+data+")");
				$('#waitNum2').attr("href","${ctx }/bflow/employeeFlow/index.do?moduleId=2&active=wait");
			}
		});
	}	
	</script>
	
<div class="header">
    <div class="logo"><a href="#"><img src="${ctx}/css/jdp/images/logo.gif" alt="" title="" border="0" /></a></div>
    
    <div class="right_header">Welcome <security:authentication property="principal.username"/>, <a href="#">Visit site</a> | <a href="#" class="messages">(3) Messages</a> | <a href="${ctx}/logout.jsp" class="logout">Logout</a></div>
    <div id="clock_a"></div>
</div>