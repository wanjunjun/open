<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<title>wbpm</title>
	
	<link rel="stylesheet" type="text/css" media="screen" href="${ctx}/jqueryui/tree/themes/jquery.tree.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css" media="screen"/>
	
	<script src="${ctx}/js/jquery-1.6.2.min.js" type="text/javascript"></script>
	<script src="${ctx}/jqueryui/tree/jquery.tree.js" type="text/javascript"></script>
	
	<script type="text/javascript">
	jQuery(document).ready(function(){
		//tree
		var treeData = [						
			  { "id": "1", "text": "权限设置", "value": "1","showcheck": true, "isexpand": true, "hasChildren": true, "complete": true,
            	"ChildNodes":[
								{ "id": "101", "text": "模块权限", "value": "2","showcheck": true, "isexpand": true, "hasChildren": false, "complete": true,"url":"${ctx}/role/role_authority.do?type=module&id=${role_id}" },
								{ "id": "102", "text": "部门权限", "value": "3","showcheck": true, "isexpand": true, "hasChildren": false, "complete": true,"url":"${ctx}/role/role_authority.do?type=dept&id=${role_id}" }								
            	              ]
              }			
		];
		var tree = {
				showcheck: false, 
				cbiconpath:"${ctx}/jqueryui/tree/themes/images/icons/",
				icons: ["checkbox_0.gif", "checkbox_1.gif", "checkbox_2.gif"],
				emptyiconpath:"${ctx}/jqueryui/tree/themes/images/s.gif",
				onnodeclick:function(item){$("#jqgrid_frame").attr("src",item.url);}
		};
		tree.data = treeData;
		$("#tree").treeview(tree);		
		$("#arrow").bind({click:function(){
			if($("#tree").is(":hidden")){
				$("#tree").show();
				$("#arrow").css("left",200);
				$("#arrow_img").css("background","url(${ctx}/images/arrow2.gif) no-repeat");
			}else{
				$("#tree").hide();
				$("#arrow").css("left",1);
				$("#arrow_img").css("background","url(${ctx}/images/arrow1.gif) no-repeat");
			}
		}});
		
	});
	</script>
</head>
<body class="fixed">

<div id="page">

	<%@include file="/common/header.jsp" %>
	
	<div id="content" class="content-aside" role="main">
	
		<div class="aside">
            <aside id="community">
                <h3>&nbsp;</h3>
                <div id="tree" style=""></div>
            </aside>
        </div>
        <!-- 右边-->
        <div class="content-title">
            <ul>
                 <li>&nbsp;</li>
                <!-- <li>工作流</li>
                <li><span class="divider">&nbsp;</span></li>
                <li>流程发起</li> -->
            </ul>
        </div>
			
		<section id="main">

           
			<iframe id="jqgrid_frame"  frameborder="0" width="98%" height="680" src="${ctx}/role/role_authority.do?type=module&id=${role_id}"></iframe>

        </section>					
	</div>

	<br>
	<footer id="footer" >
        <div class="copyright">
            Copyright 2011 - 2012 Beyondsoft. <br>All Rights Reserved.
        </div>

    </footer>

</div><!-- desktop end -->

</body>

</html>
