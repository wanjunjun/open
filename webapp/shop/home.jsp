<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="gb2312"><head>
    <meta content="text/html; charset=gbk" http-equiv="content-type">
    <title>网上发货从这里开始</title>
      
    <link rel="stylesheet" href="${ctx}/shop/css/home.css" >
	<link rel="stylesheet" href="${ctx}/shop/css/standard-v0.css"><!-- 页脚效果 -->
	<link rel="stylesheet" href="${ctx}/jqueryui/jarea/theme/layout.css">
	<link rel="stylesheet" href="${ctx}/jqueryui/jarea/theme/jquery.jarea.css">
    
	<script src="${ctx}/js/entry.js" type="text/javascript"></script>
	<script src="${ctx}/js/entry.jquery.js" type="text/javascript"></script>
	
    <script>
    $(document).ready(function(){    	
		initTab("tab");
		initTab("hot");
				
    });
	function initTab(id){
		var divs = $("#"+id+">div");
		$("#"+id+">ul>li").each(function(index){
			$(this).bind("click",function(){
				$("#"+id+">ul>li.current").removeClass("current");
				$(this).addClass("current");
				divs.hide();
				$(divs.get(index)).show();
								
			});
		});
	}
	function doSearch(type){
		alert($("#s-area").val());
	}
    </script>
     
	  <style type="text/css">
	  	.index .banner ul  {
	        width: 120px;
	    	left: 260px;
	    }
	  </style>



</head>
<body data-spm="2176793">
<div class="provinceCityAll" style="z-index:9999">
  <div class="tabs clearfix">
    <ul class="">
      <li><a href="javascript:" class="current" tb="hotCityAll">热门城市</a></li>
      <li><a href="javascript:" tb="provinceAll">省份</a></li>
      <li><a href="javascript:" tb="cityAll" id="cityAll">城市</a></li>
      <li><a href="javascript:" tb="countyAll" id="countyAll">区县</a></li>
    </ul>
  </div>
  <div class="con">
    <div class="hotCityAll invis">
      <div class="pre"><a></a></div>
      <div class="list">
        <ul>
          <!-- 					<li><a href="javascript:"  class="current">南京</a></li> -->
        </ul>
      </div>
      <div class="next"><a class="can"></a></div>
    </div>
    <div class="provinceAll invis">
      <div class="pre"><a></a></div>
      <div class="list">
        <ul>
          <!-- 					<li><a href="javascript:"  class="current">江西省</a></li> -->
        </ul>
      </div>
      <div class="next"><a class="can"></a></div>
    </div>
    <div class="cityAll invis">
      <div class="pre"><a></a></div>
      <div class="list">
        <ul>
          <!-- 					<li><a href="javascript:"  class="current">南京</a></li> -->
        </ul>
      </div>
      <div class="next"><a class="can"></a></div>
    </div>
    <div class="countyAll invis">
      <div class="pre"><a></a></div>
      <div class="list">
        <ul>
        </ul>
      </div>
      <div class="next"><a class="can"></a></div>
    </div>
  </div>
</div>
<!-- area div -->    
<div id="doc" class="index mod-spm" data-spm="5732505">

<%@include file="/shop/header.jsp" %>

<div id="alp-nav">
    <div class="screen">
        <ul>
                      
             <li class="current">
                  <a href="http://56.1688.com/?tracelog=56_laiyuan_yemian_sy_dh_20130226sy" target="_blank">首页</a></li>

              <li class="">
                  <a data-spm-anchor-id="a2608.2176793.5732505.64" href="login.htm" target="_blank">我的物流</a></li>

              <li>
                <a href="ship.htm" target="_blank">我要发货</a></li>

               <li class="">
                  <a href="line.htm" target="_blank" data-spm-anchor-id="a2608.2176793.5732505.11">查询线路</a></li>
 				               
               <li>
                 <a href="net.htm" target="_blank">查询网点</a></li>
          
               <li class="">
                 <a href="track.htm" target="_blank">物流跟踪</a></li>
               
        </ul>
        <div class="r">
         <span>
            <a href="${ctx}/shop/enterprise/apply_join.jsp" target="_blank" cmsid="33">物流商申请入驻</a>
          </span>              
            |
            <a href="http://i56.1688.com/index.htm" target="_blank">物流商登录</a>
        </div>

    </div>
</div>   

<div id="content" class="screen">
<div class="layout z-in">
    <div style="display: none; top: 49px; left: 167px;" id="s-area-s" class="area-tab"></div>
    <div style="display: none;" id="d-area-s" class="area-tab"></div>
    <div style="display: none; top: 49px; left: 171px;" id="net-area-s" class="area-tab"></div>
    <div class="grid-9 query">
        <div id="tab" class="tab">
            <ul class="q">
                <li class="f-tab-t current"><i class="i-2"></i>查询线路</li>
                <li class="f-tab-t"><i class="i-4"></i>查询网点</li>
                <li class="f-tab-t"><i class="i-6"></i>物流跟踪</li>
            </ul>
            <div style="display: block;" class="f-tab-b">
                <div class="in">
                    <div class="l"><label class="a">发货地</label><input value="湖北省-武汉市" aria-haspopup="true" aria-autocomplete="list" role="textbox" id="s-area" class="city_input  inputFocus proCityQueryAll proCitySelAll" autocomplete="off"><i class="i-7 open" action="0"></i></div>
                    <div class="l"><label class="a b">收货地</label><input value="城市名(中文/拼音)" aria-haspopup="true" aria-autocomplete="list" role="textbox" id="d-area" class="city_input  inputFocus proCityQueryAll proCitySelAll" autocomplete="off"><i class="i-7 open desa" action="1"></i></div>
                    <div id="recomendRoute" class="cc often" action="1"></div>
                    <div class="e"><button aliclickinited="true" class="b-q b-submit" action="f-price" aliclickkey="itu_tran_index_56_searchroad" onclick="doSearch(1)">查&nbsp;&nbsp;询</button></div>
                </div>
            </div>
            <div style="display: none;" class="f-tab-b">
                <div class="in">
                    <div class="l"><label class="a b">地&nbsp;&nbsp;&nbsp;&nbsp;区</label><input value="城市名(中文/拼音)" aria-haspopup="true" aria-autocomplete="list" role="textbox" id="net-area" class="city_input  inputFocus proCityQueryAll proCitySelAll" autocomplete="off"><i class="i-7 open" action="2"></i></div>
                    <div id="recomendSite" class="cc often" action="2"><a href="javascript:;" province="110000" city="110100" county=""> 北京 </a><a href="javascript:;" province="310000" city="310100" county=""> 上海 </a><a href="javascript:;" province="440000" city="440100" county=""> 广州 </a><a href="javascript:;" province="440000" city="440300" county=""> 深圳 </a></div>
                    <div class="l"><label class="a">街&nbsp;&nbsp;&nbsp;&nbsp;道</label><input class="area-text " autocomplete="off" id="net-name"></div>
                    <div class="e"><button aliclickinited="true" class="b-q b-submit" action="f-net" aliclickkey="itu_tran_index_qkworkno">查&nbsp;&nbsp;询</button></div>
                </div>
            </div>
            <div style="display: none;" class="f-tab-b">
                <div id="ali_itu_wl_section" class="ali_itu_wl_section pinyin-trace-panel" ali_wuli_opts="corpType:expressFull;"><ul style="z-index: 101; top: 0px; left: 0px; display: none;" role="listbox" class="ui-autocomplete ui-menu"></ul></div>
                <div class="ali_itu_logistics_msg1"></div>
                <div class="ali_itu_logistics_msg2"></div>
                <div id="ali_itu_wl_sltLs" class="in ali_itu_wl_INP_select">
                    <div class="l ali_itu_wl_choose">
                        <label class="a b">物流商</label>
                        <input aria-haspopup="true" aria-autocomplete="list" role="textbox" id="ali_itu_wl_logisticsCompId" class="ali_itu_wl_INP_text ui-autocomplete-input" onblur="this.className='ali_itu_wl_INP_text'" onfocus="this.className='ali_itu_wl_INP_text_focus'" value="请选择或输入物流公司" autocomplete="off" type="text">
                        <i id="ali_itu_wl_b_selectArrow" class="i-22"></i>
                    </div>
                    <div class="cc trace" action="3">
                        <a data="DEPPON" corpname="德邦物流" href="javascript:;">德邦</a>
                        <a data="JIAJI" corpname="佳吉快运" href="javascript:;">佳吉</a>
                        <a data="YTO" corpname="圆通速递" href="javascript:;">圆通</a>
                        <a data="STO" corpname="申通快递" href="javascript:;">申通</a>
                    </div>
                    <div class="ali_itu_wl_Inquiry">
                        <label class="a b">运单号</label>
                        <input id="ali_itu_wl_ls_search" class="ali_itu_wl_INP_text" onfocus="this.className='ali_itu_wl_INP_text_focus'" autocomplete="off" onblur="this.className='ali_itu_wl_INP_text'" value="请输入你要查询的运单号" type="text">
                    </div>
                    <div class="ali_itu_wl_vc" id="ali_itu_wl_vc">
                        <div class="vcWraper">
                            <label class="vcTitle a b">验证码</label>
                            <input id="ali_itu_wl_vc_ipt" class="ali_itu_wl_INP_text" autocomplete="off" onfocus="this.className='ali_itu_wl_INP_text_focus'" onblur="this.className='ali_itu_wl_INP_text'" value="请输入验证码" type="text">
                        </div>
                        <div id="verifyCodeImgDiv" class="verifyCodeImgDiv"></div>
                    </div>
                    <div class="e">
                        <button aliclickinited="true" id="ali_itu_wl_b_query" class="b-q ali_itu_wl_b_query" aliclickkey="itu_tran_index_qkorderrec">查&nbsp;&nbsp;询</button>
                    </div>
                </div>
            </div>
        </div>
        <form id="f-price" method="get" action="http://56.1688.com/order/price/estimate_price.htm#tab" target="_blank">
            <input value="" class="hidden-area" autocomplete="off" name="sp" type="hidden">
            <input value="" class="hidden-area" autocomplete="off" name="sc" type="hidden">
            <input value="" class="hidden-area" autocomplete="off" name="sy" type="hidden">
            <input value="" class="hidden-area" autocomplete="off" name="rp" type="hidden">
            <input value="" class="hidden-area" autocomplete="off" name="rc" type="hidden">
            <input value="" class="hidden-area" autocomplete="off" name="ry" type="hidden">
            <input name="notFirst" value="true" type="hidden">
        </form>
        <form id="f-net" method="get" action="http://56.1688.com/order/search_work_no.htm" accept-charset="utf-8" onsubmit="document.charset='utf-8';" target="_blank">
            <input value="" class="hidden-area" autocomplete="off" name="province" type="hidden">
            <input value="" class="hidden-area" autocomplete="off" name="city" type="hidden">
            <input value="" class="hidden-area" autocomplete="off" name="county" type="hidden">
            <input class="hidden-area" autocomplete="off" name="address" type="hidden">
            <input name="type" value="list" autocomplete="off" class="hidden-area" type="hidden">
        </form>
        <form id="ali_itu_wl_form" name="ali_itu_wl_form" action="http://56.1688.com/order/logistics_trace.htm" method="post" target="_blank">
            <input name="ali_itu_wl_com" id="ali_itu_wl_com" type="hidden">
            <input name="ali_itu_wl_mailNo" id="ali_itu_wl_mailNo" type="hidden">
            <input name="ali_itu_wl_verifyCode" id="ali_itu_wl_verifyCode" type="hidden">
            <input name="ali_itu_wl_extraInfo" id="ali_itu_wl_extraInfo" type="hidden">
            <input name="ali_itu_wl_comName" id="ali_itu_wl_comName" type="hidden">
        </form>
        <div class="i-21 step"></div>
    </div>
    <div id="banner" class="grid-10 banner">
        <ul>
            <li class="f-tab-t">1</li>
            <li class="f-tab-t">2</li>
            <li class="f-tab-t current">3</li>
            <li class="f-tab-t">4</li>
            <li class="f-tab-t">5</li>
        </ul>

      <div style="display: none;" class="f-tab-b"><a href="http://page.1688.com/zhide7dai.html?tracelog=56_laiyuan_yemian_925_56sy0912" target="_blank"><img src="index_files/1686721_1877011556.png" alt="925全场7折起发货"></a></div>
      <div style="display: none;" class="f-tab-b"><a href="http://e56.tmall.com/?tracelog=56_laiyuan_yemian_sy_main_0913wlfw" target="_blank">
