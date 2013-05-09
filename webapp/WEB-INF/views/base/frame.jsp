<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<title>wbpm</title>
	<link rel="stylesheet" href="${ctx}/css/assets/reset.css"/>
    <link rel="stylesheet" href="${ctx}/css/assets/global.css"/>
    <link rel="stylesheet" href="${ctx}/css/assets/home.css"/>
    <link rel="stylesheet" href="${ctx}/css/assets/search.css"/>
    <link rel="stylesheet" href="${ctx}/css/assets/list-sidebar.css"/>
	
	<script src="${ctx}/js/entry.js" type="text/javascript"></script>
	<script src="${ctx}/js/entry.jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/Common.js" type="text/javascript"></script>
	<script type="text/javascript">
	jQuery(document).ready(function(){
		//tree
		Common.ajax("${ctx}/module/getChildren.do?parentId=${moduleId}",null,initTree2);		
	});
	function initTree(data){
		var mn = decodeURIComponent("${moduleName}");
		var treeData = Common.childTree("0",mn,data);
		var tree = {
				showcheck: false, 
				cbiconpath:"${ctx}/jqueryui/tree/themes/images/icons/",
				icons: ["checkbox_0.gif", "checkbox_1.gif", "checkbox_2.gif"],
				emptyiconpath:"${ctx}/jqueryui/tree/themes/images/s.gif",
				onnodeclick:function(item){$("#jqgrid_frame").attr("src",item.url);}
		};
		tree.data = treeData;
		$("#tree").treeview(tree);
		if(data.rows.length > 0){
			var row1 = data.rows[0];
			$("#jqgrid_frame").attr("src",row1.url);
			$("#tree_"+row1.id).addClass("bbit-tree-selected");
			//alert($("#tree").dfop);
			$("#tree").setCurrentNode($("#tree").getNode($("#tree_"+row1.id).attr("tpath")));
		}
	}
	function initTree2(data){
		var mn = decodeURIComponent("${moduleName}");
		var sidebar = $("#sidebar");
		
		var items = data.rows;
		var ul = new Array();
		ul.push("<ul>");
		for(var i = 0; i < items.length; i++){
			ul.push("<li><a href='#' onclick='openMain(\""+items[i].url+"\")'>"+items[i].text+"</a><s></s></li>");
		}
		ul.push("</ul>");
		sidebar.append("<h2>"+mn+"<s></s></h2>");
		sidebar.append(ul.join(""));
		treeEvent();
		if(items.length > 0){
			openMain(items[0].url);
		}
	}
	function treeEvent(){
		$('#sidebar').on('click', 'h2', function (ev) {
	            var $target = $(ev.currentTarget);
	            var ul = $target.next('ul');
	            if (ul.is(':animated')) return;
	            $target.toggleClass('hide');
	            if ($target.hasClass('hide')) {
	                ul.slideUp(100);
	            } else {
	                ul.slideDown(100);
	            }
	            var menu = $target.parents('div.menu').siblings('div.menu');
	            menu.find('h2').addClass('hide');
	            menu.find('ul').slideUp(100);
        	}	
		)
	}
	function openMain(url){
		$("#jqgrid_frame").attr("src",url);
	}
	</script>	
</head>
<body>
<%@include file="/common/header.jsp" %>
<div id="main-container" class="clearfix" style="margin: 38px auto 0">

    <div id="main-content">     

        <div class="workflow-table">
            <iframe id="jqgrid_frame" frameborder="0" width="98%" height="630" src="about:blank"></iframe>            
        </div>
       
    </div>

    <div id="sidebar">
    </div>

</div>
<%@include file="/common/footer.jsp" %>
</body>

</html>
