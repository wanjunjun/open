/**
 * 打点工具扩展，使用原生javascript，不依赖于xui，但依赖jQuery<br />
 * 使用方法：<br />
 * 
 * 1: <input type="button" aliclickkey="test_key_input" value="第1种情况" /><br />
 * 2: <a href="#" aliclickkey="test_key_a">第2种情况</a> <br />
 * 3: <span class="xui-xxx-xxx">第3种情况</span> <br />
 * 
 * js 代码：<br />
 * 
 * <pre>
 * ALP.Util.tracelog.initAliclick(); // 第1、2种情况
 * ALP.Util.tracelog.initSpecified(elementNotWritenByYou, 'test_key_span'); // 第3种情况
 * ALP.Util.tracelog.traceDirectly('my_key'); //直接打点
 * </pre>
 * 
 * @author jinggang.huangjg
 */
jQuery.namespace("ALP.Util");
jQuery.namespace("ALP.util");
ALP.util = ALP.Util;	// 兼容处理
(function($) {
	ALP.Util.tracelog = function() {
		var _attrName = 'aliclickkey';
		var _initedAttr = 'aliclickInited';
		var _logistics_url = document.location.protocol + "//stat.1688.com/logistics.html";//物流专用打点url

		/**
		 * 打点的事件，默认为鼠标点击事件
		 */
		var _defaultEvent = 'mousedown';

		return {
			initAliclick : function(event) {
				var e = event ? event : _defaultEvent;
				var els = $('[' + _attrName + ']');
				if (els) {
					els.each(function() {
						ALP.Util.tracelog._bind(this, e);
					});
				}
			},

			/**
			 * 针对单个参数的打点（绑定事件）
			 * 
			 * @param el
			 *            被打点的元素的id或者element或者jQuery对象
			 * @param e
			 *            要绑定的事件名称
			 * @param key
			 *            打点的值
			 */
			_bind : function(el, e, key) {
				if (!(el instanceof jQuery)) {
					if (el.nodeType) {
						el = $(el);
					} else if (typeof el === "string") {
						el = $('#' + el);
					} else {
						return;
					}
				}
				if (!el) {
					return;
				}
				var inited = el.attr(_initedAttr);
				if(inited == 'true'){
					// 已经初始化
					return;
				}
				var aliclickKey = key ? key : el.attr(_attrName);
				if (aliclickKey != '') {
					aliclickKey = aliclickKey.toLowerCase();
				}
				el.bind(e, aliclickKey, function(event) {
					if (typeof window.dmtrack != 'undefined') {
						dmtrack.tracelog(event.data);
					}
				});
				el.attr(_initedAttr, 'true');
			},

			initSpecified : function(el, aliclickKey, event) {
				var e = event ? event : _defaultEvent;
				ALP.Util.tracelog._bind(el, e, aliclickKey);
			},

			traceDirectly : function(key) {
				if (typeof (key) != 'string') {
					return;
				}
				if (typeof window.dmtrack != 'undefined') {
					dmtrack.tracelog(key);
				}
			},

			clickObjectTrace : function(params) {
				if (typeof (params) != 'object') {
					return;
				}
				if (typeof window.dmtrack != 'undefined') {
					dmtrack.clickstat(dmtrack.tracelog_url, params);
				}
			},
			/**
			 * 打点到物流url上，根据alptype区分打点类型
			 * @param params 参数 可以是object或者是string
			 */
			traceLogistics: function(params) {
			    var url = _logistics_url;
			    if (!params) {return false;};
			    if (typeof window.dmtrack != 'undefined') {
                    dmtrack.clickstat(url, params);
                }
			}
		};
	}();
	ALP.Util.aliclickExt = ALP.Util.tracelog;	// 兼容处理
})(jQuery);