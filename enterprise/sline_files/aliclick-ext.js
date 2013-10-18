/**
 * 打点工具扩展<br />
 * 依赖xui-core.js<br />
 * 页面不需要引入aliclick.js，本脚本在判断未引入时会自动去引入<br />
 * 请在页面加载完全并且前端渲染的动态数据也加载完成后（如Grid组件的数据加载完全）调用<br />
 * 使用方法：<br />
 * 
 * 1: <input type="button" aliclickkey="test_key_input" value="第1种情况" /><br />
 * 2: <a href="#" aliclickkey="test_key_a">第2种情况</a> <br />
 * 3: <span class="xui-xxx-xxx">第3种情况</span> <br />
 * 
 * js 代码：<br />
 * 
 * <pre>
 * AliclickExt.initAliclick(); // 第1、2种情况
 * AliclickExt.initSpecified($$('.xui-xxx-xxx', document)[0], 'test_key_span'); // 第3种情况
 * </pre>
 * 
 * @author jinggang.huangjg
 */
var AliclickExt = new function(){
	var _attrName = 'aliclickkey';
	var _initedAttr = 'aliclickInited';

	/**
	 * 打点的事件，默认为鼠标点击事件
	 */
	var _defaultEvent = 'mousedown';

	return {
		initAliclick : function(root, event) {  
			var e = event ? event : _defaultEvent;
			var r = root ? root : document;
			var els = $$('[' + _attrName + ']', r);
			$each(els, function(el) {
				AliclickExt._bind(el, e);
			});
		},
		/**
		 * 针对单个参数的打点（绑定事件）
		 */
		_bind : function(el, e, key) {
			if(!el){
				return;
			}
			var inited = el.getAttribute(_initedAttr);
			if(inited == 'true'){
				return;
			}
			var aliclickKey = key ? key : el.getAttribute(_attrName);
			if (aliclickKey != '') {
				aliclickKey = aliclickKey.toLowerCase();
			}
			xui.util.Event.on(el, e, function() {
				if (typeof window.dmtrack != 'undefined') {
					dmtrack.tracelog(aliclickKey);
				}
			});
			el.setAttribute(_initedAttr, 'true');
		},
		initSpecified : function(el, aliclickKey, event) {
			var e = event ? event : _defaultEvent;
			AliclickExt._bind(el, e, aliclickKey);
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
		}
	};
}();