<img src="index_files/1691509_706500302.jpg" alt="服务市场"></a></div>
        <div style="display: block;" class="f-tab-b"><a href="http://view.1688.com/cms/promotion/ycl/201305/index.html?tracelog=56_laiyuan_yemian_wxb0913" target="_blank"><img src="index_files/1692020_1786064757.jpg" alt="阿里妈妈快销汇！"></a></div>
      <div style="display: none;" class="f-tab-b"><a href="http://www.uk.ebpcn.com/" target="_blank"><img src="index_files/1677616_1877011556.jpg" alt="欧洲商务包裹"></a></div>
        <div style="display: none;" class="f-tab-b"><a href="http://tao.1688.com/huodong/songwuliuquan.html?tracelog=56_laiyuan_yemian_sy_main_20130912thy" target="_blank"><img src="index_files/1685679_1172996508.jpg" alt="来就送物流抵用券！"></a></div>        
       
        
    </div>
    <div class="grid-6 grid-fixed">
        <div class="value">
            <div class="date" id="value_date">2013-09<div>16</div></div>
            <ul class="v fd-clr">
                <li>线路<i id="value_route_count">3353638</i>条</li>
                <li style="margin-right:0;">新增<i id="value_route_add" style="margin-right:0;">775</i>条</li>
                <li>物流商<i id="value_corp_count">3597</i>家</li>
                <li>新增<i id="value_corp_add">10</i>家</li>
            </ul>
            <ul class="u">
                <li><a href="http://view.1688.com/cms/itbu/560307.html?tracelog=56_main_jiazhi_zk0606" target="_blank"><i class="i-16"></i></a><div class="cont"><h3><a href="http://view.1688.com/cms/itbu/560307.html" target="_blank">平台折扣专享</a></h3><p>网上下单6折起 无需在线支付</p></div></li>
                <li><a href="http://view.1688.com/cms/itbu/560307.html?tracelog=56_main_jiazhi_aq0606" target="_blank"><i class="i-17"></i></a><div class="cont"><h3><a href="http://view.1688.com/cms/itbu/560307.html" target="_blank">发货安全保障</a></h3><p>价格真实 无忧理赔</p></div></li>
                <li><a href="http://view.1688.com/cms/itbu/560307.html?tracelog=56_main_jiazhi_cx0606" target="_blank"><i class="i-18"></i></a><div class="cont"><h3><a href="http://view.1688.com/cms/itbu/560307.html" target="_blank">累积诚信档案</a></h3><p>积累诚信档案 提高贷款成功率</p></div></li>
            </ul>
        </div>
        <div id="announce" class="announce">
            <ul>   
                <li style="display: list-item;" class="f-tab-b"><a target="_blank" href="http://club.1688.com/threadview/36316832.html?tracelog=56_main_gonggao_0723"> [公告] 邀请专线物流商入驻！</a></li>   
                        
            </ul>
        </div>
    </div>
  
    <style type="text/css">
      #wenjuan {display:block;position:absolute;top:0;right:-29px;width:21px;border:1px #c6c6c6 solid;background-color:white;color:#666;padding:1px;text-align:center;line-height:16px;}
      #wenjuan .wenjuan_box {width:100%;background-color:#f3f3f3;padding:6px 0;}
      #wenjuan .wenjuan_icon {width:21px;height:16px;display:block;background:url(http://i01.c.aliimg.com/cms/upload/2013/728/936/1639827_1458814456.png) no-repeat left top;margin-bottom:6px;}
      #wenjuan:hover {border-color:#5aa7e1;background-color:#5aa7e1;color:white;}
      #wenjuan:hover .wenjuan_box{background-color:#5aa7e1;}
      #wenjuan:hover .wenjuan_icon{background-position:left -16px;}
    </style>
    <a id="wenjuan" href="http://ur.taobao.com/survey/view.htm?spm=a2608.2176793.5732505.74&amp;id=1894&amp;tracelog=56_laiyuan_yemian_sy_main_20130726dy">
      <div class="wenjuan_box">
        <div class="wenjuan_icon"></div>
        意见收集
      </div>
    </a>
 </div>
