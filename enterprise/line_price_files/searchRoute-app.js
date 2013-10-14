/**
 * 用于查询价格页面
 */
var SearchRouteApp = function() {
	var XE = xui.util.Event;
	var sProvinceDefault;
	var sCityDefault;
	var sCountyDefault;
	var rProvinceDefault;
	var rCityDefault;
	var rCountyDefault;
	return {
		init : function() {
			// 初始化隐藏参数
			SearchRouteApp._setDefaultVar();
			// 初始化公共部分
			//EstimateCommonApp.init();
			Init.init();
			// 提交按钮
			//XE.on($('queryBtn'), 'click', SearchRouteApp._submit);			

		},
		
		_setDefaultVar : function() {
			sProvinceDefault = $('senderProvince').value;
			sCityDefault = $('senderCity').value;
			sCountyDefault = $('senderCounty').value;
			rProvinceDefault = $('receiverProvince').value;
			rCityDefault = $('receiverCity').value;
			rCountyDefault = $('receiverCounty').value;
		},
		
		/**
		 * 提交表单
		 * 
		 * @returns
		 */
		_submit : function() {
			$('offerSet').value = 0;
			if (jQuery('#queryForm')) {				
				jQuery('#queryForm').submit();
			}
		}
	};
}();