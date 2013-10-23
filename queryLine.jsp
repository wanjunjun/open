<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>网上发货从这里开始</title>
	
	<link rel="stylesheet" href="${ctx}/shop/css/standard-v0.css">
	<link rel="stylesheet" href="${ctx}/shop/css/fdev-float.css">
	<link rel="stylesheet" href="${ctx}/shop/css/standard-v4-min.css">
	<link rel="stylesheet" href="${ctx}/shop/css/alp-min.css">
	
	<script src="${ctx}/js/entry.js" type="text/javascript"></script>
	<script src="${ctx}/js/entry.jquery.js" type="text/javascript"></script>
	<script src="${ctx}/js/Common.js" type="text/javascript"></script>
	<script type="text/javascript">
	jQuery(document).ready(function() {
		$("#pageNo").val("${page.pageNo}");
		$("#pageIndex").val("${page.pageNo}");
		if(1 == $("#totalPages").val()){
			$("#prePage").hide();
			$("#nextPage").hide();
		}
		if(1 == $("#pageNo").val()){
			$("#prePage").hide();
		}
		var pageNums = parseInt("${page.totalPages}");	
		$("#pagination").empty();
		$("#pagination").append('<a id="prePage" href="javascript:;" class="pre-disabled"></a>');
		for(var i = 0; i < pageNums; i++){
			if((i+1) == 1){
				$("#pagination").append('<a href="javascript:goPage('+(i+1)+');" class="current" pi="'+(i+1)+'">'+(i+1)+'</a>');
			}else{
				$("#pagination").append('<a href="javascript:goPage('+(i+1)+');" pi="'+(i+1)+'">'+(i+1)+'</a>');	
			}			
			if((i+1) == 10)break;
		}		
		$("#pagination").append('<a href="javascript:nextPage();" id="nextPage" class="next">下一页</a>');
	});
	var pn = 1;
	function prePage() {
		var bean = new Object();
		bean.page = parseInt($("#pageNo").val()) - 1;
		if (bean.page < 1) {
			return;
		}
		bean.rows = $("#pageSize").val();
		Common.ajax("${ctx}/shop/queryLineFragment.do", bean, refreshGrid, "html");
		pn = bean.page;
	}
	function nextPage() {
		var bean = new Object();
		bean.page = parseInt($("#pageNo").val()) + 1;
		if (bean.page > $("#totalPages").val()) {
			return;
		}
		bean.rows = $("#pageSize").val();
		Common.ajax("${ctx}/shop/queryLineFragment.do", bean, refreshGrid, "html");
		pn = bean.page;
	}
	function goPage(pageIndex) {
		var bean = new Object();
		bean.page = parseInt(pageIndex);
		if (bean.page > $("#totalPages").val() && bean.page < 1) {
			return;
		}
		bean.rows = $("#pageSize").val();
		Common.ajax("${ctx}/shop/queryLineFragment.do", bean, refreshGrid, "html");
		pn = bean.page;
	}
	function refreshGrid(data){
		$("#pageList").empty();
		$("#pageList").append(data);
		$("#pageNo").val(pn);
		$("#pageIndex").val(pn);
		$("#currPage").text(pn);
		if(pn == 1){
			$("#pagination > a:first").addClass("pre-disabled");
			$("#pagination > a").removeClass("current");
			$("#pagination > a[pi="+pn+"]").addClass("current");
		}else if(pn == $("#totalPages").val()){
			$("#pagination > a:first").removeClass("pre-disabled");
			$("#pagination > a:first").addClass("pre");
			$("#pagination > a:first").attr("href", "javascript:prePage();");
			$("#pagination > a").removeClass("current");
			$("#pagination > a[pi="+pn+"]").addClass("current");
		}else{
			$("#pagination > a:first").removeClass("pre-disabled");
			$("#pagination > a:first").addClass("pre");
			$("#pagination > a:first").attr("href", "javascript:prePage();");
			$("#pagination > a").removeClass("current");
			$("#pagination > a[pi="+pn+"]").addClass("current");
		}
		var lastIndex = parseInt($("#nextPage").prev("a").text());
		var firstIndex = parseInt($("#prePage").next("a").text());
		if(pn > lastIndex){			
			var sp = pn - lastIndex;
			$("#pagination > a[pi]:lt("+sp+")").remove();
			if(sp > 10){
				for(var i = 9; i > 0; i--){						
					$("#nextPage").before('<a href="javascript:goPage('+(pn-i)+');" pi="'+(pn-i)+'">'+(pn-i)+'</a>');
				}	
			}
			for(var i = 1; i < sp; i++){
				//$("#pagination > a[pi]:last").after('<a href="javascript:goPage('+(lastIndex+i)+');" pi="'+(lastIndex+i)+'">'+(lastIndex+i)+'</a>');	
				$("#nextPage").before('<a href="javascript:goPage('+(lastIndex+i)+');" pi="'+(lastIndex+i)+'">'+(lastIndex+i)+'</a>');
			}
			$("#nextPage").before('<a class="current" href="javascript:goPage('+pn+');" pi="'+pn+'">'+pn+'</a>');				
		}
		if(pn < firstIndex){			
			var sp = firstIndex - pn;			
			if((9-sp) <= 0){
				$("#pagination > a[pi]").remove();
			}else{
				$("#pagination > a[pi]:gt("+(9-sp)+")").remove();	
			}			
			for(var i = 1; i < sp; i++){
				$("#prePage").after('<a href="javascript:goPage('+(firstIndex-i)+');" pi="'+(firstIndex-i)+'">'+(firstIndex-i)+'</a>');	
			}
			$("#prePage").after('<a class="current" href="javascript:goPage('+pn+');" pi="'+pn+'">'+pn+'</a>');	
		}
	}
	function searchLine(){
		$("#queryForm").submit();
	}
	</script>