<div class="layout">
    <div class="grid-25">
        <div class="corp fd-clr">
            <div class="t"><h2>品牌物流</h2></div>
            <div id="pre" class="pre">&lt;</div>
            <div id="brand" class="brand">
                <ul style="width: 5160px;">
                   <li class="f-tab-b"><a class="brand-1" alt="德邦物流" href="http://56.1688.com/corp-deppon/?tracelog=56_laiyuan_yemian_sy_pp_20130307dp"><img src="index_files/230511_1489547229.jpg" target="_blank" height="28" width="100"></a><span class="tt">德邦物流<span class="off i-19">8.9</span></span></li>
									<li class="f-tab-b"><a class="brand-2" alt="新邦物流" href="http://56.1688.com/corp-xbwl/?tracelog=56_laiyuan_yemian_sy_pp_20130307xp"><img src="index_files/200236_1877011556.jpg" target="_blank" height="28" width="100"></a><span class="tt">新邦物流<span class="off i-19">8.9</span></span></li>
									<li class="f-tab-b"><a class="brand-3" alt="佳吉快运" href="http://56.1688.com/corp-jiaji/?tracelog=56_laiyuan_yemian_sy_pp_20130307jj"><img src="index_files/150775_1229585781.png" target="_blank" height="28" width="100"></a><span class="tt">佳吉快运<span class="off i-19">8.9</span></span></li>
									<li class="f-tab-b"><a class="brand-5" alt="天地华宇" href="http://56.1688.com/corp-hoau/?tracelog=56_laiyuan_yemian_sy_pp_20130307hy"><img src="index_files/200235_1877011556.jpg" target="_blank" height="28" width="100"></a><span class="tt">天地华宇<span class="off i-19">8.9</span></span></li>
		            				<li class="f-tab-b"><a class="brand-5" alt="大田陆运" href="http://56.1688.com/corp-dtw/?tracelog=56_laiyuan_yemian_sy_pp_20130307dt"><img src="index_files/320015_1877011556.jpg" target="_blank" height="28" width="100"></a><span class="tt">大田陆运<span class="off i-19">8</span></span></li>
									<li class="f-tab-b"><a class="brand-6" alt="中铁物流" href="http://56.1688.com/corp-ZTKY/?tracelog=56_laiyuan_yemian_sy_pp_20130307zt"><img src="index_files/zhongtie_logo.png" target="_blank" height="28" width="100"></a><span class="tt">中铁物流</span></li>
									<li class="f-tab-b"><a class="brand-7" alt="佳怡物流" href="http://56.1688.com/corp-jiayi/?tracelog=56_laiyuan_yemian_sy_pp_20130307jy"><img src="index_files/164986_1877011556.png" target="_blank" height="28" width="100"></a><span class="tt">佳怡物流<span class="off i-19">9</span></span></li>		            				
		            				<li class="f-tab-b"><a class="brand-1" alt="盛辉物流" href="http://56.1688.com/corp-shenghui/?tracelog=56_laiyuan_yemian_sy_pp_20130307sh"><img src="index_files/shenghui_logo.png" target="_blank" height="28" width="100"></a><span class="tt">盛辉物流<span class="off i-19">9.5</span></span></li>
									<li class="f-tab-b"><a class="brand-2" alt="城市之星" href="http://56.1688.com/corp-cszx/?tracelog=56_laiyuan_yemian_sy_pp_20130307cszx"><img src="index_files/239299_1489547229.jpg" target="_blank" height="28" width="100"></a><span class="tt">城市之星<span class="off i-19">9.5</span></span></li>
									<li class="f-tab-b"><a class="brand-3" alt="远成物流" href="http://56.1688.com/corp-ycgwl/?tracelog=56_laiyuan_yemian_sy_pp_20130307yc"><img src="index_files/yuancheng_logo.png" target="_blank" height="28" width="100"></a><span class="tt">远成物流</span></li>
		            				                 <li class="f-tab-b"><a class="brand-5" alt="共速达物流" href="http://56.1688.com/corp-gsd/?tracelog=56_laiyuan_yemian_sy_pp_20130307gsd"><img src="index_files/gongsuda_logo.png" target="_blank" height="28" width="100"></a><span class="tt">共速达物流<span class="off i-19">9</span></span></li>
									<li class="f-tab-b"><a class="brand-6" alt="苏粤货运" href="http://56.1688.com/corp-suyue/?tracelog=56_laiyuan_yemian_sy_pp_20130307sy"><img src="index_files/150776_1229585781.png" target="_blank" height="28" width="100"></a><span class="tt">苏粤货运</span></li>
	                                                               <li class="f-tab-b"><a class="brand-6" alt="义乌金驰" href="http://56.1688.com/corp-cococan/?tracelog=56_laiyuan_yemian_sy_pp_20130307ywjc"><img src="index_files/311776_1877011556.jpg" target="_blank" height="28" width="100"></a><span class="tt">义乌金驰</span></li>
	                                                              <li class="f-tab-b"><a class="brand-6" alt="百世物流" href="http://56.1688.com/corp-bestqjt/?tracelog=56_laiyuan_yemian_sy_pp_20130307bsqjt"><img src="index_files/885702_1877011556.jpg" target="_blank" height="28" width="100"></a><span class="tt">百世物流</span></li>
	                                                              <li class="f-tab-b"><a class="brand-6" alt="华创货运" href="http://56.1688.com/corp-cyshipping/?tracelog=56_laiyuan_yemian_sy_pp_20130307hc"><img src="index_files/330014_1877011556.jpg" target="_blank" height="28" width="100"></a><span class="tt">华创货运</span></li>
	                                                             <li class="f-tab-b"><a class="brand-6" alt="圣安物流" href="http://56.1688.com/corp-szsa56/?tracelog=56_laiyuan_yemian_sy_pp_20130307sa"><img src="index_files/1358005_1877011556.jpg" target="_blank" height="28" width="100"></a><span class="tt">圣安物流</span></li>
	                                                             <li class="f-tab-b"><a class="brand-6" alt="明亮物流" href="http://56.1688.com/corp-szml56/?tracelog=56_laiyuan_yemian_sy_pp_20130307ml"><img src="index_files/1617317_1877011556.jpg" target="_blank" height="28" width="100"></a><span class="tt">明亮物流</span></li>
	                                                            <li class="f-tab-b"><a class="brand-6" alt="路易通" href="http://56.1688.com/corp/index.htm?corp=LUYITONG5188&amp;tracelog=56_laiyuan_yemian_sy_pp_20130307lyt"><img src="index_files/498682_1877011556.png" target="_blank" height="28" width="100"></a><span class="tt">路易通</span></li>		
				                                   <li class="f-tab-b"><a class="brand-6" alt="宁波中通" href="http://56.1688.com/corp-zt56123/?tracelog=56_laiyuan_yemian_sy_pp_20130307nbzt"><img src="index_files/616303_1877011556.jpg" target="_blank" height="28" width="100"></a><span class="tt">宁波中通</span></li>	 
                                                              <li class="f-tab-b"><a class="brand-6" alt="南京福佑" href="http://56.1688.com/corp-nanjingfuyou/?tracelog=56_laiyuan_yemian_sy_pp_20130307fy"><img src="index_files/826808_1877011556.jpg" target="_blank" height="28" width="100"></a><span class="tt">南京福佑</span></li>
                                                             <li class="f-tab-b"><a class="brand-6" alt="安能物流" href="http://56.1688.com/corp-b2b-1114953820/?tracelog=56_laiyuan_yemian_sy_pp_20130307an"><img src="index_files/859302_1877011556.jpg" target="_blank" height="28" width="100"></a><span class="tt">安能物流</span></li>
                                                              <li class="f-tab-b"><a class="brand-6" alt="永和迅物流" href="http://56.1688.com/corp-b2b-1112902991/?tracelog=56_laiyuan_yemian_sy_pp_20130313yhx"><img src="index_files/880705_1877011556.jpg" target="_blank" height="28" width="100"></a><span class="tt">永和迅物流</span></li>
                                      <li class="f-tab-b"><a class="brand-6" alt="申胜物流" href="http://56.1688.com/corp-b2b-1613399184/?tracelog=56_laiyuan_yemian_sy_pp_20130402ss"><img src="index_files/992042_1877011556.jpg" target="_blank" height="28" width="100"></a><span class="tt">申胜物流</span></li>
                                            <li class="f-tab-b"><a class="brand-6" alt="中程快运" href="http://56.1688.com/corp-b2b-1637600242/?tracelog=56_laiyuan_yemian_sy_pp_20130403zc"><img src="index_files/1004903_1877011556.png" target="_blank" height="28" width="100"></a><span class="tt">中程快运</span></li>
                                            <li class="f-tab-b"><a class="brand-6" alt="能安物流" href="http://56.1688.com/corp-b2b-1620907412/?tracelog=56_laiyuan_yemian_sy_pp_20130415na"><img src="index_files/1067942_1877011556.jpg" target="_blank" height="28" width="100"></a><span class="tt">能安物流</span></li>
                                           <li class="f-tab-b"><a class="brand-6" alt="卡行天下" href="http://56.1688.com/corp/index.htm?corp=B2B-1669519933&amp;tracelog=56_laiyuan_yemian_sy_pp_20130527kx"><img src="index_files/1477901_806774440.jpg" target="_blank" height="28" width="100"></a><span class="tt">卡行天下</span></li>
                                            <li class="f-tab-b"><a class="brand-6" alt="凤凰通达" href="http://56.1688.com/corp-B2B-1577709400/?tracelog=56_laiyuan_yemian_sy_pp_20130529td"><img src="index_files/1358004_1877011556.jpg" target="_blank" height="28" width="100"></a><span class="tt">凤凰通达</span></li>
                                      <li class="f-tab-b"><a class="brand-6" alt="好友汇" href="http://56.1688.com/corp-b2b-1640075649/?tracelog=56_laiyuan_yemian_sy_pp_20130701hyh"><img src="index_files/1570108_1877011556.jpg" target="_blank" height="28" width="100"></a><span class="tt">好友汇</span></li>
                                        <li class="f-tab-b"><a class="brand-6" alt="鹏程货运" href="http://56.1688.com/corp-raoyanping/?tracelog=56_laiyuan_yemian_sy_pp_20130701pc"><img src="index_files/1570107_1877011556.png" target="_blank" height="28" width="100"></a><span class="tt">鹏程货运</span></li>
                  <li class="f-tab-b"><a class="brand-6" alt="兴铁物流" href="http://56.1688.com/corp-bjxtwuliu/?tracelog=56_laiyuan_yemian_sy_pp_201307023xt"><img src="index_files/1588232_1877011556.jpg" target="_blank" height="28" width="100"></a><span class="tt">兴铁物流</span></li>
                   <li class="f-tab-b"><a class="brand-6" alt="东红物流" href="http://56.1688.com/corp-ZRNSYX520891/?tracelog=56_laiyuan_yemian_sy_pp_201307024dh"><img src="index_files/1589828_1877011556.png" target="_blank" height="28" width="100"></a><span class="tt">东红物流</span></li>
                  <li class="f-tab-b"><a class="brand-6" alt="中一行物流" href="http://56.1688.com/corp-B2B-1736964235/?tracelog=56_laiyuan_yemian_sy_pp_20130806zyx"><img src="index_files/1603237_1877011556.jpg" target="_blank" height="28" width="100"></a><span class="tt">中一行物流</span></li>
                  <li class="f-tab-b"><a class="brand-6" alt="穗佳物流" href="http://56.1688.com/corp-b2b-1733556968/index.htm?tracelog=56_laiyuan_yemian_sy_pp_20130812sj"><img src="index_files/1611645_1877011556.jpg" target="_blank" height="28" width="100"></a><span class="tt">穗佳物流</span></li>
                  <li class="f-tab-b"><a class="brand-6" alt="蓝海宏业" href="http://56.1688.com/corp/index.htm?corp=B2B-1776951792&amp;tracelog=56_laiyuan_yemian_sy_pp_20130816lh"><img src="index_files/1617316_1877011556.jpg" target="_blank" height="28" width="100"></a><span class="tt">蓝海宏业</span></li>
                   <li class="f-tab-b"><a class="brand-6" alt="山华宏物流" href="http://56.1688.com/corp/index.htm?corp=GAB1335&amp;tracelog=56_laiyuan_yemian_sy_pp_20130828hh"><img src="index_files/1647215_1747611842.png" target="_blank" height="28" width="100"></a><span class="tt">昆山华宏物流</span></li>
                  <li class="f-tab-b"><a class="brand-6" alt="大隆物流" href="http://56.1688.com/corp/index.htm?corp=B2B-1771892786239&amp;tracelog=56_laiyuan_yemian_sy_pp_20130906dl"><img src="index_files/1674358_1747611842.png" target="_blank" height="28" width="100"></a><span class="tt">大隆物流</span></li>
                  <li class="f-tab-b"><a class="brand-6" alt="泰利物流" href="http://56.1688.com/corp-tlznps56/?tracelog=56_laiyuan_yemian_sy_pp_20130912tl"><img src="index_files/1687911_1747611842.jpg" target="_blank" height="28" width="100"></a><span class="tt">泰利物流</span></li>
                  <li class="f-tab-b"><a class="brand-6" alt="中良物流" href="http://56.1688.com/corp-dongwanxusong/?tracelog=56_laiyuan_yemian_sy_pp_20130913zl"><img src="index_files/1691515_1747611842.jpg" target="_blank" height="28" width="100"></a><span class="tt">中良物流</span></li>
                  <li class="f-tab-b"><a class="brand-6" alt="网阔专线宝" href="http://56.1688.com/corp/index.htm?corp=B2B-1769362542139&amp;tracelog=56_laiyuan_yemian_sy_pp_20130913wkzxb"><img src="index_files/1691517_1747611842.jpg" target="_blank" height="28" width="100"></a><span class="tt">网阔专线宝</span></li>
                  <li class="f-tab-b"><a class="brand-6" alt="聚创物流" href="http://56.1688.com/corp/index.htm?corp=B2B-1793559274478&amp;tracelog=56_laiyuan_yemian_sy_pp_20130913zl"><img src="index_files/1691170_1747611842.jpg" target="_blank" height="28" width="100"></a><span class="tt">聚创物流</span></li>
                  
                                                                 <li class="f-tab-b"><a class="brand-6" alt="天天快递"><img src="index_files/478997_1877011556.jpg" target="_blank" height="28" width="100"></a><span class="tt">天天快递</span></li>	
                                                                  <li class="f-tab-b"><a class="brand-6" alt="中通速递"><img src="index_files/150780_1229585781.png" target="_blank" height="28" width="100"></a><span class="tt">中通速递</span></li>
                                                             <li class="f-tab-b"><a class="brand-6" alt="韵达快运"><img src="index_files/416718_1877011556.jpg" target="_blank" height="28" width="100"></a><span class="tt">韵达快运</span></li>

                </ul>
            </div>
            <div id="next" class="next">&gt;</div>
        </div>
    </div>
