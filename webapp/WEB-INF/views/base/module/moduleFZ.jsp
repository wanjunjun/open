<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>    
{
	"page":"1",
	"total":"1",
	"records":"${size}",
	"rows":[
		<c:forEach items="${list}" var="module" varStatus="status">
		{
			"id":"${module.id}",
			"cell":[
				"${module.id}",
				"<input id='childModule_${module.id}' name='childModule' type='checkbox' value='${module.id}'>${module.name}",
				"<c:forEach items="${module.childrens}" var="sub_module" varStatus="sub_status"><input id='childModule_${sub_module.id}' parentId='${sub_module.parent.id}' name='childModule' type='checkbox' value='${sub_module.id}'>${sub_module.name}&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>"
			]												
		}
		 <c:if test="${status.last==false}">,</c:if>
		</c:forEach>
	]
}
