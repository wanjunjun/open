<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml"><head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>我的运单</title>
	
	<link rel="stylesheet" href="${ctx}/shop/css/standard-v0.css">
	<link rel="stylesheet" href="${ctx}/shop/css/fdev-float.css">
	<link rel="stylesheet" href="${ctx}/shop/css/standard-v4-min.css">
	<link rel="stylesheet" href="${ctx}/shop/css/alp-min.css">
	
</head>
<body class="layout">	
    
	<%@include file="/shop/header.jsp" %>
	
		<%@include file="/WEB-INF/views/shop/homeNav.jsp" %>


<div id="content" class="w952 alp-mine-orders">
	<div class="grid-4 mgt10">
	<ul class="alp-sidenav">
		<!--记住，这个Menu的名字，应该是app名字+Menu -->
		<li><a aliclickinited="true" id="fillOrderMenu" target="_blank" href="http://56.1688.com/order/fill_order.htm" aliclickkey="left_itu_tran_index_create">我要发货</a></li>
		<li><a aliclickinited="true" class="currnt" id="logisticsManageMenu" target="_self" href="http://56.1688.com/order/logistics_manage.htm" aliclickkey="itu_tran_index_manage">我的运单</a></li>
		<li><a aliclickinited="true" id="insuranceManageMenu" target="_self" href="http://56.1688.com/order/transportInsurance/insurance_manage.htm" aliclickkey="itu_tran_index_insurance">我的保险</a></li>
		<li><a aliclickinited="true" id="evaluateManageMenu" target="_self" href="http://56.1688.com/order/evaluate/evaluate_manage.htm" aliclickkey="itu_tran_index_evaluation">我的评价</a></li>
		<li><a aliclickinited="true" id="receiverManageMenu" target="_self" href="http://56.1688.com/order/contact/contact_manage.htm" aliclickkey="itu_tran_index_linkmanN">通讯录</a></li>
		<li><a aliclickinited="true" id="printIndexMenu" target="_self" href="http://56.1688.com/order/print/print_index.htm" aliclickkey="itu_tran_index_print">打印快递单</a></li>
		<li><a aliclickinited="true" id="complaintManageMenu" target="_self" href="http://56.1688.com/order/complaint/complaint_list.htm" aliclickkey="itu_tran_complaintfrom_index">我的投诉</a></li>
		<li id="librokerTab" style="display:none"><a aliclickinited="true" id="brokerManageMenu" target="_self" href="http://56.1688.com/order/broker/index.htm" aliclickkey="56_wuliuke_alp_menu">物流客推广</a></li>
	</ul>
	<input id="downloadURL" value="http://56.1688.com/home/shortcut.do" type="hidden">
	<a aliclickinited="true" title="下载快捷入口" aliclickkey="itu_tran_index_shortcut" class="mgt10 alp-download" href="javascript:CommitOrderApp._download();"></a>
	
	<div class="mgt10">
		<div class="alp-help-info" id="alp-help-info">
<div style="margin:8px;">
<a href="http://club.1688.com/forum/thread/view/33_29567168_.html?tracelog=56_main_gd_20120229" target="_blank" class="r blue">更多</a>
         <span class="em">发货秘笈</span>
         <ul>   <li><span class="alp-square mgt10 l">&nbsp;</span><a href="http://club.1688.com/forum/thread/view/33_29566914_.html?&amp;tracelog=56_yinliu_fhmj_20120315" title="线上下价格不一…？" target="_blank">线上下价格不一…？</a></li>
            <li><span class="alp-square mgt10 l">&nbsp;</span><a href="http://club.1688.com/forum/thread/view/33_29566933_.html?t=tp&amp;tracelog=56_yinliu_fhmj_20120315" title="货物破损丢失怎么办？" target="_blank">货物破损丢失怎么办？</a></li>
            <li><span class="alp-square mgt10 l">&nbsp;</span><a href="http://club.1688.com/forum/thread/view/33_29566969_.html?&amp;tracelog=56_yinliu_fhmj_20120315" title="无人揽货怎么办？" target="_blank">无人揽货怎么办？</a></li>
            <li><span class="alp-square mgt10 l">&nbsp;</span><a href="http://club.1688.com/forum/thread/view/33_29567004_.html?&amp;tracelog=tracelog=56_yinliu_fhmj_20120315" title="特殊物品承运的规定？" target="_blank">特殊物品承运的规定？</a></li>
           <li><span class="alp-square mgt10 l">&nbsp;</span><a href="http://club.1688.com/threadview/29567081.html?&amp;tracelog=56_yinliu_fhmj_20130402" title="没有找到需要的线路？" target="_blank">没有找到需要的线路？</a></li>  
         </ul>