</div>
<div class="layout">
    <div class="grid-19">
        <h2 class="tit">为您推荐的线路</h2>
        <ul class="route" id="hotRoutes"><li><a href="http://56.1688.com/corp/view_route_detail.htm?corp=DEPPON&amp;routeTag=420000-360000-420100-360500-420106--1141-4-D2S&amp;fromCity=420100&amp;toCity=360500&amp;tracelog=itu_tran_index_56_tjroad" target="_blank">武汉市<i class="i-15"></i>新余市<span><i class="s">1.35</i><span class="c444" style="margin:0px;">元/公斤</span></span><span class="c444">284元/立方</span><span class="c999">德邦物流</span></a></li><li><a href="http://56.1688.com/corp/view_route_detail.htm?corp=DEPPON&amp;routeTag=420000-340000-420100-340200---1141-4-D2S&amp;fromCity=420100&amp;toCity=340200&amp;tracelog=itu_tran_index_56_tjroad" target="_blank">武汉市<i class="i-15"></i>芜湖市<span><i class="s">1.95</i><span class="c444" style="margin:0px;">元/公斤</span></span><span class="c444">410元/立方</span><span class="c999">德邦物流</span></a></li><li><a href="http://56.1688.com/corp/view_route_detail.htm?corp=JIAJI&amp;routeTag=420000-440000-420100-440100---100005-14-D2S&amp;fromCity=420100&amp;toCity=440100&amp;tracelog=itu_tran_index_56_tjroad" target="_blank">武汉市<i class="i-15"></i>广州市<span><i class="s">0.9</i><span class="c444" style="margin:0px;">元/公斤</span></span><span class="c444">225元/立方</span><span class="c999">佳吉快运</span></a></li><li><a href="http://56.1688.com/corp/view_route_detail.htm?corp=ZRNSYX520891&amp;routeTag=440000-330000-441900-331100-999441900--109190-67802-S2S&amp;fromCity=441900&amp;toCity=331100&amp;tracelog=itu_tran_index_56_tjroad" target="_blank">东莞市<i class="i-15"></i>丽水市<span><i class="s">0.76</i><span class="c444" style="margin:0px;">元/公斤</span></span><span class="c444">208元/立方</span><span class="c999">东红物流</span></a></li><li><a href="http://56.1688.com/corp/view_route_detail.htm?corp=ZRNSYX520891&amp;routeTag=440000-340000-441900-340200-999441900-340221-109190-67802-S2S&amp;fromCity=441900&amp;toCity=340200&amp;tracelog=itu_tran_index_56_tjroad" target="_blank">东莞市<i class="i-15"></i>芜湖市<span><i class="s">1.04</i><span class="c444" style="margin:0px;">元/公斤</span></span><span class="c444">256元/立方</span><span class="c999">东红物流</span></a></li><li><a href="http://56.1688.com/corp/view_route_detail.htm?corp=DONGWANXUSONG&amp;routeTag=440000-370000-441900-371300-999441900-371323-115142-121815-S2S&amp;fromCity=441900&amp;toCity=371300&amp;tracelog=itu_tran_index_56_tjroad" target="_blank">东莞市<i class="i-15"></i>临沂市<span><i class="s">0.65</i><span class="c444" style="margin:0px;">元/公斤</span></span><span class="c444">170元/立方</span><span class="c999">中良物流</span></a></li><li><a href="http://56.1688.com/corp/view_route_detail.htm?corp=DONGWANXUSONG&amp;routeTag=440000-420000-441900-420100-999441900-420116-115142-121815-S2S&amp;fromCity=441900&amp;toCity=420100&amp;tracelog=itu_tran_index_56_tjroad" target="_blank">东莞市<i class="i-15"></i>武汉市<span><i class="s">0.55</i><span class="c444" style="margin:0px;">元/公斤</span></span><span class="c444">140元/立方</span><span class="c999">中良物流</span></a></li><li><a href="http://56.1688.com/corp/view_route_detail.htm?corp=JIAJI&amp;routeTag=440000-420000-440300-420700---100005-14-S2S&amp;fromCity=440300&amp;toCity=420700&amp;tracelog=itu_tran_index_56_tjroad" target="_blank">深圳市<i class="i-15"></i>鄂州市<span><i class="s">1.05</i><span class="c444" style="margin:0px;">元/公斤</span></span><span class="c444">263元/立方</span><span class="c999">佳吉快运</span></a></li><li><a href="http://56.1688.com/corp/view_route_detail.htm?corp=SZSA56&amp;routeTag=440000-330000-440300-330700-440305-330782-106235-168651-S2S&amp;fromCity=440300&amp;toCity=330700&amp;tracelog=itu_tran_index_56_tjroad" target="_blank">深圳市<i class="i-15"></i>金华市<span><i class="s">0.8</i><span class="c444" style="margin:0px;">元/公斤</span></span><span class="c444">150元/立方</span><span class="c999">圣安物流</span></a></li></ul>
    </div>
    <div class="grid-6 grid-fixed">
        <h2 class="tit">区域优秀物流商展示</h2>
        <ul>
            <li><a href="http://56.1688.com/corp-SHHX/?tracelog=56_laiyuan_yemian_sy_tj_20130307hx" target="_blank" style="color:#444">上海昊昕物流有限公司</a></li>
            <li><a href="http://56.1688.com/corp/index.htm?corp=SUYANSUYUN&amp;tracelog=56_laiyuan_yemian_sy_tj_20130307sy" target="_blank" style="color:#444">上海速雁物流有限公司</a></li>
            <li><a href="http://56.1688.com/corp/index.htm?corp=XHGWL2011&amp;tracelog=56_laiyuan_yemian_sy_tj_20130307hg" target="_blank" style="color:#444">广州市新恒广物流有限公司</a></li>
            <li><a href="http://56.1688.com/corp-SZFUZHILU56/?tracelog=56_laiyuan_yemian_sy_tj_20130307xj" target="_blank" style="color:#444">江西祥吉物流有限公司</a></li>
            <li><a href="http://56.1688.com/corp/index.htm?corp=JUNYIWULIU&amp;tracelog=56_laiyuan_yemian_sy_tj_20130307jy" target="_blank" style="color:#444">上海君易物流有限公司</a></li>

        </ul>
    </div>
