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
	<script src="${ctx}/jqueryui/tree/main.js" type="text/javascript"></script>	
	<script src="${ctx}/jqueryui/contextMenu/main.js" type="text/javascript"></script>
	<script src="${ctx}/jqueryui/dialog/main.js" type="text/javascript"></script>
	
	<script type="text/javascript">
	jQuery(document).ready(function(){
		loadRoleTree();		
		bindMenu();
		initUserGrid();
		$("#role").dialog({autoOpen: false,width:500,height:300});
	});
	function loadRoleTree(){
		Common.ajax("${ctx}/role/getTree.do?",null,initRoleTree);			
	}
	function initRoleTree(data){				
		var tree = treeSet(data.treeData);	
		$("#roleTree").treeview(tree);
		//给树节点增加右键点击事件
		treeClick();
	}
	function treeSet(treeData){
		var tree = {
				showcheck: false, 
				cbiconpath:"${ctx}/jqueryui/tree/themes/images/icons/",
				icons: ["checkbox_0.gif", "checkbox_1.gif", "checkbox_2.gif"],
				emptyiconpath:"${ctx}/jqueryui/tree/themes/images/s.gif",
				onnodeclick:function(item){					
					if($("#click_type").val() == "left"){
						loadLinkUserGrid();
					}
					if($("#click_type").val() == "right"){	
						var node = $("#roleTree").getTCT();
						if(node.id == "0" || node.status == "1"){							
							$("#roleTree").disableContextMenuItems(['menu_edit','menu_del']);	
						}else{						
							$("#roleTree").enableContextMenuItems(['menu_edit','menu_del']);
						}						
					}
				}
		};
		tree.data = treeData;
		return tree;
	}
	function treeClick(){
		$("div[id^='roleTree_']").bind({mousedown:function(event){
			//当触发鼠标右键事件时，调用树节点的click方法，将该节点选中
			if(event && event.button==2){
				$("#click_type").val("right");
				this.click();
			}else{
				$("#click_type").val("left");
			}
		}
		});
	}
	function bindMenu(){		
		$("#roleTree").contextMenu({menuId:'contextMenu'});				
	}
	function edit(oper,a){
		$("#r_oper").val(oper);
		if(oper == "edit"){
			var p = $(a.parentNode).filter(".disabled").length;
			if(p == 1){
				return;
			}
			var node = $("#roleTree").getTCT();
			$("#r_id").val(node.id);
			$("#r_name").val(node.text);
			$("#r_security").val(node.roleSecurity);
			$("#r_description").val(node.description);
		}else{
			$("#r_id").val("");
			$("#r_name").val("");
			$("#r_security").val("");
			$("#r_description").val("");
			$("#sjr").attr("disabled",true);
		}
		$("#role").dialog("open");
	}	
	function merge(){
		var node = $("#roleTree").getTCT();
		var parentId;
		var bean = new Object();
		if($("#r_oper").val() == "edit"){
			bean.id = $("#r_id").val();
			parentId = node.parent.id;
		}else{
			parentId = node.id;
		}
		if(parentId != "0"){
			bean["parent.id"] = parentId;	
		}		
		bean.name = $("#r_name").val();
		bean.roleSecurity = $("#r_security").val();
		bean.description = $("#r_description").val();
		bean.oper = $("#r_oper").val();
		Common.ajax("${ctx}/role/crud.do?",bean,loadRoleTree);
		$("#role").dialog("close");
	}

	function del(a){
		//当菜单项被置为不可用时，不执行该方法
		var p = $(a.parentNode).filter(".disabled").length;
		if(p == 1){
			return;
		}
		var node = $("#roleTree").getTCT();
		var bean = new Object();
		bean.ids = node.id;
		bean.oper = "del";
		Common.ajax("${ctx}/role/crud.do?",bean,loadRoleTree);
	}
	function cancel(){
		closeDialog('role');
		$("#role").hide();
	}
	function setRoleMenu(){	
		var node = $("#roleTree").getTCT();
		//var id = $("#list").getCell(gr.toString(),'id');	根据列名取对应值
		window.parent.location.href="${ctx}/role/authority.do?id="+node.id;	
	}
	function loadLinkUserGrid(){
		var role = $("#roleTree").getTCT();
		if($('#gview_linkUser').length>0){
			$("#linkUser").jqGrid('setGridParam',{postData:{roleId:role.id}});
			$('#linkUser').trigger("reloadGrid");
		}else{			
			var setting = {
					url:'${ctx}/role/getRoleLink.do?',
					colNames:['序号','用户名称','用户账号'],				
					colModel:[
						{name:'id', width:25,search:false},
						{name:'userName', width:50,search:false},
						{name:'userCode',  width:50}
					],	
					beforeRequest:function(){
						var param = $("#linkUser").getGridParam("postData");
						if(!param.roleId){
							$("#linkUser").jqGrid('setGridParam',{postData:{roleId:role.id}}); 
						}
					},
					width:600,
					height:160,
					rowNum:15,
					caption:"员工列表",
					toolbar: [true,"top"]
			};
			Common.grid("linkUser","linkUserPager",setting);
			$('#t_linkUser').append("<input type='button' id='addUser' value='添加'/>");
			$('#t_linkUser').append("<input type='button' id='delUser' value='删除'/>");
			$('#t_linkUser').append("<input type='button' id='searchUser' value='查询'/>");
					
			$("#addUser").bind("click",{type:"user"},addLink);
			$("#delUser").bind("click",{type:"user"},delLink);
			$("#searchUser").bind("click",{type:"user"},searchLink);
		}
	}
	
	function addLink(event){
		mask("block");
		$("#userList").trigger("reloadGrid");		
	}
	function delLink(event){
		var ids;
		var role = $("#roleTree").getTCT();
		ids = $("#linkUser").jqGrid('getGridParam','selarrrow');	
		if(ids.length == 0){
			alert("请选择至少一条记录");
			return;	
		}
		var bean = new Object();	
		bean.linkIds = ids.toString();
		bean.id = role.id;
		bean.type = event.data.type;
		Common.ajax("${ctx}/role/delRoleLink.do",bean,function(){cback(event.data.type);});
	}	
	function searchLink(event){
		jQuery("#linkUser").jqGrid('searchGrid',{sopt:['cn'],closeAfterSearch: true});
	}
	
	function initUserGrid(){		
		var setting_user = {
			url:'${ctx}/user/getPage.do', 
			width:500,
			height:150,
			rowNum:10,
			colNames:['序号','用户姓名','用户账号'],
			colModel:[
				{name:'id',hidden:true, width:55},
				{name:'userName', width:100,search:false},
				{name:'userCode', width:100}
			],
			multiselect: true,
			toolbar: [true,"top"]
		};
		Common.grid("userList","userPager",setting_user);
		$('#t_userList').append("<input type='button' id='confirm' value='确定'/>");
		$('#t_userList').append("<input type='button' id='_find' value='查询'/>");
		$("#confirm").bind("click",{type:"user"},confirm);
		$("#_find").bind("click",_find);
	}
	
	function _find(){
		jQuery("#userList").jqGrid('searchGrid',{sopt:['cn'],closeAfterSearch: true});		
	}
	function confirm(event){
		var ids;
		var role = $("#roleTree").getTCT();
		if(event.data.type == "user"){
			ids = $("#userList").jqGrid('getGridParam','selarrrow');	
		}
		if(ids.length == 0){
			alert("请选择至少一条记录");
			return;	
		}
		var bean = new Object();	
		bean.linkIds = ids.toString();
		bean.id = role.id;
		bean.type = event.data.type;
		Common.ajax("${ctx}/role/addRoleLink.do",bean,function(){cback(event.data.type);});		
	}
	function cback(type){
		if(type == "user"){
			mask("none");
			loadLinkUserGrid();
		}
	}
	function mask(block){	
		$('#mask_').css("display",block);
		$('#main_').css("display",block);	
	}
	</script>