</div>
</div>
	</div>

</div>


<input value="http://56.1688.com/order/broker/broker_tab.do" id="brokerTab" type="hidden">

	<div class="lt-tab grid-20 mgt10 grid-fixed" id="order-tab">
		<div class="lt-tab-head">
    		<input id="defaultTab" value="0" type="hidden">	
    		<div class="inner lt-tab-m">
				<a bptab="0" href="#" class="lt-tab-t duckgray current" tab="0">我发出的运单</a>
				<a aliclickinited="true" bptab="1" href="#" class="lt-tab-t duckgray" tab="1" aliclickkey="itu_tran_myorder_rec_tab">我收到的运单</a>
    		</div>
    	</div>
		<div class="lt-tab-body lt-tab-body-0" style="display: block;">
    		<div class="alp-m-s alp-m-yellow mgb10">
    			<span class="inner">
        			<span class="gray">我的运单提醒：</span>
        			    					<span class="gray">待我评价(0)</span>&nbsp;&nbsp;
    				        			    					<span class="gray">未受理(0)</span>&nbsp;&nbsp;
    				        			    					<span class="gray">已受理(0)</span>&nbsp;&nbsp;
    				        			    					<span class="gray">运输中(0)</span>&nbsp;&nbsp;
    				        			    					<span class="gray">近7天已签收(0)</span>&nbsp;&nbsp;
    				    				    					<span class="gray">待填运单号(0)</span>&nbsp;&nbsp;
    				    			</span>
            </div>
    		<div class="alp-graybluebox search-box">
    			<input id="queryOrdersUrl" value="http://56.1688.com/order/query_logistics_orders.htm" type="hidden">		
    			<input id="deleteOrdersUrl" value="http://56.1688.com/order/delete_order.do" type="hidden">	
    			<input id="cancelOrderUrl" value="http://56.1688.com/order/cancel_order.do" type="hidden">	
				<input id="remindOrderUrl" value="http://56.1688.com/order/remind_order.do" type="hidden">	
    			<input id="logisticsCorpPar" value="" type="hidden">
    			<input id="statusPar" value="" type="hidden">
    			<input id="receiverNamePar" value="" type="hidden">
    			<input id="logisticsIdPar" value="" type="hidden">
    			<input id="mailNoPar" value="" type="hidden">
    			<input id="startTimePar" value="2013-07-26" type="hidden">
    			<input id="endTimePar" value="" type="hidden">
    			<input id="sourcePar" value="" type="hidden">
                <table cellspacing="0" width="100%">
                    <tbody><tr>
    					<td class="title">物流公司</td>
    					<td class="input">
    						<div id="logisticsCorp_switch" class="combobox ui-combobox"><input value="" class="field" name="logisticsCorp" type="hidden"><input value="全部" class="result" autocomplete="off" maxlength="50" readonly="readonly" type="text"><a class="trigger" href="javascript:;" target="_self" hidefocus="true"></a><div style="display: none; z-index: 1000;" class="ui-combobox-panel"><div class="list fd-clr"><ul><li class="ui-combobox-item ui-combobox-selected">全部</li></ul></div></div></div>
        					<select style="display: none;" disabled="disabled" name="logisticsCorp" id="logisticsCorp" default="" request="http://56.1688.com/order/a_j_get_logistic_corps_by_user.do">
        						<option selected="selected" value="">全部</option>
                            </select>
        				</td>
    					<td class="title">运单状态</td>
        				<td class="input">
    						<div id="status_switch" class="combobox ui-combobox"><input value="" class="field" name="status" type="hidden"><input value="全部" class="result" autocomplete="off" maxlength="50" readonly="readonly" type="text"><a class="trigger" href="javascript:;" target="_self" hidefocus="true"></a><div style="display: none; z-index: 1000;" class="ui-combobox-panel"><div class="list fd-clr"><ul><li class="ui-combobox-item ui-combobox-selected">全部</li><li class="ui-combobox-item">未受理</li><li class="ui-combobox-item">已受理</li><li class="ui-combobox-item">运输中</li><li class="ui-combobox-item">已签收</li><li class="ui-combobox-item">已撤销</li><li class="ui-combobox-item">揽件失败</li><li class="ui-combobox-item">签收异常</li></ul></div></div></div>
        					<select style="display: none;" disabled="disabled" name="status" id="status">
                        		<option selected="selected" value="">全部</option>
                        		<option value="WAITACCEPT">未受理</option>
                        		<option value="ACCEPT">已受理</option>
                        		<option value="TRANSPORT">运输中</option>
                        		<option value="SIGN">已签收</option>
                        		<option value="CANCEL">已撤销</option>
                        		<option value="NOGET">揽件失败</option>
                        		<option value="UNSIGN">签收异常</option>
                            </select>
        				</td>
        				<td class="title">收货方</td>
        				<td class="">
        					<input class="gray" rel="auto_input" defaultvalue="公司或联系人" maxlength="200" value="公司或联系人" emptytext="公司或联系人" name="receiverName" id="receiverName" style="width:180px" type="text">
        				</td>
        				<td rowspan="2" valign="center"><span class="alp-icon alp-spliter-l" style="margin-right:10px;display:inline-block;"></span><a aliclickinited="true" class="alp-btnm-w mgt10" aliclickkey="itu_tran_manageform_search" href="javascript:;" id="price-query-btn" action="queryForm"><span class="inner">查询</span></a></td>
    				</tr>
    				<tr>
        		        <td class="title">物流编号</td>
        				<td class="input">
        					<input maxlength="200" name="logisticsId" id="logisticsId" type="text">
        				</td>
        		        <td class="title">运单号</td>
        				<td class="input">
        					<input maxlength="200" name="mailNo" id="mailNo" type="text">
        				</td>
        				<td class="title">创建时间</td>
        				<td class="">
                            <table width="182"><tbody><tr><td><input readonly="readonly" id="startTime" name="startTime" value="2013-07-26" style="width:80px;" type="text"></td><td> 至 </td><td><input readonly="readonly" id="endTime" name="endTime" value="2013-10-24" tyle="text" style="width:80px;"></td></tr></tbody></table>
        				</td>
        		    </tr>
    			</tbody></table>
    		</div>	
			<div id="order-box">