</head>
<body class="layout">

	<%@include file="/shop/header.jsp" %>
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
		<div id="alp-nav">
			<div class="screen">
				<ul><!--indexLink等××Link用于控制是否是当前页面和Li的name名字+link-->
                  <li name="index"><a aliclickinited="true" id="indexLink" href="http://56.1688.com/" target="_blank" aliclickkey="itu_tran_index_index">首页</a></li>
					<li class="" name="mine"><a aliclickinited="true" id="mineLink" href="http://56.1688.com/order/index.htm" target="_blank" aliclickkey="itu_tran_index_my56">我的物流</a></li>
					<li class="" name="fillOrder"><a aliclickinited="true" href="http://56.1688.com/order/fill_order.htm" target="_blank" aliclickkey="56_itu_tran_index_create">我要发货</a><i class="t-n"></i></li>
					<!--<li name="lingdanLink"><a id="lingdanLink" href='' target="_blank" aliclickkey="56_itu_tran_index_lingdan">零担快运</a></li>-->
					<li class="current" name="estimatePrice"><a aliclickinited="true" id="estimatePriceLink" href="http://56.1688.com/order/price/estimate_price.htm" target="_self" aliclickkey="56_itu_tran_index_price">查询线路</a></li>
					<li class="" name="zhuanxianLink" id="zhuanxian">
                      <a href="http://56.1688.com/zhuanxian" id="zhuanxianLink" target="_blank" class="img"></a>
                <a aliclickinited="true" href="http://56.1688.com/zhuanxian" target="_blank" class="hide" aliclickkey="56_itu_tran_index_zhuanxian">直达专线</a>
                <i class="t-c hide">新</i>
                      </li>
					<li name="searchWorkNo"><a aliclickinited="true" id="searchWorkNoLink" href="http://56.1688.com/order/search_work_no.htm" target="_blank" aliclickkey="56_itu_tran_index_network">查询网点</a></li>
					<li name="logisticsTrace"><a aliclickinited="true" id="logisticsTraceLink" href="http://56.1688.com/order/logistics_trace.htm" target="_blank" aliclickkey="56_itu_tran_index_tracing">物流跟踪</a></li>
				</ul>
				<div class="r">
										<a aliclickinited="true" href="http://56.1688.com/zhaoshang" target="_blank" aliclickkey="itu_tran_index_apply">物流商申请入驻</a>|<a aliclickinited="true" href="http://i56.1688.com/index.htm" target="_blank" aliclickkey="itu_tran_index_enterspp">物流商登录</a>
				</div>
			</div>
		</div>

	<!--/div-->

        <div id="content" class="w952 alp-price-page" style="position:relative;">
    				
				<form action="${ctx}/shop/queryLine.do" method="post" id="queryForm" class="moreRouteSearchDomain">
										<div class="price-query">
							<label>发货地</label> <input class="city_input  inputFocus proCityQueryAll proCitySelAll" id="source-area" name="sourceArea">
							<label>收货地</label> <input class="city_input  inputFocus proCityQueryAll proCitySelAll" id="dest-area" name="destArea">
							<a  action="queryForm" id="price-query-btn" href="javascript:$('#queryForm').submit();" class="alp-btnm-w mgt10" ><span class="inner">查询</span></a>
    						
                            
					</div>
										
               

    <div id="route-list" class="alp-tab m-t-l clr" style="display: block ">
	<span class="orange r lh38 mgr30" style="display: block ">注：在线发货，独享8折起优惠，无需在线支付。请您就近选择线路 ！</span>
	<ul class="tab-title" style="display: block ">
		<li aliclickinited="true" class="alp-btnt-1 current" id="orderLogistics" aliclickkey="56_huoyun_computform"><span class="inner">货运（大件更优惠）</span><a name="tab"></a></li>
		<li aliclickinited="true" class="alp-btnt-1 further-t" id="orderExpress" aliclickkey="itu_tran_computform_tab_express"><span class="inner">快递（小件更便捷）</span></li>	</ul>
				<div class="tab-body">
											<div class="tab-bar">
				            <!-- 根据isHiddenFilterBar参数判断是否显示filter-bar-->
							
							<div class="orderby-bar clr" id="orderbyBar">
								<div aliclickinited="true" class="combobox ui-combobox" style="margin-top:2px;" aliclickkey="itu_tran_computform_tab_byselect">
									<select name="orderBy_name" id="orderBySelect" disabled="disabled" style="display: none;">
		                                <option value="">默认排序</option>
										<option value="wpa">重货单价由低到高</option>
										<option value="wpd" selected="selected">重货单价由高到低</option>
										<option value="vpa">轻货单价由低到高</option>
										<option value="vpd">轻货单价由高到低</option>
										<option value="trtia">运输时效由短到长</option>
										<option value="evalScore">评分由高到低</option>
										<option value="orderCount">成交量由高到低</option>
									</select>
								<input value="wpd" class="field" name="orderBy_name" type="hidden"><input value="重货单价由高到低" class="result" autocomplete="off" maxlength="50" readonly="readonly" type="text"><a class="trigger" href="javascript:;" target="_self" hidefocus="true"></a><div style="display: none; z-index: 1000;" class="ui-combobox-panel"><div class="list fd-clr"><ul><li class="ui-combobox-item">默认排序</li><li class="ui-combobox-item">重货单价由低到高</li><li class="ui-combobox-item ui-combobox-selected">重货单价由高到低</li><li class="ui-combobox-item">轻货单价由低到高</li><li class="ui-combobox-item">轻货单价由高到低</li><li class="ui-combobox-item">运输时效由短到长</li><li class="ui-combobox-item">评分由高到低</li><li class="ui-combobox-item">成交量由高到低</li></ul></div></div></div>
								
		                        <a aliclickinited="true" class="btn-status border  mgr10 current" style="background-color:#fff;color:#333333" name="orderByBtn" rel="weight" rev="wpd" aliclickkey="56_huoyun_paixu_zhonghuojia_computform">重货单价<span class="alp-icon alp-arrow2" id="orderByWeightIcon"></span></a>
								<a aliclickinited="true" class="btn-status border  mgr10" style="background-color:#fff;color:#333333" name="orderByBtn" rel="volume" rev="" aliclickkey="56_huoyun_paixu_qinghuojia_computform">轻货单价<span class="alp-icon alp-arrow3" id="orderByVolumeIcon"></span></a>
								<a aliclickinited="true" class="btn-status border  mgr432" style="background-color:#fff;color:#333333" name="orderByBtn" rel="tranTime" rev="" aliclickkey="56_huoyun_paixu_shixiao_computform">运输时效<span class="alp-icon  alp-arrow24" id="orderByTranTimeIcon"></span></a>
								<a aliclickinited="true" class="btn-status border  mgr10" style="background-color:#fff;color:#333333" name="orderByBtn" rel="evalScore" rev="" aliclickkey="56_huoyun_paixu_pingfen_computform">评分<span class="alp-icon alp-arrow23" id="orderByEvalScoreIcon"></span></a>
								<a aliclickinited="true" class="btn-status border  mgr10" style="background-color:#fff;color:#333333" name="orderByBtn" rel="orderCount" rev="" aliclickkey="56_huoyun_paixu_chengjiao_computform">成交量<span class="alp-icon alp-arrow23" id="orderByOrderCountIcon"></span></a>
								<span style="position:absolute;right:10px;height:28px;line-height:28px;">
									共找到<span style="font-weight:bold;color:#FF7300">139</span>个物流公司，
									<span style="font-weight:bold;color:#FF7300">${page.totalCount}</span>条线路
								</span>
							</div>
							
							<!-- 最近发过货的物流公司线路 -->
							                            <div id="nearestCorpRoute" style="z-index:1">
                                <span id="nearestCorpRouteSpan" class="mgl10"></span>
							</div>
						
					</div>
										
				<!-- 没有公司的情况 -->
				<!-- incompleteAddress 为true时表示来自交易的信息不全，就不查询线路信息，提示用户进行信息的完善，而不是提示线路不存在 -->
					<table class="alp-table lt-table alp-tlist-l lh24">
					<tbody id="pageList">
					<c:forEach items="${page.result}" var="item" varStatus="status">
						<tr class="iterable">						
                		    <td style="padding:0 10px;" width="160">${item.logShop.shortName} </td>
                			<td style="padding-left:10px;" width="200">
								<div style="height: 55px; padding-top: 12px;" class="position-r full-div">
									<span class="gray weight-normal">从：</span><span class="weight-bold">${item.shipCity} </span><span class="gray"> (<a  href="#" target="_blank" >查看网点</a>)</span>
									<br><span class="gray weight-normal">到：</span><span class="weight-bold">${item.recCity}</span><span class="gray"> (<a href="#" target="_blank" >查看网点</a>)</span><br>
								</div>
                			</td>
                			<td class="ar" width="100">
                                <span class="orange weight-bold">${item.tranDays}天</span><br>${item.transType} <br></td>
                            <td class="gray6" style="padding-left:30px;color:#333;" width="200">
								<p><span class="gray weight-normal">重货：</span><span class="price"><fmt:formatNumber value="${item.weiPrice}" type="currency" pattern="#.00"/></span> 元/公斤  
																		</p>
                				<p><span class="gray weight-normal">轻货：</span><span><fmt:formatNumber value="${item.ligPrice}" type="currency" pattern="#.00"/></span> 元/立方
																		</p>
                				<p><span class="gray weight-normal">最低一票：</span><fmt:formatNumber value="${item.lowPrice}" type="currency" pattern="#.00"/>元</p>
                			</td>
							<td class="al gray6" width="90"><span class="gray"></span></td>
                		    <td class="iterable" align="center">
    								<a target="_blank" href="#" class="alp-btnm-w b_show_control" style="font-size:12px;margin-bottom:5px;" ><span class="inner ri" style="font-size:12px;">发 货</span>
										</a><br>
							 </td>
						</tr>
					</c:forEach>
					</tbody></table>
                </div>

        <div id="pagebar" class="alp-page">
            <ul class="paging-a fd-clr r" data-sp="paging-a">
            <li id="pagination" class="pagination">
                         
        	</li>
            <li>共<em>${page.totalPages}</em>页 到<input maxlength="4" id="pageIndex" value="${page.pageNo}" type="text">页</li>
            <li><a class="btn-b" href="javascript:goPage(jQuery('#pageIndex').val());">
            <span class="btn-l"><em>确 定</em></span>
            <span class="btn-r"></span></a>
            </li>
            </ul>
			<input value="${page.pageSize}" id="pageSize" type="hidden">
			<input value="${page.pageNo}" id="pageNo" type="hidden">
			<input value="${page.totalPages}" id="totalPages" type="hidden">
        </div>