</div>
<div class="layout">
    <div class="grid-25 spec">
        <h2 class="tit">活动展示<span class="tip"></span></h2>
        <ul>
            <li class="f f-tab-b"><a alt="新邦物流！" href="http://club.1688.com/threadview/36543203.html?forumId=33&amp;tracelog=56_laiyuan_yemian_xb201308" target="_blank"><img src="index_files/1644410_1747611842.jpg"></a></li>
            <li class="f-tab-b"><a alt="德邦物流" href="http://club.1688.com/threadview/36540463.html?spm=a261a.6650833.0.0&amp;forumId=33&amp;tracelog=56_laiyuan_yemian_db201309" target="_blank"><img src="index_files/1674009_1747611842.jpg" alt="德邦物流"></a></li>
            <li class="f-tab-b"><a alt="天地华宇" href="http://club.1688.com/threadview/36544866.html?forumId=33&amp;tracelog=56_laiyuan_yemian_hy201308" target="_blank"><img src="index_files/1654045_1747611842.jpg" alt="天地华宇"></a></li>

            <li class="f-tab-b"><a data-spm-anchor-id="a2608.2176793.5732505.197" alt="卡行天下" href="http://club.1688.com/threadview/36615397.html?forumId=33?spm=a2608.2176793.5732505.197&amp;tracelog=56_laiyuan_yemian_kxtx_0913" target="_blank"><img src="index_files/1692228_1747611842.jpg" alt="卡行天下流"></a></li>
        </ul>
    </div>
