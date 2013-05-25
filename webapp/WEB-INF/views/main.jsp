<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>wbpm</title>
    <link rel="stylesheet" href="${ctx}/css/assets/reset.css"/>
    <link rel="stylesheet" href="${ctx}/css/assets/global.css"/>
    <link rel="stylesheet" href="${ctx}/css/assets/home.css"/>
</head>
<body>
<script src="${ctx}/css/assets/jquery.js" type="text/javascript"></script>

<script src="${ctx}/js/Common.js" type="text/javascript"></script>
<script src="${ctx}/js/mustache.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	//initImgNews();
});
function initImgNews(){
	var imgs = new Array();
	for(var i = 1; i <=8; i++){
		imgs.push("news"+i+".jpg");	
	}
	var imgContainer = $("#img-news");
	var imgPath = "${ctx}/img/";
	for(var i = 0; i < imgs.length; i++){
		var img = '<div class="item"><a href="#"><img src="'+imgPath+imgs[i]+'"></a></div>';
		imgContainer.append(img);
	}
}
</script>
<%@include file="/common/header.jsp" %>

<div id="main-container" class="clearfix">
    <div id="content">
        <div id="news-trends">
            <h2>新闻动态 <span>NEWS & TRENDS</span></h2>
            <ul>
                <li><a href="login.html">[2012.12] 进入登陆页面</a><s></s></li>
                <li><a href="list.html">[2012.12] 进入列表页 </a><s></s></li>
                <li><a href="404.html">[2012.12] 404</a><s></s></li>
                <li><a href="pending.html">[2012.12] 服务器错误页面 </a><s></s></li>                
                <li class="more"><a href="#">MORE...</a></li>
            </ul>
        </div>
        <div id="photo">
            <h2>图片新闻</h2>

            <div class="container">
                <div class="win8 win8-metro" data-config='{"delay":3000,"interval":1000}'>
                    <div class="wrapper">
                        <div class="item">
                            <a href="#">
                                <img src="${ctx}/css/assets/img/AA.png">
                                <b>IT项目管理知识体系与实践</b>
                            </a>
                        </div>
                        <div class="item">
                            <a href="#">
                                <img src="${ctx}/css/assets/img/DD.png">
                                <b>IT项目管理知识体系与实践</b>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="application">
            <h2>公司公告 <span>company announcement</span></h2>
            <ul>
                <li>
                    <h3><a href="#">《管理制度》更新通知</a> <span>[BY   wanjunjun 2013-01-24</span></h3>

                    <p>各位同仁：<br>大家好，《xxxx财务管理制度-借款、付款、报销》已更新于公司内网xxxx财务管理制度-借款、付款、报销
                        V4.0， 相应附件请见Regulations-Category-Finance 部分。请大家参考使用。</p>
                </li>
                <li>
                    <h3><a href="#">《管理制度》更新通知</a> <span>[BY   wanjunjun 2013-01-24</span></h3>

                    <p>各位同仁：<br>大家好，《xxxx财务管理制度-借款、付款、报销》已更新于公司内网xxxx财务管理制度-借款、付款、报销
                        V4.0， 相应附件请见Regulations-Category-Finance 部分。请大家参考使用。</p>
                </li>
                <li>
                    <h3><a href="#">《管理制度》更新通知</a> <span>[BY   wanjunjun 2013-01-24</span></h3>

                    <p>各位同仁：<br>大家好，《xxxx财务管理制度-借款、付款、报销》已更新于公司内网xxxx财务管理制度-借款、付款、报销
                        V4.0， 相应附件请见Regulations-Category-Finance 部分。请大家参考使用。</p>
                </li>
                <li class="more"><a href="#">MORE...</a></li>
            </ul>

        </div>
    </div>
    <div id="sidebar">
    	<%@include file="/common/left.jsp"%>
    </div>
</div>

<%@include file="/common/footer.jsp" %>

</body>
</html>
