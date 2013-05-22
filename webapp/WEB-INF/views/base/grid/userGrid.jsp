<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>user grid</title>	
	<script type="text/javascript">
	jQuery(document).ready(function(){	
		$("#userContainer").dialog({autoOpen: false,width:400,height:350});
		
		var setting = {
				url:"${ctx}/user/getPage.do",
				colNames:['id','用户名称','用户账号'],
				multiselect: false,
				width: 350,
				height: 200,
				colModel:[
					   		{name:'id', hidden: true, width:55},
					   		{name:'userName', width:100},
					   		{name:'userCode', width:100}
					   	],	
				toolbar: [true,"top"],
				onSelectRow: function(id){
					var rd = $('#userList').getRowData(id);
					getUser(rd);
					hideUser();
				}
			    //caption:"用户列表"
		}
		Common.grid("userList","userPager",setting);
		$('#t_userList').append("<input type='button' id='search' value='查询'/>");		
		$("#search").bind("click",function(){Common.g_search("userList");});	
		
	});
	
	
	function showUser(){
		$("#userContainer").dialog("open");
	}
	function hideUser(){
		$("#userContainer").dialog("close");
	}
	</script>
</head>
<body>
<div id="userContainer" title="用户列表">	        
	<table id="userList"></table>
	<div id="userPager"></div>
</div>	
</body>

</html>
