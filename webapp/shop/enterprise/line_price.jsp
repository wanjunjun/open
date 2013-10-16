<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>大隆物流 - 线路运价查询 -- 阿里巴巴物流平台56.1688.com-网上发货从这里开始</title>

<link rel="stylesheet" type="text/css" href="${ctx}/shop/css/g.css">
<link rel="stylesheet" type="text/css" href="${ctx}/shop/css/c.css">
<link rel="stylesheet" type="text/css" href="${ctx}/shop/css/portal.css">
<link rel="stylesheet" type="text/css" href="${ctx}/shop/css/alp-min.css">

</head>
<body>
<%@include file="/shop/enterprise/header.jsp" %>
<div class="main">
<div class="subHead">
			<img src="line_price_files/987631493_1682843553.jpg" alt="大隆物流 LOGO" title="大隆物流 LOGO" style="height:28px;">
		<div class="corpName">
		大隆物流
			</div>
	<span>服务电话：4007-007-147 </span>
</div>
	<ul id="menu">
		<li id="index" name="menuHeader" class=""><a href="http://56.1688.com/corp-B2B-1771892786239/"><strong>首页</strong></a></li>
		<li id="introdution" name="menuHeader"><a href="http://56.1688.com/corp-B2B-1771892786239/introduction.htm"><strong>公司介绍</strong></a></li>
		<li class="" id="network" name="menuHeader"><a href="http://56.1688.com/corp-B2B-1771892786239/search_network.htm"><strong>网点介绍</strong></a></li>
		<li class="curMenu" id="route" name="menuHeader"><a href="http://56.1688.com/corp-B2B-1771892786239/search_routes.htm"><strong>线路运价</strong></a></li>
		<li id="rate" name="menuHeader"><a href="http://56.1688.com/corp-B2B-1771892786239/corpRate.htm"><strong>店铺评分</strong></a><i class="alp-tmp-icon alp-tmp-new" style="position:absolute;top:-8px;right:8px;"></i></li>
		<li id="product" name="menuHeader"><a href="http://56.1688.com/corp-B2B-1771892786239/product.htm"><strong>产品及服务</strong></a></li>
		<li id="contact" name="menuHeader"><a href="http://56.1688.com/corp-B2B-1771892786239/contact.htm"><strong>联系我们</strong></a></li>
	</ul>
</div>
<div class="main" style="overflow:visible">
<%@include file="/shop/enterprise/left.jsp" %>
<div class="right">




<h1 class="p-m FS16 B">
	大隆物流 线路运价
</h1>

<div class="banner" style="margin-top:30px;width:748px;overflow:hidden;">
	<a> 