<input id="pageIndex" value="1" type="hidden">
<input id="pageCount" value="0" type="hidden">
<input id="recordCount" value="0" type="hidden">
<input id="pageSize" value="15" type="hidden">

<input id="add_mailno_csrfRenderUrl" value="http://56.1688.com/order/csrf_render.do" type="hidden">
<input id="add_mailno_save_url" value="http://56.1688.com/order/express/save_mail_no.do" type="hidden">
<table id="order-table" class="alp-table alp-tlist" cellpadding="0" cellspacing="0">
	<thead class="thead">
		<tr>
			<th align="left" width="102">物流编号/运单号</th>
			<th align="left" width="76">物流公司</th>
			<th align="left" width="84">货物名称/收货方</th>
			<th align="left" width="">费用</th>
			<th align="left" width="64">创建时间</th>
			<th align="left" width="50">运单状态</th>
			<th align="left" width="92">操作</th>
		</tr>
	</thead>
			<tbody id="order-list" class="result-msg">
        <tr>
			<td colspan="8" style="padding:0;" align="center" valign="center">
				<div class="lt-m-m lt-m-blue" style="padding:50px 50px 50px 200px; text-align:left;">
                    <i class="alp-icon-info alp-info48"></i> 
                    <div class="inner">
                        <div class="title">
															您还没有发货记录，赶紧行动吧！
    							<ul>
                                    <li><a aliclickinited="true" aliclickkey="itu_tran_manageform_create" target="_blank" href="http://56.1688.com/order/fill_order.htm" class="blue">立刻发货</a></li>
    								<li><a aliclickinited="true" aliclickkey="itu_tran_manageform_price" target="_blank" href="http://56.1688.com/order/price/estimate_price.htm" class="blue">去查询线路运价再发货</a></li>
    							</ul>    	
						</div>		                          	
                    </div>
                    <div class="c"></div>
                </div>		
            </td>
		</tr>
    </tbody>		
	
