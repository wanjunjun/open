<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@include file="/common/meta.jsp" %>

	<title>wbpm</title>	
	<link rel="stylesheet" type="text/css" href="${ctx}/css/jquery-ui/jquery.ui.css" />
	
	<script src="${ctx}/js/entry.js" type="text/javascript"></script>
	<script src="${ctx}/js/entry.jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/Common.js" type="text/javascript"></script>
	<script src="${ctx}/jqueryui/jqgrid/main.js" type="text/javascript"></script>
	<script type="text/javascript">
	jQuery(document).ready(function(){	
		var setting = {
				url:"${ctx}/module/getPage.do?isParent=true",
				width:600,
				colNames:['id','模块名称','URL','排序值','操作'],
				colModel:[
					   		{name:'id', width:55},
					   		{name:'name', width:100,editable:true},
					   		{name:'url', width:150,editable:true,editoptions:{size:20}},
					   		{name:'sortNum', width:50,editable:true},
					   		{name:'operation', align:"center",width:100,hidden:false, sortable:false}
					   	],				
				editurl:"${ctx}/module/crud.do",
				toolbar: [true,"top"],
			    caption:"模块管理",
			    gridComplete:function(){
			    	/*目前只用一级菜单，暂时隐藏掉子菜单功能*/
			    	var ids=jQuery("#list").jqGrid('getDataIDs');
			    	for(var i=0; i<ids.length; i++){
			    		var id=ids[i];
			    		var modify = "<a href='#' style='color:#f60' onclick='setChildModule(" + id + ")'>子菜单</a>"; 
			    		jQuery("#list").jqGrid('setRowData', ids[i], { operation: modify});
			    	}			    	
			    }
		}
		Common.grid("list","pager",setting);
		$('#t_list').append("<input type='button' id='moduleAdd' value='新建'/>");
		$('#t_list').append("<input type='button' id='moduleEdit' value='编辑'/>");
		$('#t_list').append("<input type='button' id='moduleDel' value='删除'/>");
		
		$("#moduleAdd").bind("click",module_add);
		$("#moduleEdit").bind("click",module_edit);
		$("#moduleDel").bind("click",module_del);
	});
	
	function module_add(){
		jQuery("#list").jqGrid('editGridRow',"new",{height:280,reloadAfterSubmit:true,closeAfterAdd: true,modal: true,serializeEditData: function(data){ 	
		    return $.param($.extend({}, data, {id:''}));
		}});
	}
	function module_edit(){
		var gr = jQuery("#list").jqGrid('getGridParam','selarrrow');
		if( gr.length>0 ){
			jQuery("#list").jqGrid('editGridRow',gr,{reloadAfterSubmit:true,closeAfterEdit: true,serializeDelData: function(data){ 	
				return $.param($.extend({}, data, {id:'',ids:data.id}));
			}});
		}
		else{
			alert("Please Select Row to edit!");
		}
	}
	function module_del(){
		var gr = jQuery("#list").jqGrid('getGridParam','selarrrow');
		if( gr.length>0 ){
			jQuery("#list").jqGrid('delGridRow',gr,{reloadAfterSubmit:true,serializeDelData: function(data){ 	
				return $.param($.extend({}, data, {id:'',ids:data.id}));
			}});
		}
		else{
			alert("Please Select Row to delete!");
		}
	}
	function setChildModule(id){	
		window.location.href="${ctx}/module/indexChild.do?parentId="+id;	
	}
	</script>
</head>
<body >
	<table id="list"></table>
	<div id="pager"></div>

</body>

</html>
