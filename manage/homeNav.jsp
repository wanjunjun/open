<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div id="alp-nav">
    <div class="screen">
    	<c:set value="${active}" var="cur" />
        <ul>                      
           <li <c:if test="${cur == 'home'}">class='current'</c:if>><a href="${ctx}/shop/home.do?active=home" >首页</a></li>
           <li <c:if test="${cur == 'myShop'}">class='current'</c:if>><a href="${ctx}/page.do?page=shop/manage/myOrder&active=myShop&@!x0ae6" target="_blank">我的物流</a></li>
           <li <c:if test="${cur == 'ship'}">class='current'</c:if>><a href="${ctx}/shop/ship.do?active=ship" target="_blank">我要发货</a></li>
           <li <c:if test="${cur == 'queryLine'}">class='current'</c:if>><a href="${ctx}/shop/queryLine.do?active=queryLine" target="_blank" >查询线路</a></li> 				               
           <li <c:if test="${cur == 'queryNet'}">class='current'</c:if>><a href="${ctx}/shop/queryNet.do?active=queryNet" target="_blank">查询网点</a></li>          
           <li <c:if test="${cur == 'track'}">class='current'</c:if>><a href="track.htm" target="_blank">物流跟踪</a></li>               
        </ul>
        <div class="r">
         <span>
            <a href="${ctx}/page.do?page=base/logisIn/apply_join" target="_blank" cmsid="33">物流商申请入驻</a>
          </span>              
            |
            <a href="${ctx}/login.jsp" target="_blank">物流商登录</a>
        </div>

    </div>
</div> 