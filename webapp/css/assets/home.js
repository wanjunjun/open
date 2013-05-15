/**
 * Created with JetBrains WebStorm.
 * User: 松松
 * Date: 13-3-21
 * Time: 上午10:35
 * To change this template use File | Settings | File Templates.
 */

if ('undefined' == typeof(document.body.style.maxHeight)) {
    $(function () {
        $('#nav div.content>div.nav>ul>li').hover(function (ev) {
            $(this).addClass('hover');
        }, function () {
            $(this).removeClass('hover');
        });
    })
}

$(function () {
    $('div.win8-metro').each(function (i, node) {
        scroll(node);
    })
});

function scroll(node) {

    var $node = $(node);

    var wrapper = $(node).find('div.wrapper');

    var delay = $node.attr('data-config');
    var config = $.parseJSON(delay);

    function _scroll() {
        var item = $(node).find('div.item');
        item.eq(0).clone().appendTo(wrapper);
        item.eq(0).animate({marginTop: -(item.eq(0).height())}, config.interval, 'swing', function () {
            item.eq(0).remove();
            setTimeout(_scroll, config.delay);
        })
    }

    setTimeout(_scroll, 1000);

}