</table></div>
		</div>
		<div class="lt-tab-body alp-mine-receiver-orders lt-tab-body-1" style="display:none">
			<div class="alp-graybluebox search-box">
				<input id="queryReceiverOrdersUrl" value="http://56.1688.com/order/query_receiver_orders.htm" type="hidden">
				<table cellspacing="0" width="100%">
                    <tbody><tr>
    					<td class="title">物流编号</td>
        				<td class="input">
        					<input maxlength="200" name="logisticsId" id="receiver_logisticsId" type="text">
        				</td>
    					<td class="title">运单号</td>
        				<td class="input">
        					<input maxlength="200" name="mailNo" id="receiver_mailNo" type="text">
        				</td>
						<td class="title">发货方</td>
        				<td class="input">
        					<input class="gray" value="公司或联系人" rel="auto_input" defaultvalue="公司或联系人" maxlength="200" emptytext="公司或联系人" name="senderName" id="receiver_senderName" type="text">
        				</td>
    					<td class="title">状态</td>
        				<td style="width:100px;">
    						<div id="receiver_order_status" class="combobox ui-combobox"></div>
        					<select name="status" id="receiver_status">
                        		<option selected="selected" value="">全部</option>
                        		<option value="TRANSPORT">运输中</option>
                        		<option value="SIGN">已签收</option>
                        		<option value="UNSIGN">签收异常</option>
                            </select>
        				</td>
        				<td rowspan="2"><span class="alp-icon" style="margin-right:10px;display:inline-block;"></span><a aliclickinited="true" class="alp-btnm-w" aliclickkey="itu_tran_myorder_rec_search" href="javascript:;" id="receiverOrder-query-btn"><span class="inner">查询</span></a></td>
    				</tr>
					<tr>
						<td class="title">创建时间</td>
        				<td class="" colspan="7">
                            <table width="182"><tbody><tr><td><input readonly="readonly" id="receiver_startTime" name="startTime" value="2013-04-27" style="width:80px;" type="text"></td><td> 至 </td><td><input readonly="readonly" id="receiver_endTime" name="endTime" value="2013-10-24" tyle="text" style="width:80px;"></td></tr></tbody></table>
        				</td>
                    </tr>
    			</tbody></table>
			</div>
			<div id="receiver-order-box">
				
			</div>
		</div>
		<div id="load-data" class="lt-m-m lt-m-blue it-m-m-wait hide" style="text-align:center;">
        	<i class="alp-i48-loading"></i>等待中...
        </div>
        <div class="msg-loading mgt20 hide"><i class="alp-i48-loading"></i><span class="black size-14 weight-bold">数据加载中</span></div>
	</div>
</div>	
    <%@include file="/shop/footer.jsp" %>	
	</body>
</html>