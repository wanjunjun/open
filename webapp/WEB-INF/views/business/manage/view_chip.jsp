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
				url:"${ctx}/transport/getDetailPage.do",
				colNames:['id','芯片ID','类型','位置','是否到货','司机','车牌号'],
				colModel:[
					   		{name:'id', width:55},
					   		{name:'boxId', width:100},
					   		{name:'boxType', width:150},
					   		{name:'transPort.location', width:150},
					   		{name:'isArrived', width:150},					   		
					   		{name:'transPort.driver', width:150},
					   		{name:'transPort.carNo', width:150}
					   	],
				toolbar: [true,"top"],
			    caption:"芯片查询"
		};
		Common.grid("list","pager",setting);
		$('#t_list').append("<input type='button' id='exp' value='导出'/>");
		
		$("#exp").bind("click",exportDetail);
		initDialogSearch();
	});
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
	function exportDetail(){
		var inputs = $("#advanced input[type='text']");
		var param = "";
		for(var i = 0; i < inputs.length; i++){
			//bean[inputs[i].id] = inputs[i].value; 
			param += inputs[i].id + "=" + inputs[i].value + "&";
		}
		
		window.location.href = "${ctx}/transport/exportDetail.do?"+param;
	}
	</script>
</head>
<body >
		<form id="search" name="search" class="clearfix">
            <div id="search-select" class="select">
                <input id="searchField" type="text" code="boxId" value="芯片ID" readonly="readonly" name="type">
                <ul>
                    <li code="boxId">芯片ID</li>
                </ul>
            </div>
            <label for="keyword">
                <input type="text" id="keyword" class="keyword" placeholder="请输入查询条件....">
            </label>
            <label for="submit" class="submit"><input id="submit" type="button" value="" onclick="_search()"></label>
            <a href="#" class="search-option" onclick="openAdvanceSearch()">高级搜索</a>
        </form>
        
        <div id="advanced" title="芯片查询">
	         <table>
		    	<tr>
		    		<td>芯片ID</td>
		    		<td><input id="boxId" type="text" value=""/></td>
		    		<td>司机名称</td>
		    		<td><input id="dirver" type="text" value=""/></td>
		    	</tr>
		    	<tr>
		    		<td>车牌号</td>
		    		<td><input id="carNo" type="text" value=""/></td>
		    		<td></td>
		    		<td></td>
		    	</tr>
		    </table>
		    <div style="position:absolute;bottom:5px;right:10px"><img type="button"  onclick="advanceSearch()" value="检索" src="${ctx}/images/search.jpg"></img></div>		    
		 
		</div>
	<br/>
	<table id="list"></table>
	<div id="pager"></div>

</body>

</html>