</head>
<body>

	<div style="border:1px solid #7f7f7f;padding:3px 0px 3px 5px">提示：1、左键点击角色节点，可以查看角色关联用户；2、右键点击角色节点，可以对角色进行添加、编辑操作。</div>
	<div id="role"  title="增加角色">
	<div style="hieght:25px">&nbsp;</div>
	<input type="hidden" id="r_id">
	<input type="hidden" id="r_oper">
	<table width="100%" style="text-align: center;">
		<tr>
			<td align="right">角色名称：</td>
			<td><input type="text" id="r_name"/></td>
		</tr>
		<tr>
			<td align="right">Security：</td>
			<td><input type="text" id="r_security"/></td>
		</tr>
		<tr>
			<td align="right">Description：</td>
			<td><input type="text" id="r_description"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<div style="hieght:20px;width:100%">&nbsp;</div>
			</td>			
		</tr>
		<tr>
			<td colspan="2"  align="center">
				<input type="button" value="确定" onclick="merge()"/>
				<input type="button" value="取消" onclick="cancel()" style="margin-left:25px;"/>				
			</td>			
		</tr>
	</table>
	</div>	
	
	<input type="hidden" id="click_type">
	<ul id="contextMenu" class="contextMenu">
		<li class="paste">
			<a onclick="edit('add')">添加</a>
		</li>
		<li id="menu_edit" class="edit">
			<a onclick="edit('edit',this)">修改</a>
		</li>
		<li class="copy">
			<a onclick="setRoleMenu()">权限</a>
		</li>
		<li id="menu_del" class="delete">
			<a onclick="del(this)">删除</a>
		</li>
	</ul>	
	<table>
		<tr>
			<td width="30%" valign="top"><div id="roleTree" style="width:200px;height:100%;"></div></td>	
			<td width="70%">
				<span>
				<table id="linkUser"></table>
				<div id="linkUserPager"></div>
				</span>
			</td>
		</tr>
	</table>	
	
<!-- dialog -->
<div id="mask_" class="ui-widget-overlay" style="height: 100%; width: 100%; position: fixed; left: 0px; top: 0px; z-index: 899; opacity: 0.3;display: none;">
</div>
<div id="main_" class="ui-widget ui-widget-content ui-corner-all ui-jqdialog jqmID1" dir="ltr" style="width: 600px; height: auto; z-index: 900; overflow: hidden; top: 94px; left: 200px; display: none;">
	<div id="head_" class="ui-jqdialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix" style="cursor: move;">
	<span class="ui-jqdialog-title" style="float: left;">选择用户</span>
	<a class="ui-jqdialog-titlebar-close ui-corner-all" href="javascript:mask('none');" style="right: 0.3em;">
	<span class="ui-icon ui-icon-closethick"></span>
	</a>
	</div>
	<div id="content" class="ui-jqdialog-content ui-widget-content">		
		<table id="userList"></table>
		<div id="userPager"></div>
	</div>
</div>	
</body>

</html>
