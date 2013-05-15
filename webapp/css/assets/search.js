/**
 * Created with JetBrains WebStorm.
 * User: 松松
 * Date: 13-4-18
 * Time: 下午3:56
 * To change this template use File | Settings | File Templates.
 */

KISSY.ready(function (S) {
    var DOM = S.DOM, Event = S.Event;
    var input = document.forms['search'].elements['type'];

    var searchSelect = DOM.get('#search-select');
    var ul = DOM.get('ul', searchSelect);
    Event.on(searchSelect, 'click', function (ev) {
        var target = ev.target;
        if (target.nodeName === 'LI') {
            input.value = S.trim(DOM.text(target));
            //依赖JQUERY
            $(input).attr("code", DOM._getAttr(target,"code"));
        }
        DOM.hide(ul);
    });
    Event.on(searchSelect, 'mouseenter mouseleave', function (ev) {
        ev.type === 'mouseenter' ? DOM.show(ul) : DOM.hide(ul);
    })
})