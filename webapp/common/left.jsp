<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="quick-entry" class="clearfix">
	            <h2>快速入口 <span>QUICK ENTRY</span></h2>
	
	            <div class="win8">
	                <div class="item reimbursement-expenses">
	                    <a href="${ctx}/page.do?page=flow/index"><b>
								流程申请
								</b></a>
	                    <s></s>
	                </div>
	                <div class="item loan-application">
	                    <a href="${ctx}/page.do?page=flow/wait"><b>流程审批</b></a>
	                    <s></s>
	                </div>
	                <div class="item office-supplies">
	                    <a href="${ctx}/page.do?page=flow/approved"><b>已审批查询</b></a>
	                    <s></s>
	                </div>	             
	                <div class="item conference-room">
	                    <a href="#" target="_blank"><b>预留入口</b></a> <s></s>
	                </div>
	                <div class="item go-request">
	                    <a href="#" target="_blank"><b>预留入口</b></a> <s></s>
	                </div>
	                <div class="item mail">
	                    <a href="#"><b>Mail</b></a> <s></s>
	                </div>
	                <div class="item job-system">
	                    <a href="#"><b>招聘管理</b></a> <s></s>
	                </div>
	                <div class="item crm">
	                    <a href="#" target="_blank"><b>预留入口</b></a> <s></s>
	                </div>
	                <div class="item wiki">
	                    <a href="#" target="_blank"><b>预留入口</b></a> <s></s>
	                </div>
	            </div>
	        	</div>
	        	<!--  -->
		    	<div id="personal-details">
		            <h2>个人信息 <span>PERSONAL DETAILS</span></h2>
		
		            <p class="name" onclick="openUserInfo()">
		                <strong><security:authentication property="principal.username"/></strong>
		                <img src="${ctx}/css/assets/img/person.png" width="59" height="59">
		            </p>
		
		            <div class="info clearfix" onclick="openUserInfo()">
		                <div class="id">
		                    <b><security:authentication property="principal.username"/></b> <span>员工编号</span>
		                </div>
		                <div class="cost-center">
		                    <b><security:authentication property="principal.username"/></b><span>员工编号</span>
		                </div>
		                <div class="company-code">
		                    <b><security:authentication property="principal.username"/></b><span>员工编号</span>
		                </div>
		            </div>		            
		            <div class="timesheet win8-metro" data-config='{"delay":2000,"interval":500}' onclick="openTimeSheet()">
		                <div class="wrapper">
		                    <div class="item title"><a style="color:#ffffff" href="#">Timesheet</a></div>
		                    <div class="by-load" id="timesheet-view-load"> </div>
		                    <div class="item weekly" id="timesheet-view" style="display: none;padding-top:3px;">
		                    
		                        <p>
		                            <strong>10</strong>
		                            <span>上周提交</span>
		                        </p>
		
		                        <p>
		                            <strong>12</strong>
		                            <span>本周提交</span>
		                        </p>
		
		                        <p class="last">
		                            <strong>13</strong>
		                            <span>准备提交</span>
		                        </p>
		                       
		                    </div>
		                </div>
		            </div>
		        </div>
		        
		        <div id="corporate-culture">
            <h2>企业文化 <span>CORPORATE CULTURE</span></h2>
            <a class="home-page" href="http://www.beyondsoft.com" target="_blank"><span>公司官网</span></a>

            <div class="panel">
                <div class="item bbs"><a href="http://192.168.4.191:8088/jforum/user/loginFromAPSA.page?username=<security:authentication property="principal.username"/>" target="_blank"><b>BBS</b></a> <s></s></div>
                <div class="item address-book"><a href="${ctx}/cms/contact/list.do"><b>通讯薄</b></a> <s></s></div>
             
            </div>
        </div>
<form id="hhh" action="" method="post"></form>
<script type="text/javascript">
function openTimeSheet(){
	window.open("https://erp.beyondsoft.com/erp3/ssoLogin?username=<security:authentication property="principal.username"/>");
}
function openUserInfo(){
	window.location.href = "${ctx}/page.do?page=account/user/basicInfo";
}
	 

$(document).ready(function(){
	
});
 
  	
</script>
<!-- 此处必需放在最下面，保证HOME里面初始化的代码在页面数据初始化的代码之后 -->
<script src="${ctx}/css/assets/home.js" type="text/javascript"></script>