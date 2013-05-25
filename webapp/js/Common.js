/**
 * author:wanjunjun 2011-09-29
 */
(function(){
	function Common(){}
	
	Common = {
			ajax:function(url,paraBean,callback){
				$.ajax({
					url:url,
					type:"post",
					dataType:"json",
					data:paraBean,
					cache:false,
					error :function(){
						alert("操作失败!");
					},
					success:function(data){
						if(callback != null){
							callback(data);
						}						
					}
				});
			},
			getIdFromJqGrid:function(jqGridId){
				return $('#'+jqGridId).jqGrid('getGridParam','selrow');
			},
			getIdsFromJqGrid:function(jqGridId){
				return $('#'+jqGridId).jqGrid('getGridParam','selarrrow');
			},
			grid:function(list,pager,setting){
				var initial = {
						url:null,
						datatype: "json",
						mtype:'post',
						colNames:null,
						colModel:null,
						width:800,
						height:350,
						rowNum:15,
						rowList:[10,20,30],
						pager: '#'+pager,
						viewrecords: true,
						jsonReader: { repeatitems : false, id: "0" },
						multiselect: true,
						caption:null						
				};
				$.extend(initial, setting); //用传进来的参数覆盖默认，没传则保留
				$("#"+list).jqGrid(initial);
				$("#"+list).jqGrid('navGrid','#'+pager,{search:false,edit:false,add:false,del:false});
			},
			g_add: function(gid){
				jQuery("#"+gid).jqGrid('editGridRow',"new",{height:280,reloadAfterSubmit:true,closeAfterAdd: true,modal: true,serializeEditData: function(data){ 	
				    return $.param($.extend({}, data, {id:''}));
				}});
			},
			g_edit: function(gid){
				var gr = jQuery("#"+gid).jqGrid('getGridParam','selarrrow');
				if( gr.length>0 ){
					jQuery("#"+gid).jqGrid('editGridRow',gr,{reloadAfterSubmit:true,closeAfterEdit: true,serializeDelData: function(data){ 	
						return $.param($.extend({}, data, {id:'', ids:data.id}));
					}});
				}
				else{
					alert("Please Select Row to edit!");
				}
			},
			g_del: function(gid){
				var gr = jQuery("#"+gid).jqGrid('getGridParam','selarrrow');
				if( gr.length>0 ){
					jQuery("#"+gid).jqGrid('delGridRow',gr,{reloadAfterSubmit:true,serializeDelData: function(data){ 	
						return $.param($.extend({}, data, {id:'',ids:data.id}));
					}});
				}
				else{
					alert("Please Select Row to delete!");
				}
			},
			g_search: function(gid){
				jQuery("#"+gid).jqGrid('searchGrid',{sopt:['cn'],closeAfterSearch: true});
			},
			childTree:function(id,text,data){
				//该方法用于构造二级节点的树，id为树的根结点，text为根结点的名称，data包含叶子结点的数据
				var treeData = [];
				var parentNode = createNode();
				parentNode.id = id;
				parentNode.text = text;
				parentNode.hasChildren = true;
				parentNode.ChildNodes = new Array();
				treeData.push(parentNode);
				if(data == null)return treeData;
				var childNode = null;
				var rows = data.rows;
				for(var i = 0; i < rows.length; i++){
					childNode = createNode();
					for(var p in rows[i]){
						childNode[p] = rows[i][p];
					}
					parentNode.ChildNodes.push(childNode);
				}				
				function createNode(){
					var node = {
							"id":"0",
							"showcheck": true,
							"isexpand": true,
							"checkstate": 0,
							"hasChildren": false,
							"complete": true
					};
					return node;
				}
				return treeData;
			},
			getDate:function(){
				var d = new Date();
				return d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
			}
	};
	
	if(!window.Common){
		window["Common"] = Common;
	}
})();