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
		loadDepoTree();		
		bindMenu();
		$("#depo").dialog({autoOpen: false,width:500,height:300});
	});
	function loadDepoTree(){
		Common.ajax("${ctx}/depo/getTree.do?",null,initDepoTree);			
	}
	function initDepoTree(data){				
		var tree = treeSet(data.treeData);	
		$("#depoTree").treeview(tree);
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
						var node = $("#depoTree").getTCT();
						if(node.id == "0" || node.status == "1"){							
							$("#depoTree").disableContextMenuItems(['menu_edit','menu_del']);	
						}else{						
							$("#depoTree").enableContextMenuItems(['menu_edit','menu_del']);
						}						
					}
				}
		};
		tree.data = treeData;
		return tree;
	}
	function treeClick(){
		$("div[id^='depoTree_']").bind({mousedown:function(event){
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
		$("#depoTree").contextMenu({menuId:'contextMenu'});				
	}
	function edit(oper,a){
		$("#d_oper").val(oper);
		if(oper == "edit"){
			var p = $(a.parentNode).filter(".disabled").length;
			if(p == 1){
				return;
			}
			var node = $("#depoTree").getTCT();
			$("#d_id").val(node.id);
			$("#d_name").val(node.text);
			$("#d_code").val(node.code);
			$("#d_province").val(node.province);
			$("#d_city").val(node.city);
			$("#d_address").val(node.address);
		}else{
			$("#d_id").val("");
			$("#d_name").val("");
			$("#d_code").val("");
			$("#d_province").val("");
			$("#d_city").val("");
			$("#d_address").val("");
		}
		$("#depo").dialog("open");
	}	
	function merge(){
		var node = $("#depoTree").getTCT();
		var parentId;
		var bean = new Object();
		if($("#d_oper").val() == "edit"){
			bean.id = $("#d_id").val();
			parentId = node.parent.id;
		}else{
			parentId = node.id;
		}
		if(parentId != "0"){
			bean["parent.id"] = parentId;	
		}		
		bean.name = $("#d_name").val();
		bean.code = $("#d_code").val();
		bean.province = $("#d_province").val();
		bean.city = $("#d_city").val();
		bean.address = $("#d_address").val();
		bean.oper = $("#d_oper").val();
		Common.ajax("${ctx}/depo/crud.do?",bean,loadDepoTree);
		$("#depo").dialog("close");
	}

	function del(a){
		//当菜单项被置为不可用时，不执行该方法
		var p = $(a.parentNode).filter(".disabled").length;
		if(p == 1){
			return;
		}
		var node = $("#depoTree").getTCT();
		var bean = new Object();
		bean.ids = node.id;
		bean.oper = "del";
		Common.ajax("${ctx}/depo/crud.do?",bean,loadDepoTree);
	}
	function cancel(){
		closeDialog('depo');
		$("#depo").hide();
	}
	</script>
</head>
<body>

	<div style="border:1px solid #7f7f7f;padding:3px 0px 3px 5px">提示：1、右键点击仓库节点，可以对仓库进行添加、编辑操作。</div>
	<div id="depoTree" style="width:200px;height:100%;"></div>
	<div id="depo"  title="增加仓库">
	<div style="hieght:25px">&nbsp;</div>
	<input type="hidden" id="d_id">
	<input type="hidden" id="d_oper">
	<table width="100%" style="text-align: center;">
		<tr>
			<td align="right">仓库名称：</td>
			<td><input type="text" id="d_name"/></td>
		</tr>
		<tr>
			<td align="right">仓库编码：</td>
			<td><input type="text" id="d_code"/></td>
		</tr>
		<tr>
			<td align="right">省：</td>
			<td><input type="text" id="d_province"/></td>
		</tr>
		<tr>
			<td align="right">市：</td>
			<td><input type="text" id="d_city"/></td>
		</tr>
		<tr>
			<td align="right">地址：</td>
			<td><input type="text" id="d_address"/></td>
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
		<li id="menu_del" class="delete">
			<a onclick="del(this)">删除</a>
		</li>
	</ul>	

</body>

</html>