</div>
<div class="layout">
    <div class="grid-19">
        <h2 class="tit">热门线路</h2>
        <div id="hot" class="hot">
            <ul class="t">

                <li class="f-tab-t">广州</li>
                <li class="f-tab-t">东莞</li>
                <li class="f-tab-t current">深圳</li>
            </ul>
            <div style="display: none;" class="f-tab-b">
                <ul class="route">
                    <li><a href="http://56.1688.com/order/price/estimate_price.htm?_fm.es._0.s=440000&amp;_fm.es._0.se=440100&amp;_fm.es._0.sen=&amp;_fm.es._0.r=310000&amp;_fm.es._0.re=310100&amp;_fm.es._0.rec=&amp;notFirst=true&amp;_fm.es._0.o=&amp;_fm.es._0.c=&amp;_fm.es._0.co=&amp;_fm.es._0.sp=&amp;_fm.es._0.i=&amp;_fm.es._0.is=&amp;_fm.es._0.isf=&amp;_fm.es._0.isp=&amp;_fm.es._0.isc=&amp;_fm.es._0.isa=&amp;_fm.es._0.w=&amp;_fm.es._0.we=&amp;_fm.es._0.v=&amp;_fm.es._0.vo=&amp;_fm.es._0.t=&amp;_fm.es._0.tr=&amp;r=1361437367368&amp;sizePerPage=&amp;pageIndex=1&amp;weight=&amp;expressRouteSortType=&amp;_fm.es._0.sentc=&amp;tracelog=56_laiyuan_yemian_sy_rm_20130307gz1" target="_blank">广州市<i class="i-15"></i>上海市<span><i class="s">0.54</i><span class="mg0 c444" style="margin:0px;">元/公斤</span></span><span class="c444">144元/立方</span><span class="c999"></span></a></li>
                    <li><a href="http://56.1688.com/order/price/estimate_price.htm?_fm.es._0.s=440000&amp;_fm.es._0.se=440100&amp;_fm.es._0.sen=&amp;_fm.es._0.r=110000&amp;_fm.es._0.re=110100&amp;_fm.es._0.rec=&amp;notFirst=true&amp;_fm.es._0.o=&amp;_fm.es._0.c=&amp;_fm.es._0.co=&amp;_fm.es._0.sp=&amp;_fm.es._0.i=&amp;_fm.es._0.is=&amp;_fm.es._0.isf=&amp;_fm.es._0.isp=&amp;_fm.es._0.isc=&amp;_fm.es._0.isa=&amp;_fm.es._0.w=&amp;_fm.es._0.we=&amp;_fm.es._0.v=&amp;_fm.es._0.vo=&amp;_fm.es._0.t=&amp;_fm.es._0.tr=&amp;r=1361437412191&amp;sizePerPage=&amp;pageIndex=1&amp;weight=&amp;expressRouteSortType=&amp;_fm.es._0.sentc=&amp;tracelog=56_laiyuan_yemian_sy_rm_20130307gz2" target="_blank">广州市<i class="i-15"></i>北京市<span><i class="s">0.78</i><span class="mg0 c444" style="margin:0px;">元/公斤</span></span><span class="c444">196元/立方</span><span class="c999"></span></a></li>
                    <li><a href="http://56.1688.com/order/price/estimate_price.htm?_fm.es._0.s=440000&amp;_fm.es._0.se=440100&amp;_fm.es._0.sen=&amp;_fm.es._0.r=440000&amp;_fm.es._0.re=440300&amp;_fm.es._0.rec=&amp;notFirst=true&amp;_fm.es._0.o=&amp;_fm.es._0.c=&amp;_fm.es._0.co=&amp;_fm.es._0.sp=&amp;_fm.es._0.i=&amp;_fm.es._0.is=&amp;_fm.es._0.isf=&amp;_fm.es._0.isp=&amp;_fm.es._0.isc=&amp;_fm.es._0.isa=&amp;_fm.es._0.w=&amp;_fm.es._0.we=&amp;_fm.es._0.v=&amp;_fm.es._0.vo=&amp;_fm.es._0.t=&amp;_fm.es._0.tr=&amp;r=1361437458936&amp;sizePerPage=&amp;pageIndex=1&amp;weight=&amp;expressRouteSortType=&amp;_fm.es._0.sentc=&amp;tracelog=56_laiyuan_yemian_sy_rm_20130307gz3" target="_blank">广州市<i class="i-15"></i>深圳市<span><i class="s">0.20</i><span class="mg0 c444" style="margin:0px;">元/公斤</span></span><span class="c444">50元/立方</span><span class="c999"></span></a></li>
                    <li><a href="http://56.1688.com/order/price/estimate_price.htm?_fm.es._0.s=440000&amp;_fm.es._0.se=440100&amp;_fm.es._0.sen=&amp;_fm.es._0.r=440000&amp;_fm.es._0.re=440100&amp;_fm.es._0.rec=&amp;notFirst=true&amp;_fm.es._0.o=&amp;_fm.es._0.c=&amp;_fm.es._0.co=&amp;_fm.es._0.sp=&amp;_fm.es._0.i=&amp;_fm.es._0.is=&amp;_fm.es._0.isf=&amp;_fm.es._0.isp=&amp;_fm.es._0.isc=&amp;_fm.es._0.isa=&amp;_fm.es._0.w=&amp;_fm.es._0.we=&amp;_fm.es._0.v=&amp;_fm.es._0.vo=&amp;_fm.es._0.t=&amp;_fm.es._0.tr=&amp;r=1361437512147&amp;sizePerPage=&amp;pageIndex=1&amp;weight=&amp;expressRouteSortType=&amp;_fm.es._0.sentc=&amp;tracelog=56_laiyuan_yemian_sy_rm_20130307gz4" target="_blank">广州市<i class="i-15"></i>广州市<span><i class="s">0.27</i><span class="mg0 c444" style="margin:0px;">元/公斤</span></span><span class="c444">45元/立方</span><span class="c999"></span></a></li>
                    <li><a href="http://56.1688.com/order/price/estimate_price.htm?_fm.es._0.s=440000&amp;_fm.es._0.se=440100&amp;_fm.es._0.sen=&amp;_fm.es._0.r=330000&amp;_fm.es._0.re=330100&amp;_fm.es._0.rec=&amp;notFirst=true&amp;_fm.es._0.o=&amp;_fm.es._0.c=&amp;_fm.es._0.co=&amp;_fm.es._0.sp=&amp;_fm.es._0.i=&amp;_fm.es._0.is=&amp;_fm.es._0.isf=&amp;_fm.es._0.isp=&amp;_fm.es._0.isc=&amp;_fm.es._0.isa=&amp;_fm.es._0.w=&amp;_fm.es._0.we=&amp;_fm.es._0.v=&amp;_fm.es._0.vo=&amp;_fm.es._0.t=&amp;_fm.es._0.tr=&amp;r=1361437549458&amp;sizePerPage=&amp;pageIndex=1&amp;weight=&amp;expressRouteSortType=&amp;_fm.es._0.sentc=&amp;tracelog=56_laiyuan_yemian_sy_rm_20130307gz5" target="_blank">广州市<i class="i-15"></i>杭州市<span><i class="s">0.54</i><span class="mg0 c444" style="margin:0px;">元/公斤</span></span><span class="c444">144元/立方</span><span class="c999"></span></a></li>
                    <li><a href="http://56.1688.com/order/price/estimate_price.htm?_fm.es._0.s=440000&amp;_fm.es._0.se=440100&amp;_fm.es._0.sen=&amp;_fm.es._0.r=320000&amp;_fm.es._0.re=320500&amp;_fm.es._0.rec=&amp;notFirst=true&amp;_fm.es._0.o=&amp;_fm.es._0.c=&amp;_fm.es._0.co=&amp;_fm.es._0.sp=&amp;_fm.es._0.i=&amp;_fm.es._0.is=&amp;_fm.es._0.isf=&amp;_fm.es._0.isp=&amp;_fm.es._0.isc=&amp;_fm.es._0.isa=&amp;_fm.es._0.w=&amp;_fm.es._0.we=&amp;_fm.es._0.v=&amp;_fm.es._0.vo=&amp;_fm.es._0.t=&amp;_fm.es._0.tr=&amp;r=1361437582459&amp;sizePerPage=&amp;pageIndex=1&amp;weight=&amp;expressRouteSortType=&amp;_fm.es._0.sentc=&amp;tracelog=56_laiyuan_yemian_sy_rm_20130307gz6" target="_blank">广州市<i class="i-15"></i>苏州市<span><i class="s">0.69</i><span class="mg0 c444" style="margin:0px;">元/公斤</span></span><span class="c444">176元/立方</span><span class="c999"></span></a></li>
                </ul>
            </div>
            <div style="display: none;" class="f-tab-b">
                <ul class="route">
                    <li><a href="http://56.1688.com/order/price/estimate_price.htm?sp=440000&amp;sc=441900&amp;sy=&amp;rp=310000&amp;rc=310100&amp;ry=&amp;notFirst=true#tabtracelog=56_laiyuan_yemian_sy_rm_20130307dg1" target="_blank">东莞市<i class="i-15"></i>上海市<span><i class="s">0.80</i><span class="mg0 c444" style="margin:0px;">元/公斤</span></span><span class="c444">200元/立方</span><span></span></a></li>
                    <li><a href="http://56.1688.com/order/price/estimate_price.htm?_fm.es._0.s=440000&amp;_fm.es._0.se=441900&amp;_fm.es._0.sen=&amp;_fm.es._0.r=110000&amp;_fm.es._0.re=110100&amp;_fm.es._0.rec=&amp;notFirst=true&amp;_fm.es._0.o=&amp;_fm.es._0.c=&amp;_fm.es._0.co=&amp;_fm.es._0.sp=&amp;_fm.es._0.i=&amp;_fm.es._0.is=&amp;_fm.es._0.isf=&amp;_fm.es._0.isp=&amp;_fm.es._0.isc=&amp;_fm.es._0.isa=&amp;_fm.es._0.w=&amp;_fm.es._0.we=&amp;_fm.es._0.v=&amp;_fm.es._0.vo=&amp;_fm.es._0.t=&amp;_fm.es._0.tr=&amp;r=1361436835809&amp;sizePerPage=&amp;pageIndex=1&amp;weight=&amp;expressRouteSortType=&amp;_fm.es._0.sentc=&amp;tracelog=56_laiyuan_yemian_sy_rm_20130307dg2" target="_blank">东莞市<i class="i-15"></i>北京市<span><i class="s">1.19</i><span class="mg0 c444" style="margin:0px;">元/公斤</span></span><span class="c444">298元/立方</span><span class="c999"></span></a></li>
                    <li><a href="http://56.1688.com/order/price/estimate_price.htm?_fm.es._0.s=440000&amp;_fm.es._0.se=441900&amp;_fm.es._0.sen=&amp;_fm.es._0.r=320000&amp;_fm.es._0.re=320500&amp;_fm.es._0.rec=&amp;notFirst=true&amp;_fm.es._0.o=&amp;_fm.es._0.c=&amp;_fm.es._0.co=&amp;_fm.es._0.sp=&amp;_fm.es._0.i=&amp;_fm.es._0.is=&amp;_fm.es._0.isf=&amp;_fm.es._0.isp=&amp;_fm.es._0.isc=&amp;_fm.es._0.isa=&amp;_fm.es._0.w=&amp;_fm.es._0.we=&amp;_fm.es._0.v=&amp;_fm.es._0.vo=&amp;_fm.es._0.t=&amp;_fm.es._0.tr=&amp;r=1361436923973&amp;sizePerPage=&amp;pageIndex=1&amp;weight=&amp;expressRouteSortType=&amp;_fm.es._0.sentc=&amp;tracelog=56_laiyuan_yemian_sy_rm_20130307dg3" target="_blank">东莞市<i class="i-15"></i>苏州市<span><i class="s">0.93</i><span class="mg0 c444" style="margin:0px;">元/公斤</span></span><span class="c444">216元/立方</span><span class="c999"></span></a></li>
                    <li><a href="http://56.1688.com/order/price/estimate_price.htm?_fm.es._0.s=440000&amp;_fm.es._0.se=441900&amp;_fm.es._0.sen=&amp;_fm.es._0.r=330000&amp;_fm.es._0.re=330200&amp;_fm.es._0.rec=&amp;notFirst=true&amp;_fm.es._0.o=&amp;_fm.es._0.c=&amp;_fm.es._0.co=&amp;_fm.es._0.sp=&amp;_fm.es._0.i=&amp;_fm.es._0.is=&amp;_fm.es._0.isf=&amp;_fm.es._0.isp=&amp;_fm.es._0.isc=&amp;_fm.es._0.isa=&amp;_fm.es._0.w=&amp;_fm.es._0.we=&amp;_fm.es._0.v=&amp;_fm.es._0.vo=&amp;_fm.es._0.t=&amp;_fm.es._0.tr=&amp;r=1361436985508&amp;sizePerPage=&amp;pageIndex=1&amp;weight=&amp;expressRouteSortType=&amp;_fm.es._0.sentc=&amp;tracelog=56_laiyuan_yemian_sy_rm_20130307dg4" target="_blank">东莞市<i class="i-15"></i>宁波市<span><i class="s">0.93</i><span class="mg0 c444" style="margin:0px;">元/公斤</span></span><span class="c444">205元/立方</span><span class="c999"></span></a></li>
                    <li><a href="http://56.1688.com/order/price/estimate_price.htm?_fm.es._0.s=440000&amp;_fm.es._0.se=441900&amp;_fm.es._0.sen=&amp;_fm.es._0.r=370000&amp;_fm.es._0.re=370200&amp;_fm.es._0.rec=&amp;notFirst=true&amp;_fm.es._0.o=&amp;_fm.es._0.c=&amp;_fm.es._0.co=&amp;_fm.es._0.sp=&amp;_fm.es._0.i=&amp;_fm.es._0.is=&amp;_fm.es._0.isf=&amp;_fm.es._0.isp=&amp;_fm.es._0.isc=&amp;_fm.es._0.isa=&amp;_fm.es._0.w=&amp;_fm.es._0.we=&amp;_fm.es._0.v=&amp;_fm.es._0.vo=&amp;_fm.es._0.t=&amp;_fm.es._0.tr=&amp;r=1361437041842&amp;sizePerPage=&amp;pageIndex=1&amp;weight=&amp;expressRouteSortType=&amp;_fm.es._0.sentc=&amp;tracelog=56_laiyuan_yemian_sy_rm_20130307dg5" target="_blank">东莞市<i class="i-15"></i>青岛市<span><i class="s">1.03</i><span class="mg0 c444" style="margin:0px;">元/公斤</span></span><span class="c444">245元/立方</span><span class="c999"></span></a></li>
                    <li><a href="http://56.1688.com/order/price/estimate_price.htm?_fm.es._0.s=440000&amp;_fm.es._0.se=441900&amp;_fm.es._0.sen=&amp;_fm.es._0.r=510000&amp;_fm.es._0.re=510100&amp;_fm.es._0.rec=&amp;notFirst=true&amp;_fm.es._0.o=&amp;_fm.es._0.c=&amp;_fm.es._0.co=&amp;_fm.es._0.sp=&amp;_fm.es._0.i=&amp;_fm.es._0.is=&amp;_fm.es._0.isf=&amp;_fm.es._0.isp=&amp;_fm.es._0.isc=&amp;_fm.es._0.isa=&amp;_fm.es._0.w=&amp;_fm.es._0.we=&amp;_fm.es._0.v=&amp;_fm.es._0.vo=&amp;_fm.es._0.t=&amp;_fm.es._0.tr=&amp;r=1361437092600&amp;sizePerPage=&amp;pageIndex=1&amp;weight=&amp;expressRouteSortType=&amp;_fm.es._0.sentc=&amp;tracelog=56_laiyuan_yemian_sy_rm_20130307dg6" target="_blank">东莞市<i class="i-15"></i>成都市<span><i class="s">1.42</i><span class="mg0 c444" style="margin:0px;">元/公斤</span></span><span class="c444">358元/立方</span><span class="c999"></span></a></li>
                </ul>
            </div>
            <div style="display: block;" class="f-tab-b">
                <ul class="route">

                    <li><a href="http://56.1688.com/order/price/estimate_price.htm?_fm.es._0.s=440000&amp;_fm.es._0.se=440300&amp;_fm.es._0.sen=&amp;_fm.es._0.r=310000&amp;_fm.es._0.re=310100&amp;_fm.es._0.rec=&amp;notFirst=true&amp;_fm.es._0.o=&amp;_fm.es._0.c=&amp;_fm.es._0.co=&amp;_fm.es._0.sp=&amp;_fm.es._0.i=&amp;_fm.es._0.is=&amp;_fm.es._0.isf=&amp;_fm.es._0.isp=&amp;_fm.es._0.isc=&amp;_fm.es._0.isa=&amp;_fm.es._0.w=&amp;_fm.es._0.we=&amp;_fm.es._0.v=&amp;_fm.es._0.vo=&amp;_fm.es._0.t=&amp;_fm.es._0.tr=&amp;r=1361426903526&amp;sizePerPage=&amp;pageIndex=1&amp;weight=&amp;expressRouteSortType=&amp;_fm.es._0.sentc=&amp;tracelog=56_laiyuan_yemian_sy_rm_20130307sz1" target="_blank">深圳市<i class="i-15"></i>上海市<span><i class="s">0.44</i><span class="mg0 c444" style="margin:0px;">元/公斤</span></span><span class="c444">120元/立方</span><span class="c999"></span></a></li>
                    <li><a href="http://56.1688.com/order/price/estimate_price.htm?_fm.es._0.s=440000&amp;_fm.es._0.se=440300&amp;_fm.es._0.sen=&amp;_fm.es._0.r=110000&amp;_fm.es._0.re=110100&amp;_fm.es._0.rec=&amp;notFirst=true&amp;_fm.es._0.o=&amp;_fm.es._0.c=&amp;_fm.es._0.co=&amp;_fm.es._0.sp=&amp;_fm.es._0.i=&amp;_fm.es._0.is=&amp;_fm.es._0.isf=&amp;_fm.es._0.isp=&amp;_fm.es._0.isc=&amp;_fm.es._0.isa=&amp;_fm.es._0.w=&amp;_fm.es._0.we=&amp;_fm.es._0.v=&amp;_fm.es._0.vo=&amp;_fm.es._0.t=&amp;_fm.es._0.tr=&amp;r=1361426925876&amp;sizePerPage=&amp;pageIndex=1&amp;weight=&amp;expressRouteSortType=&amp;_fm.es._0.sentc=&amp;tracelog=56_laiyuan_yemian_sy_rm_20130307sz2" target="_blank">深圳市<i class="i-15"></i>北京市<span><i class="s">0.78</i><span class="mg0 c444" style="margin:0px;">元/公斤</span></span><span class="c444">196元/立方</span><span class="c999"></span></a></li>
                    <li><a href="http://56.1688.com/order/price/estimate_price.htm?_fm.es._0.s=440000&amp;_fm.es._0.se=440300&amp;_fm.es._0.sen=&amp;_fm.es._0.r=320000&amp;_fm.es._0.re=320500&amp;_fm.es._0.rec=&amp;notFirst=true&amp;_fm.es._0.o=&amp;_fm.es._0.c=&amp;_fm.es._0.co=&amp;_fm.es._0.sp=&amp;_fm.es._0.i=&amp;_fm.es._0.is=&amp;_fm.es._0.isf=&amp;_fm.es._0.isp=&amp;_fm.es._0.isc=&amp;_fm.es._0.isa=&amp;_fm.es._0.w=&amp;_fm.es._0.we=&amp;_fm.es._0.v=&amp;_fm.es._0.vo=&amp;_fm.es._0.t=&amp;_fm.es._0.tr=&amp;r=1361426951708&amp;sizePerPage=&amp;pageIndex=1&amp;weight=&amp;expressRouteSortType=&amp;_fm.es._0.sentc=&amp;tracelog=56_laiyuan_yemian_sy_rm_20130307sz3" target="_blank">深圳市<i class="i-15"></i>苏州市<span><i class="s">0.44</i><span class="mg0 c444" style="margin:0px;">元/公斤</span></span><span class="c444">120元/立方</span><span class="c999"></span></a></li>
                    <li><a href="http://56.1688.com/order/price/estimate_price.htm?_fm.es._0.s=440000&amp;_fm.es._0.se=440300&amp;_fm.es._0.sen=&amp;_fm.es._0.r=330000&amp;_fm.es._0.re=330200&amp;_fm.es._0.rec=&amp;notFirst=true&amp;_fm.es._0.o=&amp;_fm.es._0.c=&amp;_fm.es._0.co=&amp;_fm.es._0.sp=&amp;_fm.es._0.i=&amp;_fm.es._0.is=&amp;_fm.es._0.isf=&amp;_fm.es._0.isp=&amp;_fm.es._0.isc=&amp;_fm.es._0.isa=&amp;_fm.es._0.w=&amp;_fm.es._0.we=&amp;_fm.es._0.v=&amp;_fm.es._0.vo=&amp;_fm.es._0.t=&amp;_fm.es._0.tr=&amp;r=1361426970778&amp;sizePerPage=&amp;pageIndex=1&amp;weight=&amp;expressRouteSortType=&amp;_fm.es._0.sentc=&amp;tracelog=56_laiyuan_yemian_sy_rm_20130307sz4" target="_blank">深圳市<i class="i-15"></i>宁波市<span><i class="s">0.50</i><span class="mg0 c444" style="margin:0px;">元/公斤</span></span><span class="c444">120元/立方</span><span class="c999"></span></a></li>
                    <li><a href="http://56.1688.com/order/price/estimate_price.htm?_fm.es._0.s=440000&amp;_fm.es._0.se=440300&amp;_fm.es._0.sen=&amp;_fm.es._0.r=510000&amp;_fm.es._0.re=510100&amp;_fm.es._0.rec=&amp;notFirst=true&amp;_fm.es._0.o=&amp;_fm.es._0.c=&amp;_fm.es._0.co=&amp;_fm.es._0.sp=&amp;_fm.es._0.i=&amp;_fm.es._0.is=&amp;_fm.es._0.isf=&amp;_fm.es._0.isp=&amp;_fm.es._0.isc=&amp;_fm.es._0.isa=&amp;_fm.es._0.w=&amp;_fm.es._0.we=&amp;_fm.es._0.v=&amp;_fm.es._0.vo=&amp;_fm.es._0.t=&amp;_fm.es._0.tr=&amp;r=1361426991253&amp;sizePerPage=&amp;pageIndex=1&amp;weight=&amp;expressRouteSortType=&amp;_fm.es._0.sentc=&amp;tracelog=56_laiyuan_yemian_sy_rm_20130307sz5" target="_blank">深圳市<i class="i-15"></i>成都市<span><i class="s">0.78</i><span class="mg0 c444" style="margin:0px;">元/公斤</span></span><span class="c444">196元/立方</span><span class="c999"></span></a></li>
                    <li><a href="http://56.1688.com/order/price/estimate_price.htm?_fm.es._0.s=440000&amp;_fm.es._0.se=440300&amp;_fm.es._0.sen=&amp;_fm.es._0.r=330000&amp;_fm.es._0.re=330100&amp;_fm.es._0.rec=&amp;notFirst=true&amp;_fm.es._0.o=&amp;_fm.es._0.c=&amp;_fm.es._0.co=&amp;_fm.es._0.sp=&amp;_fm.es._0.i=&amp;_fm.es._0.is=&amp;_fm.es._0.isf=&amp;_fm.es._0.isp=&amp;_fm.es._0.isc=&amp;_fm.es._0.isa=&amp;_fm.es._0.w=&amp;_fm.es._0.we=&amp;_fm.es._0.v=&amp;_fm.es._0.vo=&amp;_fm.es._0.t=&amp;_fm.es._0.tr=&amp;r=1361427011478&amp;sizePerPage=&amp;pageIndex=1&amp;weight=&amp;expressRouteSortType=&amp;_fm.es._0.sentc=&amp;tracelog=56_laiyuan_yemian_sy_rm_20130307sz6" target="_blank">深圳市<i class="i-15"></i>杭州市<span><i class="s">0.54</i><span class="mg0 c444" style="margin:0px;">元/公斤</span></span><span class="c444">144元/立方</span><span class="c999"></span></a></li>
                </ul>
            </div>

        </div>
    </div>
    <div class="grid-6 grid-fixed city">
        <div class="tit"><h2>热门城市</h2><a class="m" href="http://56.1688.com/routes/area-index.htm?tracelog=56_laiyuan_yemian_sy_rmcs_20130307" target="_blank">更多&gt;&gt;</a></div>
        <ul class="index_hot_city">
            <li class="hot_city_big"><a href="http://56.1688.com/routes/shenzhen.htm?tracelog=56_laiyuan_yemian_sy_rmcs_201303071" target="_blank" style="color:#444">深圳</a></li>
            <li class="hot_city_big"><a href="http://56.1688.com/routes/dongguan.htm?tracelog=56_laiyuan_yemian_sy_rmcs_201303072" target="_blank" style="color:#444">东莞</a></li>
            <li class="hot_city_small"><a href="http://56.1688.com/routes/wuxi320200.htm?tracelog=56_laiyuan_yemian_sy_rmcs_2013030714" target="_blank">无锡</a></li>
            <li class="hot_city_big"><a href="http://56.1688.com/routes/ningbo.htm?tracelog=56_laiyuan_yemian_sy_rmcs_201303076" target="_blank" style="color:#444">宁波</a></li>
            <li><a href="http://56.1688.com/routes/shaoxing330600.htm?tracelog=56_laiyuan_yemian_sy_rmcs_2013030716" target="_blank">绍兴</a></li>
            <li><a href="http://56.1688.com/routes/qingdao.htm?tracelog=56_laiyuan_yemian_sy_rmcs_2013030715" target="_blank">青岛</a></li>
            <li><a href="http://56.1688.com/routes/dalian.htm?tracelog=56_laiyuan_yemian_sy_rmcs_2013030724" target="_blank">大连</a></li>
            <li class="hot_city_big"><a href="http://56.1688.com/routes/beijing.htm?tracelog=56_laiyuan_yemian_sy_rmcs_2013030711" target="_blank" style="color:#444">北京</a></li>
            <li class="hot_city_small"><a href="http://56.1688.com/routes/xian610100.htm?tracelog=56_laiyuan_yemian_sy_rmcs_2013030725" target="_blank">西安</a></li>
            <li class="hot_city_small"><a href="http://56.1688.com/routes/changzhou320400.htm?tracelog=56_laiyuan_yemian_sy_rmcs_2013030719" target="_blank">常州</a></li>
            <li><a href="http://56.1688.com/routes/quanzhou350500.htm?tracelog=56_laiyuan_yemian_sy_rmcs_2013030717" target="_blank">泉州</a></li>
            <li class="hot_city_big"><a href="http://56.1688.com/routes/wenzhou.htm?tracelog=56_laiyuan_yemian_sy_rmcs_201303078" target="_blank" style="color:#444">温州</a></li>
            <li class="hot_city_small"><a href="http://56.1688.com/routes/chaozhou.htm?tracelog=56_laiyuan_yemian_sy_rmcs_2013030722" target="_blank">潮州</a></li>
            <li class="hot_city_small"><a href="http://56.1688.com/routes/xiamen.htm?tracelog=56_laiyuan_yemian_sy_rmcs_2013030723" target="_blank">厦门</a></li>

            <li class="hot_city_big"><a href="http://56.1688.com/routes/guangzhou.htm?tracelog=56_laiyuan_yemian_sy_rmcs_201303073" target="_blank" style="color:#444">广州</a></li>
        </ul>
    </div>
