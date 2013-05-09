<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>    
{
	"size":"${size}",
	"rows":[
		<c:forEach items="${children}" var="item" varStatus="status">
		{
			"id": "${item.id}",
			"text": "${item.name}",
			"url": "${ctx}/${item.url}"											
		}
		 <c:if test="${status.last==false}">,</c:if>
		</c:forEach>
	]
}
