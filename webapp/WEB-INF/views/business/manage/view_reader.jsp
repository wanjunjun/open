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
	<script src="${ctx}/jqueryui/datepicker/main.js" type="text/javascript"></script>
	<script src="${ctx}/css/assets/kissy-min.js"></script>
	<script src="${ctx}/css/assets/search.js"></script>
	<script type="text/javascript">
	jQuery(document).ready(function(){	
		var setting = {
				url:"${ctx}/reader/searchReader.do",
				colNames:['卡片ID','阅读器IP','读取时间','阅读器仓库'],
				colModel:[
					   		{name:'ticket_id', width:100},
					   		{name:'reader_ip', width:100},
					   		{name:'reader_time', width:150},
					   		{name:'name', width:150}
					   	],			
				toolbar: [true,"top"],
			    caption:"卡片查询"
		}
		Common.grid("list","pager",setting);
		initDialogSearch();
		$("#s_date").datepicker({showOn: "button", buttonImage: "images/calendar.gif", buttonImageOnly: true});
		$("#s_date").datepicker( "option", "dateFormat", "yy-mm-dd");
		$("#e_date").datepicker({showOn: "button", buttonImage: "images/calendar.gif", buttonImageOnly: true});
		$("#e_date").datepicker( "option", "dateFormat", "yy-mm-dd");
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
	</script>
</head>
<body >
		<form id="search" name="search" class="clearfix">
            <div id="search-select" class="select">
                <input id="searchField" type="text" code="readerIp" value="阅读器ip" readonly="readonly" name="type">
                <ul>
                    <li code="readerIp">阅读器ip</li>
                </ul>
            </div>
            <label for="keyword">
                <input type="text" id="keyword" class="keyword" placeholder="请输入查询条件....">
            </label>
            <label for="submit" class="submit"><input id="submit" type="button" value="" onclick="_search()"></label>
            <a href="#" class="search-option" onclick="openAdvanceSearch()">高级搜索</a>
        </form>
        
        <div id="advanced" title="阅读器查询">
	         <table>
		    	<tr>
		    		<td width="20%">仓库</td>
		    		<td width="30%"><input id="depoName" type="text" value=""/></td>
		    		<td width="20%"></td>
		    		<td width="30%"></td>
		    	</tr>
		    	<tr>
		    		<td>读取时间</td>
		    		<td colspan="3">
		    			<input id="s_date" type="text" value=""/>
		    			<input id="e_date" type="text" value=""/>
		    		</td>		    		
		    	</tr>
		    </table>
		    <div style="position:absolute;bottom:5px;right:10px"><img type="button"  onclick="advanceSearch()" value="检索" src="${ctx}/images/search.jpg"></img></div>		    
		 
		</div>
	<br/>
	<table id="list"></table>
	<div id="pager"></div>

</body>

</html>
