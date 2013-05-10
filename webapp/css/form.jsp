<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/common/taglibs.jsp" %>    
<html lang="en">
<head>
	<%@include file="/common/meta.jsp" %>
	<title>jQuery UI Dialog - Modal form</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/css/jquery-ui/jquery.ui.css" />
	
	<script src="${ctx}/js/entry.js" type="text/javascript"></script>
	<script src="${ctx}/js/entry.jquery.js" type="text/javascript"></script>
	<style>
		body{
			font-size: 62.5%;			
		}
		input.button{cursor:pointer}
		div#users-contain { width: 350px; margin: 20px 0; }
		div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
		div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
	</style>
</head>
<body>
<script type="text/javascript">
function add(){
	var table = $("#tform");
	var size = table[0].rows.length;
	var tr = '<tr><td colspan="2"><input type="text" value="'+size+'" class="ui-widget-content"></td><td><a href="#" onclick="del(this)">delete</a></td></tr>';	
	table.append(tr);
}
function del(a){
	var table = $("#tform");
	var tr = null;
	if(a){
		tr = $(a).parent().parent();	
	}else{
		tr = table.find("tr:last");	
	}	
	tr.remove();
}
</script>


<div id="users-contain" class="ui-widget">
	<h1>Existing Users:</h1>
	<table id="tform" class="ui-widget ui-widget-content">
		<thead>
			<tr class="ui-widget-header ">
				<th>Name</th>
				<th>Email</th>
				<th>Password</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>John Doe</td>
				<td>john.doe@example.com</td>
				<td>johndoe1</td>
			</tr>
			<tr>
				<td><input type="text" name="" class="ui-widget-content"></td>
				<td>
					<select class="ui-widget-content">
						<option value="">aaaaaa</option>
						<option value="">bbbbbb</option>
					</select>				
				</td>
				<td>johndoe1</td>
			</tr>
			<tr>
				<td colspan="3">
					<input class="ui-state-default button" type="button" value="addrow" onclick="add()">
					<input class="ui-state-default button" type="button" value="delrow" onclick="del()">
				</td>
			</tr>
		</tbody>
	</table>
</div>
<button id="create-user">Create new user</button>


</body>
</html>