</a>
</div>

      <div class="m_mylsBox-bd alp-price-page" style="padding:0px;overflow:visible">
		<input id="senderProvinceName" value="" type="hidden">
		<input id="senderCityName" value="" type="hidden">
		<input id="senderCountyName" value="" type="hidden">
		<input id="receiverProvinceName" value="" type="hidden">
		<input id="receiverCityName" value="" type="hidden">
		<input id="receiverCountyName" value="" type="hidden">
		
		<input id="senderProvinceCode" value="" type="hidden">
		<input id="senderCityCode" value="" type="hidden">
		<input id="senderCountyCode" value="" type="hidden">
		<input id="receiverProvinceCode" value="" type="hidden">
		<input id="receiverCityCode" value="" type="hidden">
		<input id="receiverCountyCode" value="" type="hidden">
		
		<form action="http://56.1688.com/corp-B2B-1771892786239/search_routes.htm" method="get" id="queryForm">

						<input class="hidden-area" autocomplete="off" id="senderProvince" value="" type="hidden">
			<input class="hidden-area" autocomplete="off" name="fromCity" id="senderCity" value="" type="hidden">
			<input class="hidden-area" autocomplete="off" name="fromCounty" id="senderCounty" value="" type="hidden">
			<input class="hidden-area" autocomplete="off" id="receiverProvince" value="" type="hidden">
			<input class="hidden-area" autocomplete="off" name="toCity" id="receiverCity" value="" type="hidden">
			<input class="hidden-area" autocomplete="off" name="toCounty" id="receiverCounty" value="" type="hidden">
			
		<div class="price-query">
			<label>发货地</label> <input value="请选择城市（可输入中文或拼音）" aria-haspopup="true" aria-autocomplete="list" role="textbox" class="alp-area-text ui-autocomplete-input" autocomplete="off" id="source-area">
			<label>收货地</label> <input value="请选择城市（可输入中文或拼音）" aria-haspopup="true" aria-autocomplete="list" role="textbox" class="alp-area-text ui-autocomplete-input" autocomplete="off" id="dest-area">
									
			
			<a class="alp-btnt-3" action="queryForm" id="price-query-btn" onmousedown="return aliclick(this,'?tracelog=itu_tran_computform_compute'); ">
				<span class="inner">&nbsp;&nbsp;查&nbsp;&nbsp;&nbsp;&nbsp;询&nbsp;&nbsp;</span>
			</a>
					
			<div style="display: none;" id="source-area-select" class="area-select area-tab"><ul class="h">				<li tabindex="0" class="s-tab-t current"><span class="inner" index="0">常用</span></li>				<li tabindex="1" class="s-tab-t"><span class="inner" index="1">省</span></li>				<li tabindex="2" class="s-tab-t"><span class="inner" index="2">市</span></li>				<li tabindex="3" class="s-tab-t"><span class="inner" index="3">区县</span></li>				<span style="display: none;" class="alp-icon alp-close alp-close-area"></span>				<div class="c"></div>			</ul>			<div style="display: block;" index="0" class="s-tab-b"><ul><li><a href="javascript:;" class="panel-item" code="310100" panel-item="上海市">上海市</a></li><li><a href="javascript:;" class="panel-item" code="440300" panel-item="深圳市">深圳市</a></li><li><a href="javascript:;" class="panel-item" code="110100" panel-item="北京市">北京市</a></li><li><a href="javascript:;" class="panel-item" code="440100" panel-item="广州市">广州市</a></li><li><a href="javascript:;" class="panel-item" code="320500" panel-item="苏州市">苏州市</a></li><li><a href="javascript:;" class="panel-item" code="510100" panel-item="成都市">成都市</a></li><li><a href="javascript:;" class="panel-item" code="441900" panel-item="东莞市">东莞市</a></li><li><a href="javascript:;" class="panel-item" code="330200" panel-item="宁波市">宁波市</a></li><li><a href="javascript:;" class="panel-item" code="120100" panel-item="天津市">天津市</a></li><li><a href="javascript:;" class="panel-item" code="330100" panel-item="杭州市">杭州市</a></li><li><a href="javascript:;" class="panel-item" code="370200" panel-item="青岛市">青岛市</a></li><li><a href="javascript:;" class="panel-item" code="500100" panel-item="重庆市">重庆市</a></li><li><a href="javascript:;" class="panel-item" code="420100" panel-item="武汉市">武汉市</a></li><li><a href="javascript:;" class="panel-item" code="440600" panel-item="佛山市">佛山市</a></li><li><a href="javascript:;" class="panel-item" code="410100" panel-item="郑州市">郑州市</a></li></ul><div class="c"></div></div>			<div style="display: none;" index="1" class="s-tab-b"><dl class="panel-category"><dt>A-G</dt><dd><ul><li><a href="javascript:;" class="panel-item" code="340000" panel-item="安徽省">安徽省</a></li><li><a href="javascript:;" class="panel-item" code="820000" panel-item="澳门特别行政区">澳门特别行政区</a></li><li><a href="javascript:;" class="panel-item" code="110000" panel-item="北京">北京</a></li><li><a href="javascript:;" class="panel-item" code="500000" panel-item="重庆">重庆</a></li><li><a href="javascript:;" class="panel-item" code="350000" panel-item="福建省">福建省</a></li><li><a href="javascript:;" class="panel-item" code="440000" panel-item="广东省">广东省</a></li><li><a href="javascript:;" class="panel-item" code="620000" panel-item="甘肃省">甘肃省</a></li><li><a href="javascript:;" class="panel-item" code="450000" panel-item="广西壮族自治区">广西壮族自治区</a></li><li><a href="javascript:;" class="panel-item" code="520000" panel-item="贵州省">贵州省</a></li></ul></dd></dl><dl class="panel-category"><dt>H-K</dt><dd><ul><li><a href="javascript:;" class="panel-item" code="130000" panel-item="河北省">河北省</a></li><li><a href="javascript:;" class="panel-item" code="420000" panel-item="湖北省">湖北省</a></li><li><a href="javascript:;" class="panel-item" code="230000" panel-item="黑龙江省">黑龙江省</a></li><li><a href="javascript:;" class="panel-item" code="460000" panel-item="海南省">海南省</a></li><li><a href="javascript:;" class="panel-item" code="410000" panel-item="河南省">河南省</a></li><li><a href="javascript:;" class="panel-item" code="430000" panel-item="湖南省">湖南省</a></li><li><a href="javascript:;" class="panel-item" code="990000" panel-item="海外">海外</a></li><li><a href="javascript:;" class="panel-item" code="220000" panel-item="吉林省">吉林省</a></li><li><a href="javascript:;" class="panel-item" code="320000" panel-item="江苏省">江苏省</a></li><li><a href="javascript:;" class="panel-item" code="360000" panel-item="江西省">江西省</a></li></ul></dd></dl><dl class="panel-category"><dt>L-S</dt><dd><ul><li><a href="javascript:;" class="panel-item" code="210000" panel-item="辽宁省">辽宁省</a></li><li><a href="javascript:;" class="panel-item" code="150000" panel-item="内蒙古自治区">内蒙古自治区</a></li><li><a href="javascript:;" class="panel-item" code="640000" panel-item="宁夏回族自治区">宁夏回族自治区</a></li><li><a href="javascript:;" class="panel-item" code="630000" panel-item="青海省">青海省</a></li><li><a href="javascript:;" class="panel-item" code="510000" panel-item="四川省">四川省</a></li><li><a href="javascript:;" class="panel-item" code="370000" panel-item="山东省">山东省</a></li><li><a href="javascript:;" class="panel-item" code="310000" panel-item="上海">上海</a></li><li><a href="javascript:;" class="panel-item" code="610000" panel-item="陕西省">陕西省</a></li><li><a href="javascript:;" class="panel-item" code="140000" panel-item="山西省">山西省</a></li></ul></dd></dl><dl class="panel-category"><dt>T-Z</dt><dd><ul><li><a href="javascript:;" class="panel-item" code="120000" panel-item="天津">天津</a></li><li><a href="javascript:;" class="panel-item" code="710000" panel-item="台湾省">台湾省</a></li><li><a href="javascript:;" class="panel-item" code="810000" panel-item="香港特别行政区">香港特别行政区</a></li><li><a href="javascript:;" class="panel-item" code="650000" panel-item="新疆维吾尔自治区">新疆维吾尔自治区</a></li><li><a href="javascript:;" class="panel-item" code="540000" panel-item="西藏自治区">西藏自治区</a></li><li><a href="javascript:;" class="panel-item" code="530000" panel-item="云南省">云南省</a></li><li><a href="javascript:;" class="panel-item" code="330000" panel-item="浙江省">浙江省</a></li></ul></dd></dl></div>			<div style="display: none;" index="2" class="s-tab-b"></div>			<div style="display: none;" index="3" class="s-tab-b"></div>			<div class="c"></div></div>
            <div style="display: none;" id="dest-area-select" class="area-select area-tab"><ul class="h">				<li tabindex="0" class="s-tab-t current"><span class="inner" index="0">常用</span></li>				<li tabindex="1" class="s-tab-t"><span class="inner" index="1">省</span></li>				<li tabindex="2" class="s-tab-t"><span class="inner" index="2">市</span></li>				<li tabindex="3" class="s-tab-t"><span class="inner" index="3">区县</span></li>				<span style="display: none;" class="alp-icon alp-close alp-close-area"></span>				<div class="c"></div>			</ul>			<div style="display: block;" index="0" class="s-tab-b"><ul><li><a href="javascript:;" class="panel-item" code="310100" panel-item="上海市">上海市</a></li><li><a href="javascript:;" class="panel-item" code="440300" panel-item="深圳市">深圳市</a></li><li><a href="javascript:;" class="panel-item" code="110100" panel-item="北京市">北京市</a></li><li><a href="javascript:;" class="panel-item" code="440100" panel-item="广州市">广州市</a></li><li><a href="javascript:;" class="panel-item" code="320500" panel-item="苏州市">苏州市</a></li><li><a href="javascript:;" class="panel-item" code="510100" panel-item="成都市">成都市</a></li><li><a href="javascript:;" class="panel-item" code="441900" panel-item="东莞市">东莞市</a></li><li><a href="javascript:;" class="panel-item" code="330200" panel-item="宁波市">宁波市</a></li><li><a href="javascript:;" class="panel-item" code="120100" panel-item="天津市">天津市</a></li><li><a href="javascript:;" class="panel-item" code="330100" panel-item="杭州市">杭州市</a></li><li><a href="javascript:;" class="panel-item" code="370200" panel-item="青岛市">青岛市</a></li><li><a href="javascript:;" class="panel-item" code="500100" panel-item="重庆市">重庆市</a></li><li><a href="javascript:;" class="panel-item" code="420100" panel-item="武汉市">武汉市</a></li><li><a href="javascript:;" class="panel-item" code="440600" panel-item="佛山市">佛山市</a></li><li><a href="javascript:;" class="panel-item" code="410100" panel-item="郑州市">郑州市</a></li></ul><div class="c"></div></div>			<div style="display: none;" index="1" class="s-tab-b"><dl class="panel-category"><dt>A-G</dt><dd><ul><li><a href="javascript:;" class="panel-item" code="340000" panel-item="安徽省">安徽省</a></li><li><a href="javascript:;" class="panel-item" code="820000" panel-item="澳门特别行政区">澳门特别行政区</a></li><li><a href="javascript:;" class="panel-item" code="110000" panel-item="北京">北京</a></li><li><a href="javascript:;" class="panel-item" code="500000" panel-item="重庆">重庆</a></li><li><a href="javascript:;" class="panel-item" code="350000" panel-item="福建省">福建省</a></li><li><a href="javascript:;" class="panel-item" code="440000" panel-item="广东省">广东省</a></li><li><a href="javascript:;" class="panel-item" code="620000" panel-item="甘肃省">甘肃省</a></li><li><a href="javascript:;" class="panel-item" code="450000" panel-item="广西壮族自治区">广西壮族自治区</a></li><li><a href="javascript:;" class="panel-item" code="520000" panel-item="贵州省">贵州省</a></li></ul></dd></dl><dl class="panel-category"><dt>H-K</dt><dd><ul><li><a href="javascript:;" class="panel-item" code="130000" panel-item="河北省">河北省</a></li><li><a href="javascript:;" class="panel-item" code="420000" panel-item="湖北省">湖北省</a></li><li><a href="javascript:;" class="panel-item" code="230000" panel-item="黑龙江省">黑龙江省</a></li><li><a href="javascript:;" class="panel-item" code="460000" panel-item="海南省">海南省</a></li><li><a href="javascript:;" class="panel-item" code="410000" panel-item="河南省">河南省</a></li><li><a href="javascript:;" class="panel-item" code="430000" panel-item="湖南省">湖南省</a></li><li><a href="javascript:;" class="panel-item" code="990000" panel-item="海外">海外</a></li><li><a href="javascript:;" class="panel-item" code="220000" panel-item="吉林省">吉林省</a></li><li><a href="javascript:;" class="panel-item" code="320000" panel-item="江苏省">江苏省</a></li><li><a href="javascript:;" class="panel-item" code="360000" panel-item="江西省">江西省</a></li></ul></dd></dl><dl class="panel-category"><dt>L-S</dt><dd><ul><li><a href="javascript:;" class="panel-item" code="210000" panel-item="辽宁省">辽宁省</a></li><li><a href="javascript:;" class="panel-item" code="150000" panel-item="内蒙古自治区">内蒙古自治区</a></li><li><a href="javascript:;" class="panel-item" code="640000" panel-item="宁夏回族自治区">宁夏回族自治区</a></li><li><a href="javascript:;" class="panel-item" code="630000" panel-item="青海省">青海省</a></li><li><a href="javascript:;" class="panel-item" code="510000" panel-item="四川省">四川省</a></li><li><a href="javascript:;" class="panel-item" code="370000" panel-item="山东省">山东省</a></li><li><a href="javascript:;" class="panel-item" code="310000" panel-item="上海">上海</a></li><li><a href="javascript:;" class="panel-item" code="610000" panel-item="陕西省">陕西省</a></li><li><a href="javascript:;" class="panel-item" code="140000" panel-item="山西省">山西省</a></li></ul></dd></dl><dl class="panel-category"><dt>T-Z</dt><dd><ul><li><a href="javascript:;" class="panel-item" code="120000" panel-item="天津">天津</a></li><li><a href="javascript:;" class="panel-item" code="710000" panel-item="台湾省">台湾省</a></li><li><a href="javascript:;" class="panel-item" code="810000" panel-item="香港特别行政区">香港特别行政区</a></li><li><a href="javascript:;" class="panel-item" code="650000" panel-item="新疆维吾尔自治区">新疆维吾尔自治区</a></li><li><a href="javascript:;" class="panel-item" code="540000" panel-item="西藏自治区">西藏自治区</a></li><li><a href="javascript:;" class="panel-item" code="530000" panel-item="云南省">云南省</a></li><li><a href="javascript:;" class="panel-item" code="330000" panel-item="浙江省">浙江省</a></li></ul></dd></dl></div>			<div style="display: none;" index="2" class="s-tab-b"></div>			<div style="display: none;" index="3" class="s-tab-b"></div>			<div class="c"></div></div>
            <input id="areasByPinyinURL" value="http://56.1688.com/address/aj_get_areas_by_pinyin.do" type="hidden">
		</div>
					
		<div class="recoLine">
					<table>
				<thead><tr><th>线路</th><th>运输方式</th><th>参考时效</th><th>单价（重货）</th><th>单价（轻货）</th><th>最低一票</th><th>操作</th></tr></thead>
				<tbody>
															<tr>
    						<td><a title="线路详情" href="http://56.1688.com/corp-b2b-1771892786239/route-440000-440000-440100-440600-440111-440607-21000008004-174085-D2D.htm">广州市－白云区 - 佛山市－三水区</a></td>
    						<td>汽运专线</td>
    						<td>1天</td>
    						<td>市场价：<del>0.20</del>元/公斤<br>会员价：<strong class="F14">0.20</strong>元/公斤</td>
    						<td>市场价：<del>100</del>元/立方<br>会员价：<strong class="F14">100</strong>元/立方</td>
    						<td>50.00元</td>
    						<td align="center"><a rel="nofollow" href="http://56.1688.com/order/order_by_route.htm?routeCode=440000-440000-440100-440600-440111-440607-21000008004-174085-D2D" target="_blank"><b class="btn_placeAnOrder"></b></a></td>
						</tr>
								    											<tr>
    						<td><a title="线路详情" href="http://56.1688.com/corp-b2b-1771892786239/route-440000-440000-441900-440600-999441900-440607-21000008004-174085-D2D.htm">东莞市－东莞市 - 佛山市－三水区</a></td>
    						<td>汽运专线</td>
    						<td>1天</td>
    						<td>市场价：<del>0.20</del>元/公斤<br>会员价：<strong class="F14">0.20</strong>元/公斤</td>
    						<td>市场价：<del>100</del>元/立方<br>会员价：<strong class="F14">100</strong>元/立方</td>
    						<td>50.00元</td>
    						<td align="center"><a rel="nofollow" href="http://56.1688.com/order/order_by_route.htm?routeCode=440000-440000-441900-440600-999441900-440607-21000008004-174085-D2D" target="_blank"><b class="btn_placeAnOrder"></b></a></td>
						</tr>
								    											<tr>
    						<td><a title="线路详情" href="http://56.1688.com/corp-b2b-1771892786239/route-440000-440000-440600-440100-440607-440116-21000008004-174085-D2D.htm">佛山市－三水区 - 广州市－萝岗区</a></td>
    						<td>汽运专线</td>
    						<td>1天</td>
    						<td>市场价：<del>0.40</del>元/公斤<br>会员价：<strong class="F14">0.40</strong>元/公斤</td>
    						<td>市场价：<del>100</del>元/立方<br>会员价：<strong class="F14">100</strong>元/立方</td>
    						<td>50.00元</td>
    						<td align="center"><a rel="nofollow" href="http://56.1688.com/order/order_by_route.htm?routeCode=440000-440000-440600-440100-440607-440116-21000008004-174085-D2D" target="_blank"><b class="btn_placeAnOrder"></b></a></td>
						</tr>
								    											<tr>
    						<td><a title="线路详情" href="http://56.1688.com/corp-b2b-1771892786239/route-440000-440000-440600-440100-440607-440114-21000008004-174085-D2D.htm">佛山市－三水区 - 广州市－花都区</a></td>
    						<td>汽运专线</td>
    						<td>1天</td>
    						<td>市场价：<del>0.40</del>元/公斤<br>会员价：<strong class="F14">0.40</strong>元/公斤</td>
    						<td>市场价：<del>100</del>元/立方<br>会员价：<strong class="F14">100</strong>元/立方</td>
    						<td>50.00元</td>
    						<td align="center"><a rel="nofollow" href="http://56.1688.com/order/order_by_route.htm?routeCode=440000-440000-440600-440100-440607-440114-21000008004-174085-D2D" target="_blank"><b class="btn_placeAnOrder"></b></a></td>
						</tr>
								    											<tr>
    						<td><a title="线路详情" href="http://56.1688.com/corp-b2b-1771892786239/route-440000-440000-440600-440100-440607-440113-21000008004-174085-D2D.htm">佛山市－三水区 - 广州市－番禺区</a></td>
    						<td>汽运专线</td>
    						<td>1天</td>
    						<td>市场价：<del>0.40</del>元/公斤<br>会员价：<strong class="F14">0.40</strong>元/公斤</td>
    						<td>市场价：<del>100</del>元/立方<br>会员价：<strong class="F14">100</strong>元/立方</td>
    						<td>50.00元</td>
    						<td align="center"><a rel="nofollow" href="http://56.1688.com/order/order_by_route.htm?routeCode=440000-440000-440600-440100-440607-440113-21000008004-174085-D2D" target="_blank"><b class="btn_placeAnOrder"></b></a></td>
						</tr>
								    											<tr>
    						<td><a title="线路详情" href="http://56.1688.com/corp-b2b-1771892786239/route-440000-440000-440600-440100-440607-440103-21000008004-174085-D2D.htm">佛山市－三水区 - 广州市－荔湾区</a></td>
    						<td>汽运专线</td>
    						<td>1天</td>
    						<td>市场价：<del>0.40</del>元/公斤<br>会员价：<strong class="F14">0.40</strong>元/公斤</td>
    						<td>市场价：<del>100</del>元/立方<br>会员价：<strong class="F14">100</strong>元/立方</td>
    						<td>50.00元</td>
    						<td align="center"><a rel="nofollow" href="http://56.1688.com/order/order_by_route.htm?routeCode=440000-440000-440600-440100-440607-440103-21000008004-174085-D2D" target="_blank"><b class="btn_placeAnOrder"></b></a></td>
						</tr>
								    											<tr>
    						<td><a title="线路详情" href="http://56.1688.com/corp-b2b-1771892786239/route-440000-440000-440600-440100-440607-440104-21000008004-174085-D2D.htm">佛山市－三水区 - 广州市－越秀区</a></td>
    						<td>汽运专线</td>
    						<td>1天</td>
    						<td>市场价：<del>0.40</del>元/公斤<br>会员价：<strong class="F14">0.40</strong>元/公斤</td>
    						<td>市场价：<del>100</del>元/立方<br>会员价：<strong class="F14">100</strong>元/立方</td>
    						<td>50.00元</td>
    						<td align="center"><a rel="nofollow" href="http://56.1688.com/order/order_by_route.htm?routeCode=440000-440000-440600-440100-440607-440104-21000008004-174085-D2D" target="_blank"><b class="btn_placeAnOrder"></b></a></td>
						</tr>
								    											<tr>
    						<td><a title="线路详情" href="http://56.1688.com/corp-b2b-1771892786239/route-440000-440000-440600-440100-440607-440105-21000008004-174085-D2D.htm">佛山市－三水区 - 广州市－海珠区</a></td>
    						<td>汽运专线</td>
    						<td>1天</td>
    						<td>市场价：<del>0.40</del>元/公斤<br>会员价：<strong class="F14">0.40</strong>元/公斤</td>
    						<td>市场价：<del>100</del>元/立方<br>会员价：<strong class="F14">100</strong>元/立方</td>
    						<td>50.00元</td>
    						<td align="center"><a rel="nofollow" href="http://56.1688.com/order/order_by_route.htm?routeCode=440000-440000-440600-440100-440607-440105-21000008004-174085-D2D" target="_blank"><b class="btn_placeAnOrder"></b></a></td>
						</tr>
								    											<tr>
    						<td><a title="线路详情" href="http://56.1688.com/corp-b2b-1771892786239/route-440000-440000-440600-440100-440607-440112-21000008004-174085-D2D.htm">佛山市－三水区 - 广州市－黄埔区</a></td>
    						<td>汽运专线</td>
    						<td>1天</td>
    						<td>市场价：<del>0.40</del>元/公斤<br>会员价：<strong class="F14">0.40</strong>元/公斤</td>
    						<td>市场价：<del>100</del>元/立方<br>会员价：<strong class="F14">100</strong>元/立方</td>
    						<td>50.00元</td>
    						<td align="center"><a rel="nofollow" href="http://56.1688.com/order/order_by_route.htm?routeCode=440000-440000-440600-440100-440607-440112-21000008004-174085-D2D" target="_blank"><b class="btn_placeAnOrder"></b></a></td>
						</tr>
								    											<tr>
    						<td><a title="线路详情" href="http://56.1688.com/corp-b2b-1771892786239/route-440000-440000-440600-440100-440606-440112-21000008004-174085-D2D.htm">佛山市－顺德区 - 广州市－黄埔区</a></td>
    						<td>汽运专线</td>
    						<td>1天</td>
    						<td>市场价：<del>0.40</del>元/公斤<br>会员价：<strong class="F14">0.40</strong>元/公斤</td>
    						<td>市场价：<del>100</del>元/立方<br>会员价：<strong class="F14">100</strong>元/立方</td>
    						<td>50.00元</td>
    						<td align="center"><a rel="nofollow" href="http://56.1688.com/order/order_by_route.htm?routeCode=440000-440000-440600-440100-440606-440112-21000008004-174085-D2D" target="_blank"><b class="btn_placeAnOrder"></b></a></td>
						</tr>
								    				</tbody>
			</table>
			

			<input id="pageSize" value="99" type="hidden">
			<div class="pages" id="pages" align="right">
								 第1页/共99页
																				<a id="nextPage" href="http://56.1688.com/corp-b2b-1771892786239/search_routes-p1.htm">下一页</a>
																	<input value="0" name="offerSet" id="offerSet" type="hidden">
				<input value="1" size="3" maxlength="5" id="showOfferSet" type="text">
				<input id="pageCommit" value="确定" style="margin-left:8px" onclick="clickGo()" type="button">
			</div>	
				</div>
	</form>
	</div>
<input id="htdocsUrl" value="http://img.s.aliimg.com/alp" type="hidden">

</div>
</div>
<%@include file="/shop/enterprise/footer.jsp" %>

</body></html>