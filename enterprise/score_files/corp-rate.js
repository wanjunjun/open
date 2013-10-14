/**
 * 店铺评价详情展现
 * @author J
 */
var RouteRate = function(block){
	this.renderTo = block;
	this.pageSize = 15;
};

RouteRate.prototype.renderer = function(pageIndex, defoult) {
	var url = '/corp/corp_comments.htm';
	var params = {
			'corpId' : jQuery('#corpId').val(),
			'showType' : (defoult == 'default' ? defoult : jQuery('#showType').val()),
			'pageIndex' : pageIndex,
			'pageSize' : this.pageSize
	};
	var callback = function() {
		//jQuery("html,body").animate({scrollTop: jQuery("body").offset().top}, 500);
	};
	jQuery(this.renderTo).load(url, params, callback);
};

var routeRate = new RouteRate("#tb-r-comments-block");

function loadPage(pageIndex, defoult) {
	if (jQuery(routeRate.renderTo) == undefined) return;
	if (pageIndex == -1) {
		var offer = Math.abs(parseInt(jQuery('#showOfferSet').val()));
		if (!jQuery('#showOfferSet').val()) return;
		if (offer < 1) return;
		if (parseInt(jQuery('#v_pageSize').val()) < offer) return;
		pageIndex = offer ;
	}
	routeRate.renderer(pageIndex, defoult);
}