</div>

</div>
    
    </form>
    <div style="margin-top:7px;text-align: center;font-size:14px">
    	<a href="http://56.1688.com/routes/area-index.htm">全国线路运价</a>：<a href="http://56.1688.com/routes/beijing.htm">北京</a>、<a href="http://56.1688.com/routes/shanghai.htm">上海</a>、<a href="http://56.1688.com/routes/guangzhou.htm">广州</a>、<a href="http://56.1688.com/routes/suzhou320500.htm">苏州</a>、<a href="http://56.1688.com/routes/ningbo.htm">宁波</a>、<a href="http://56.1688.com/routes/dongguan.htm">东莞</a>、<a href="http://56.1688.com/routes/jinhua.htm">金华</a>、<a href="http://56.1688.com/routes/shenzhen.htm">深圳</a>、<a href="http://56.1688.com/routes/zhengzhou.htm">郑州</a>、<a href="http://56.1688.com/routes/zhongshan.htm">中山</a>、<a href="http://56.1688.com/routes/chengdou.htm">成都</a>、<a href="http://56.1688.com/routes/changsha.htm">长沙</a>、<a href="http://56.1688.com/routes/xian610100.htm">西安</a>、<a href="http://56.1688.com/routes/hangzhou.htm">杭州</a>、<a href="http://56.1688.com/routes/tianjin.htm">天津</a>

    </div>	
	
    <%@include file="/shop/footer.jsp" %>
<link rel="stylesheet" href="${ctx}/jqueryui/jarea/theme/layout.css">
<link rel="stylesheet" href="${ctx}/jqueryui/jarea/theme/jquery.jarea.css">	
<script src="${ctx}/jqueryui/jarea/public.js" type="text/javascript"></script>
</body></html>