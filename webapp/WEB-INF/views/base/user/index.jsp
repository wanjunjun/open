<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@include file="/common/meta.jsp" %>

	<title>wbpm</title>	
	<link rel="stylesheet" type="text/css" href="${ctx}/css/jquery-ui/jquery.ui.css" />
	<link rel="stylesheet" href="${ctx}/css/assets/reset.css"/>
    <link rel="stylesheet" href="${ctx}/css/assets/global.css"/>
	<link rel="stylesheet" href="${ctx}/css/assets/search.css"/>
	
	<script src="${ctx}/js/entry.js" type="text/javascript"></script>
	<script src="${ctx}/js/entry.jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/Common.js" type="text/javascript"></script>
	<script src="${ctx}/jqueryui/jqgrid/main.js" type="text/javascript"></script>
	<script src="${ctx}/jqueryui/dialog/main.js" type="text/javascript"></script>
	<script src="${ctx}/css/assets/kissy-min.js"></script>
	<script src="${ctx}/css/assets/search.js"></script>
	<script type="text/javascript">
	jQuery(document).ready(function(){	
		var setting = {
				url:"${ctx}/user/getPage.do",
				colNames:['id','用户名称','用户账号','用户密码'],
				colModel:[
					   		{name:'id', width:55},
					   		{name:'userName', width:100,editable:true},
					   		{name:'userCode', width:150,editable:true},
					   		{name:'pasword', width:150,editable:true}
					   	],				
				editurl:"${ctx}/user/crud.do",
				toolbar: [true,"top"],
			    caption:"用户管理"
		}
		Common.grid("list","pager",setting);
		$('#t_list').append("<input type='button' id='add' value='新建'/>");
		$('#t_list').append("<input type='button' id='edit' value='编辑'/>");
		$('#t_list').append("<input type='button' id='del' value='删除'/>");
		
		$("#add").bind("click",function(){Common.g_add("list");});
		$("#edit").bind("click",edit);
		$("#del").bind("click",del);	
		initDialogSearch();
	});
	function initDialogSearch(){
		var p = $("#advanced").position();
		$("#advanced").dialog({autoOpen: false,width:500,show:"blind",hide:"blind",position:[p.left,p.top]});
	}
	function add(){
		jQuery("#list").jqGrid('editGridRow',"new",{height:280,reloadAfterSubmit:true,closeAfterAdd: true,modal: true,serializeEditData: function(data){ 	
		    return $.param($.extend({}, data, {id:''}));
		}});
	}
	function edit(){
		var gr = jQuery("#list").jqGrid('getGridParam','selarrrow');
		if( gr.length>0 ){
			jQuery("#list").jqGrid('editGridRow',gr,{reloadAfterSubmit:true,closeAfterEdit: true,serializeDelData: function(data){ 	
				return $.param($.extend({}, data, {id:'', ids:data.id}));
			}});
		}
		else{
			alert("Please Select Row to edit!");
		}
	}
	function del(){
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
	function _search(){
		var bean = new Object();
		var searchField = $("#searchField");
		bean[searchField.attr("code")]= $("#keyword").val();
		$("#list").jqGrid('setGridParam',{postData:null}); 
		$("#list").jqGrid('setGridParam',{postData:bean}); 
		$("#list").trigger("reloadGrid");
	}
	function showAdvanced(mode){
		//mode: open or close
		$("#advanced").dialog(mode);
	}
	function openAdvanceSearch(){
		showAdvanced("open");
	}
	function advanceSearch(){
		var inputs = $("#advanced input[type='text']");
		var bean = new Object();
		for(var i = 0; i < inputs.length; i++){
			bean[inputs[i].id] = inputs[i].value; 
		}
		$("#list").jqGrid('setGridParam',{postData:null}); 
		$("#list").jqGrid('setGridParam',{postData:bean}); 
		$("#list").trigger("reloadGrid");
		showAdvanced("close");
	}
	</script>
</head>
<body >
		<form id="search" name="search" class="clearfix">
            <div id="search-select" class="select">
                <input id="searchField" type="text" code="userName" value="用户名称" readonly="readonly" name="type">
                <ul>
                    <li code="userCode">用户账号</li>
                    <li code="userName">用户名称</li>
                </ul>
            </div>
            <label for="keyword">
                <input type="text" id="keyword" class="keyword" placeholder="请输入查询条件....">
            </label>
            <label for="submit" class="submit"><input id="submit" type="button" value="" onclick="_search()"></label>
            <a href="#" class="search-option" onclick="openAdvanceSearch()">高级搜索</a>
        </form>
        
        <div id="advanced" title="合同查询">
	         <table>
		    	<tr>
		    		<td>用户账号</td>
		    		<td><input id="userCode" type="text" value=""/></td>
		    		<td> 用户名称</td>
		    		<td><input id="userName" type="text" value=""/></td>
		    	</tr>
		    </table>
		    <div style="position:absolute;bottom:5px;right:10px"><img type="button"  onclick="advanceSearch()" value="检索" src="${ctx}/images/search.jpg"></img></div>		    
		 
		</div>
	<br/>
	<table id="list"></table>
	<div id="pager"></div>

</body>

</html>