</div>
<div class="layout">
    <div class="grid-19">
        <div class="tit"><h2>客户声音</h2><span class="tip fd-left"></span><a class="m" target="_blank"></a></div>
        <ul class="succ">

            <li><img src="index_files/827206_1877011556.png"><i class="i-8"></i><div class="cont"><a href="http://club.1688.com/threadview/33940810.html?tracelog=56_laiyuan_yemian_sy_kh_201303072" style="color:#444"><h3>段经理：阿里物流“多快好省” </h3><p> 我加入阿里诚信通一年了，用阿里物流...</p></a></div></li>
            <li><img src="index_files/827206_1877011556.png"><i class="i-8"></i><div class="cont"><a href="http://club.1688.com/threadview/34320837.html?tracelog=56_laiyuan_yemian_sy_kh_2013030724" style="color:#444"><h3>黄小姐：平安货运险，1天理赔</h3><p> 这次运的是花瓶（易碎品），碎品损...</p></a></div></li>

        </ul>
    </div>
    <div class="grid-6 grid-fixed">
        <div class="tit"><h2>快速入门</h2><a class="m" href="http://club.1688.com/threadview/29567168.html?tracelog=56_laiyuan_yemian_sy_rm_20130307" target="_blank">更多&gt;&gt;</a></div>
        <ul class="quickin">
            <li><i class="i-23"></i><a href="http://peixun.1688.com/train/detail/strainrw/_k0_id/_v0_6891/etrainrw/detail.htm?tracelog=56_laiyuan_yemian_sy_rm_2013030701" target="_blank" style="color:#444">阿里物流新手一分钟教程</a><i class="i-14"></i></li>
            <li><i class="i-23"></i><a href="http://114.1688.com/kf/wlfw_help/view-20529405.html?tracelog=56_laiyuan_yemian_sy_rm_2013030702" target="_blank" style="color:#444">什么是阿里物流服务？</a></li>
           
        </ul>
    </div>
</div>
<div class="layout">
    <div class="grid-25 frd">
        <div class="t"><h2>友情链接</h2></div>
        <ul>
            <li><a alt="国家交通运输物流公共信息平台
" href="http://www.logink.org/eac/web/info/" target="_blank" style="color:#444">国家交通运输物流公共信息平台
            </a></li>
        </ul>
    </div>
</div>

</div>
<input id="56-domain" value="http://56.1688.com" type="hidden">
<%@include file="/shop/footer.jsp" %>
</div>

<script src="${ctx}/jqueryui/jarea/public.js" type="text/javascript"></script>
</body>
</html>