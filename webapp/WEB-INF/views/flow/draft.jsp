<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@include file="/common/meta.jsp" %>

	<title>草稿箱</title>	
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
				url:"${ctx}/flowProcess/getDraft.do",
				colNames:['id','流程名称','申请人','申请时间','操作'],
				colModel:[
					   		{name:'id', width:55},
					   		{name:'flow.name', width:100},
					   		{name:'user.userName', width:150},
					   		{name:'createTime', width:150},
					   		{name:'operation', align:"center"}
					   	],		
			    caption:"待审批流程",
			    gridComplete:function(){
			    	var ids=jQuery("#list").jqGrid('getDataIDs');
			    	for(var i=0; i<ids.length; i++){
			    		var id=ids[i];
			    		var action = "<a href='#' style='color:#f60' onclick='modify(" + id + ")'>修改</a>"; 
			    		jQuery("#list").jqGrid('setRowData', ids[i], { operation: action});
			    	}			    	
			    }
		}
		Common.grid("list","pager",setting);
	});
	function modify(id){
		window.location.href = "${ctx}/flowProcess/showFlowForm.do?oper=draft&id="+id;
	}
	function initDialogSearch(){
		var p = $("#advanced").position();
		$("#advanced").dialog({autoOpen: false,width:500,show:"blind",hide:"blind",position:[p.left,p.top]});
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
	<!-- 	
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
	-->
	<table id="list"></table>
	<div id="pager"></div>

</body>

</html>
