<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="/common/meta.jsp" %>

	<title>wbpm</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/css/jquery-ui/jquery.ui.css" />
	
	<script src="${ctx}/js/entry.js" type="text/javascript"></script>
	<script src="${ctx}/js/entry.jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/Common.js" type="text/javascript"></script>
	<script src="${ctx}/jqueryui/jqgrid/main.js" type="text/javascript"></script>
	
	<script type="text/javascript">
	var role_module = [];//存放当前角色对应的模块权限
	jQuery(document).ready(function(){
		jQuery("#list").jqGrid({
			url:"${ctx}/module/getModuleFZ.do?",
			datatype: "json",
			colNames:['id','菜单名称','模块名称'],
			colModel:[
				   		{name:'id', width:55, hidden:true},
				   		{name:'name', width:100},
				   		{name:'childs', width:150}
				   	],	
		   	width:800,
		   	height:400,
		   	rowNum:50,
		   	rowList:[50],
		   	pager: '#pager',
		   	sortname: 'id',
		    viewrecords: true,		 
		    multiselect: false,
		    sortorder: "desc",
		    editurl:"${ctx}/account/module/crud.do",
		    caption:"权限设置",
		    toolbar: [true,"top"],
		    gridComplete:function(){
		    	//将角色已有的权限模块打勾
		    	for(var i = 0; i < role_module.length; i++){
					$("#childModule_"+role_module[i]).attr("checked",true);
				}
		    }
		});
		jQuery("#list").jqGrid('navGrid','#pager',{search:false,edit:false,add:false,del:false});
		$('#t_list').append("<input type='button' id='saveRole' value='保存'/>");
		$('#t_list').append("<input type='button' id='goBack' value='返回'/>");
		$("#saveRole").bind("click",saveRole);
		$("#goBack").bind("click",function(){window.history.go(-1);});
	});
		
	function saveRole(){	
		var bean = new Object();
		bean.roleId = ${roleId};
		var role_modules = $("input[name='childModule']");
		var len = role_modules.length;
		var select_module = [];
		var tmp,parent_module;
		for(var i = 0; i < len; i++){
			if(role_modules[i].checked == true){
				select_module.push(role_modules[i].value);
				tmp = role_modules[i].attributes["parentId"];				
				if(tmp){					
					parent_module = $("#childModule_"+tmp.value);
					if(!parent_module.attr("checked"))select_module.push($("#childModule_"+tmp.value).val());
				}
			}
		}
		bean.moduleIds = select_module.join(",");
		Common.ajax("${ctx}/role/setRoleModule.do",bean,function(data){if(data == "success")alert("保存成功")});
	}
	</script>
</head>
<body>

<div style="hieght:10px;width:100%">&nbsp;</div>		
		<div id="jqGrid">
			<table id="list"></table>
			<div id="pager"></div>
		</div>
	
	<c:forEach items="${roles}" var="rm" varStatus="rm_status">
	<script type="text/javascript">
		role_module.push("${rm.module.id}");
	</script>
	</c:forEach>
</body>

</html>
