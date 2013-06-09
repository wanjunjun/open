<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/common/meta.jsp" %>
<title>IN ADMIN PANEL | Powered by INDEZINER</title>

<link rel="stylesheet" type="text/css" href="${ctx}/css/jdp/style.css" />
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/css/jdp/niceforms-default.css" />

<script src="${ctx}/js/entry.js" type="text/javascript"></script>
<script src="${ctx}/js/entry.jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/css/jdp/clockp.js"></script>
<script type="text/javascript" src="${ctx}/css/jdp/clockh.js"></script> 
<script type="text/javascript" src="${ctx}/css/jdp/ddaccordion.js"></script>

<script src="${ctx}/js/Common.js" type="text/javascript"></script>

<script type="text/javascript">
jQuery(document).ready(function(){
	//tree
	Common.ajax("${ctx}/module/getChildren.do?parentId=${moduleId}",null,initMenu);		
});
function initMenu(data){
	var mn = decodeURIComponent("${moduleName}");
	var sidebar = $("#sideMenu");
	
	var items = data.rows;
	var ul = new Array();
	ul.push("<ul>");
	for(var i = 0; i < items.length; i++){
		ul.push("<li><a href='#' onclick='openMain(\""+items[i].url+"\")'>"+items[i].text+"</a></li>");
	}
	ul.push("</ul>");
	sidebar.append('<a class="menuitem submenuheader" href="">'+mn+'</a>');
	sidebar.append('<div class="submenu">'+ul.join("")+'</div>');	
	//initSideMenu();
	if(items.length > 0){
		openMain(items[0].url);
	}
}
function openMain(url){
	$("#jqgrid_frame").attr("src",url);
}
function initSideMenu(){
	ddaccordion.init({
		headerclass: "submenuheader", //Shared CSS class name of headers group
		contentclass: "submenu", //Shared CSS class name of contents group
		revealtype: "click", //Reveal content when user clicks or onmouseover the header? Valid value: "click", "clickgo", or "mouseover"
		mouseoverdelay: 200, //if revealtype="mouseover", set delay in milliseconds before header expands onMouseover
		collapseprev: true, //Collapse previous content (so only one open at any time)? true/false 
		defaultexpanded: [], //index of content(s) open by default [index1, index2, etc] [] denotes no content
		onemustopen: false, //Specify whether at least one header should be open always (so never all headers closed)
		animatedefault: false, //Should contents open by default be animated into view?
		persiststate: true, //persist state of opened contents within browser session?
		toggleclass: ["", ""], //Two CSS classes to be applied to the header when it's collapsed and expanded, respectively ["class1", "class2"]
		togglehtml: ["suffix", "<img src='${ctx}/css/jdp/images/plus.gif' class='statusicon' />", "<img src='${ctx}/css/jdp/images/minus.gif' class='statusicon' />"], //Additional HTML added to the header when it's collapsed and expanded, respectively  ["position", "html1", "html2"] (see docs)
		animatespeed: "fast", //speed of animation: integer in milliseconds (ie: 200), or keywords "fast", "normal", or "slow"
		oninit:function(headers, expandedindices){ //custom code to run when headers have initalized
			//do nothing
		},
		onopenclose:function(header, index, state, isuseractivated){ //custom code to run whenever a header is opened or closed
			//do nothing
		}
	});
}
</script>

</head>
<body>
<div id="main_container">
	<%@include file="/common/jdp/header.jsp" %>
	    
    <div class="main_content">
    
    <%@include file="/common/jdp/navigation.jsp" %>   
                    
    <div class="center_content">  

	    <div class="left_content">
	    	<div id="sideMenu" class="sidebarmenu">
	    	
	    	</div>
	    </div>  
    
	    <div class="right_content">            
	    	<iframe id="jqgrid_frame" frameborder="0" width="98%" height="630" src="about:blank"></iframe> 	     
	    </div><!-- end of right content-->
            
                    
  	</div>   <!--end of center content -->               
                    
    
    <div class="clear"></div>
    </div> <!--end of main content-->
	
    
   <%@include file="/common/jdp/footer.jsp" %>

</div>		
</body>
</html>