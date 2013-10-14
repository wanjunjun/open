var Init = function() {
	var XD = xui.util.Dom;
	var XE = xui.util.Event;
	var vali = xui.util.Validator;
	var strUtil = xui.util.StringUtil;
	return {
		init : function() {
			var inpTexts = $$('input.INP_text,textarea.INP_text');
			for ( var i = 0; i < inpTexts.length; i++) {
				if (inpTexts[i].readOnly)
					continue;
				XE.on(inpTexts[i], 'focus', Init.initTextFeildClick);
				XE.on(inpTexts[i], 'blur', Init.initTextFeildBlur);
			};
			Init.initGrid();
			var stat2=new Date().valueOf();
		},
		initTextFeildClick : function(event) {
			var inpText = event.srcElement ? event.srcElement : event.target;
			XD.removeClass(inpText, 'INP_text');
			XD.addClass(inpText, 'INP_text_focus');
		},
		initTextFeildBlur : function(event) {
			var inpText = event.srcElement ? event.srcElement : event.target;
			XD.removeClass(inpText, 'INP_text_focus');
			XD.addClass(inpText, 'INP_text');
		},
		/*表格响应*/
		initGrid:function(){
			var grids=$$('table.GRID');
			var canIterableGrids=[];
			$each(grids,function(item,i){
				var trs=item.rows;
				$each(trs,function(tr,j){
					if(XD.hasClass(tr,'iterable')){//获取用于可遍历的tr行
						canIterableGrids.push(tr);
					}
				});
			});
			//对可遍历的tr进行样式调整
			$each(canIterableGrids,function(canIterableGrid,k){
				XE.on(canIterableGrid,'mouseover',function(){
					XD.addClass(this,'hover');
				});
				XE.on(canIterableGrid,'mouseout',function(){
					XD.removeClass(this,'hover');
				});
				
			});
			
		}
	};
}();
