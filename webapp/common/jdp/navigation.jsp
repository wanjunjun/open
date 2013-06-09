<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<script type="text/javascript">	
	function redirectTo(id,name,url,st){
		if("custom" == st){
			window.location.href="${ctx}/"+url;
		}else{
			window.location.href="${ctx}/page.do?page=base/frame_jdp&moduleId="+id+"&moduleName="+encodeURIComponent(encodeURIComponent(name));	
		}			
	}		
	</script>
 <div class="menu">
     <ul>
     <li><a class="current" href="${ctx}/page.do?page=main_jdp">首页</a></li>
     <c:forEach items="${modules}" var="module">
     	<li><a  href="#" onclick="redirectTo('${module.id}','${module.name}')">${module.name}</a></li>
     </c:forEach>
     </ul>
</div>