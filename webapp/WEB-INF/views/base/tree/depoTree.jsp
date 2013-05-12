<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@include file="/common/meta.jsp" %>
	<title>wbpm</title>				
	
	<script src="${ctx}/js/Common.js" type="text/javascript"></script>
	<script src="${ctx}/jqueryui/tree/main.js" type="text/javascript"></script>	
	<script src="${ctx}/jqueryui/dialog/main.js" type="text/javascript"></script>
	
	<script type="text/javascript">
	jQuery(document).ready(function(){
		loadDepoTree();		
		$("#treeContainer").dialog({autoOpen: false,width:500,height:300});
		//showTree();
	});
	function loadDepoTree(){
		Common.ajax("${ctx}/depo/getTree.do?",null,initDepoTree);			
	}
	function initDepoTree(data){				
		var tree = treeSet(data.treeData);	
		$("#depoTree").treeview(tree);
	}
	function treeSet(treeData){
		var tree = {
				showcheck: false, 
				cbiconpath:"${ctx}/jqueryui/tree/themes/images/icons/",
				icons: ["checkbox_0.gif", "checkbox_1.gif", "checkbox_2.gif"],
				emptyiconpath:"${ctx}/jqueryui/tree/themes/images/s.gif",
				onnodeclick:function(item){	
					getDepoTreeNode(item);
					hideTree();
				}
		};
		tree.data = treeData;
		return tree;
	}
	function showTree(){
		$("#treeContainer").dialog("open");
	}
	function hideTree(){
		$("#treeContainer").dialog("close");
	}
	</script>
</head>
<body>	
<div id="treeContainer">
	<div id="depoTree" style="width:200px;height:100%;"></div>
</div>	
</body>

</html>
