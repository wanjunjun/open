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
	function redirectTo(id,name,url,st){
		if("custom" == st){
			window.location.href="${ctx}/"+url;
		}else{
			window.location.href="${ctx}/page.do?page=base/frame&moduleId="+id+"&moduleName="+encodeURIComponent(encodeURIComponent(name));	
		}			
	}		
	</script>
	
<div id="nav">
    <div class="content">
        <img src="${ctx}/images/logo.jpg" height="41x" width="156px" id="logo" alt="Logo" title="点击跳转到首页">

        <div class="nav">
            <ul>
                <li><a href="${ctx}/page.do?page=main">首页</a></li>
                <c:forEach items="${modules}" var="module">
                	<li><a  href="#" onclick="redirectTo('${module.id}','${module.name}')">${module.name}</a></li>
                </c:forEach>
                <!-- 
                <li><a href="#">合同管理</a>
                    <ul>
                    	 <c:forEach items="${moduleFunctions}" var="moduleFunction">	
							<c:if test="${moduleFunction.position eq '合同管理'}">
								<li><a  href="#" onclick="redirectTo('${moduleFunction.id}','${moduleFunction.nameCn}')">${moduleFunction.nameCn}</a></li>
							</c:if>
						</c:forEach>
                    </ul>
                </li>
                 -->
            </ul>
        </div>
        <div class="info">

            <div class="menu">
                <ul>
                    <li><a href="#"><security:authentication property="principal.username"/></a></li>
                    <li><a href="${ctx}/j_spring_security_logout">[ 注销 ]</a></li>
                </ul>
            </div>
            <div class="menu">
                <ul>
                    <li><a id="waitNum1" href="#" class="email"></a></li>
                    <li><a href="#">工作流</a></li>
                    <li><a id="waitNum2" href="#"></a></li>
                </ul>
            </div>
        </div>
    </div>
</div>