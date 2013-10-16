<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>大隆物流 - 服务网点查询、营业厅查询 -- 阿里巴巴物流平台56.1688.com-网上发货从这里开始</title>

<link rel="stylesheet" type="text/css" href="${ctx}/shop/css/g.css">
<link rel="stylesheet" type="text/css" href="${ctx}/shop/css/c.css">
<link rel="stylesheet" type="text/css" href="${ctx}/shop/css/p_002.css">
<link rel="stylesheet" type="text/css" href="${ctx}/shop/css/portal.css">
<link rel="stylesheet" type="text/css" href="${ctx}/shop/css/alp-min.css">

</head>
<body>
<%@include file="/shop/enterprise/header.jsp" %>
<div class="main">
<div class="subHead">
			<img src="net_intro_files/987631493_1682843553.jpg" alt="大隆物流 LOGO" title="大隆物流 LOGO" style="height:28px;">
		<div class="corpName">
		大隆物流
			</div>
	<span>服务电话：4007-007-147 </span>
</div>
	<ul id="menu">
		<li id="index" name="menuHeader" class=""><a href="http://56.1688.com/corp-B2B-1771892786239/"><strong>首页</strong></a></li>
		<li id="introdution" name="menuHeader"><a href="http://56.1688.com/corp-B2B-1771892786239/introduction.htm"><strong>公司介绍</strong></a></li>
		<li class="curMenu" id="network" name="menuHeader"><a href="http://56.1688.com/corp-B2B-1771892786239/search_network.htm"><strong>网点介绍</strong></a></li>
		<li id="route" name="menuHeader"><a href="http://56.1688.com/corp-B2B-1771892786239/search_routes.htm"><strong>线路运价</strong></a></li>
		<li id="rate" name="menuHeader"><a href="http://56.1688.com/corp-B2B-1771892786239/corpRate.htm"><strong>店铺评分</strong></a><i class="alp-tmp-icon alp-tmp-new" style="position:absolute;top:-8px;right:8px;"></i></li>
		<li id="product" name="menuHeader"><a href="http://56.1688.com/corp-B2B-1771892786239/product.htm"><strong>产品及服务</strong></a></li>
		<li id="contact" name="menuHeader"><a href="http://56.1688.com/corp-B2B-1771892786239/contact.htm"><strong>联系我们</strong></a></li>
	</ul>
</div>

<div class="main" style="overflow:visible">
<%@include file="/shop/enterprise/left.jsp" %> 
<div class="right">

<h1 class="p-m FS16 B">
	大隆物流 营业网点
</h1>
<div class="content" style="width:748px;">
	<form action="http://56.1688.com/corp-B2B-1771892786239/search_network.htm" method="post">
				<div class="SearchOrder">
    		<div class="SearchOrder-hd"> 
    			<table class="SH_TABLE" cellspacing="0">
    			    <tbody><tr>
    			       <td>
						<span rel="con_address" class="con_address">
                        省份：
                        	<select rel="province" name="_fm.se._0.p" value="" id="area_select_province" style="width:120px" onchange="onChangeSelect(this)">
                        		<option selected="selected" value="" rel="template">请选择</option>
                        		                        			                            			<option value="340000">安徽省</option>
                        			                        		                        			                            			<option value="820000">澳门特别行政区</option>
                        			                        		                        			                            			<option value="110000">北京</option>
                        			                        		                        			                            			<option value="500000">重庆</option>
                        			                        		                        			                            			<option value="350000">福建省</option>
                        			                        		                        			                            			<option value="620000">甘肃省</option>
                        			                        		                        			                            			<option value="440000">广东省</option>
                        			                        		                        			                            			<option value="450000">广西壮族自治区</option>
                        			                        		                        			                            			<option value="520000">贵州省</option>
                        			                        		                        			                            			<option value="460000">海南省</option>
                        			                        		                        			                            			<option value="990000">海外</option>
                        			                        		                        			                            			<option value="130000">河北省</option>
                        			                        		                        			                            			<option value="230000">黑龙江省</option>
                        			                        		                        			                            			<option value="410000">河南省</option>
                        			                        		                        			                            			<option value="420000">湖北省</option>
                        			                        		                        			                            			<option value="430000">湖南省</option>
                        			                        		                        			                            			<option value="320000">江苏省</option>
                        			                        		                        			                            			<option value="360000">江西省</option>
                        			                        		                        			                            			<option value="220000">吉林省</option>
                        			                        		                        			                            			<option value="210000">辽宁省</option>
                        			                        		                        			                            			<option value="150000">内蒙古自治区</option>
                        			                        		                        			                            			<option value="640000">宁夏回族自治区</option>
                        			                        		                        			                            			<option value="630000">青海省</option>
                        			                        		                        			                            			<option value="370000">山东省</option>
                        			                        		                        			                            			<option value="310000">上海</option>
                        			                        		                        			                            			<option value="610000">陕西省</option>
                        			                        		                        			                            			<option value="140000">山西省</option>
                        			                        		                        			                            			<option value="510000">四川省</option>
                        			                        		                        			                            			<option value="710000">台湾省</option>
                        			                        		                        			                            			<option value="120000">天津</option>
                        			                        		                        			                            			<option value="810000">香港特别行政区</option>
                        			                        		                        			                            			<option value="650000">新疆维吾尔自治区</option>
                        			                        		                        			                            			<option value="540000">西藏自治区</option>
                        			                        		                        			                            			<option value="530000">云南省</option>
                        			                        		                        			                            			<option value="330000">浙江省</option>
                        			                        		                        	</select>
							<input id="hidden_searchnetwork_provinceName" name="_fm.se._0.pr" value="" type="hidden">
                        &nbsp;
                        城市：
                        	<select rel="city" name="_fm.se._0.c" value="" id="area_select_city" onchange="onChangeSelectCity(this)" style="width:120px">
                        		<option selected="selected" value="" rel="template">请选择</option>
                        		                        	</select>
							<input id="hidden_searchnetwork_cityName" name="_fm.se._0.ci" value="" type="hidden">
                        &nbsp;
                        </span>
    				   </td>
    					<td class="inp">
    						<input class="INP_text" style="width:140px;" name="_fm.se._0.s" value="请输入网点名称或地址" emptytext="请输入网点名称或地址" id="networkName" type="text">
    					</td>
    					<td class="sh">
							<input name="" class="b_search" value="" id="ls_search" style="border:0px" type="submit">
						</td>
    				</tr>
    			</tbody></table>
    		</div>
		</div>
	<div class="recoLine">
	    	<table class="dataGrid">
			<thead>
    		<tr>					
    			<th>网点名称</th>
    			<th>地址</th>
    			<th>联系电话</th>
    			<th>业务内容</th>
    		</tr>
            </thead>
			<tbody>
    		    		<tr>
    			<td>
					<a title="网点详情" href="http://56.1688.com/corp-b2b-1771892786239/network-303031.htm">广州市白云区</a>
				</td>
    			<td>
                    太和镇沙太北路399号
    			</td>
    			<td><span title="联系电话:4007007147 ">4007007147</span></td>
    			<td width="160px">接货、派送</td>
            </tr>
    		    		<tr>
    			<td>
					<a title="网点详情" href="http://56.1688.com/corp-b2b-1771892786239/network-475A5F53494A494E47.htm">石井站</a>
				</td>
    			<td>
                    石井琪丰运物流园B1栋103A
    			</td>
    			<td><span title="联系电话:4007007147 ">4007007147</span></td>
    			<td width="160px">接货、派送</td>
            </tr>
    		    		<tr>
    			<td>
					<a title="网点详情" href="http://56.1688.com/corp-b2b-1771892786239/network-475A5F50414E5955.htm">番禺站</a>
				</td>
    			<td>
                    番禺大道北华圣物流园25栋5号
    			</td>
    			<td><span title="联系电话:4007007147 ">4007007147</span></td>
    			<td width="160px">接货、派送</td>
            </tr>
    		    		<tr>
    			<td>
					<a title="网点详情" href="http://56.1688.com/corp-b2b-1771892786239/network-44475F48554D454E47.htm">虎门站</a>
				</td>
    			<td>
                    虎门镇陈村南区五巷
    			</td>
    			<td><span title="联系电话:4007007147 ">4007007147</span></td>
    			<td width="160px">接货、派送</td>
            </tr>
    		    		<tr>
    			<td>
					<a title="网点详情" href="http://56.1688.com/corp-b2b-1771892786239/network-44475F48454E474C49.htm">横沥站</a>
				</td>
    			<td>
                    横沥区石鼓龙骏货运市场B区31档
    			</td>
    			<td><span title="联系电话:4007007147 ">4007007147</span></td>
    			<td width="160px">接货、派送</td>
            </tr>
    		    		<tr>
    			<td>
					<a title="网点详情" href="http://56.1688.com/corp-b2b-1771892786239/network-44475F4E414E4348454E47.htm">南城站</a>
				</td>
    			<td>
                    南城区石鼓龙骏货运市场B区31档
    			</td>
    			<td><span title="联系电话:4007007147 ">4007007147</span></td>
    			<td width="160px">接货、派送</td>
            </tr>
    		    		<tr>
    			<td>
					<a title="网点详情" href="http://56.1688.com/corp-b2b-1771892786239/network-44475F46454E4747414E47.htm">凤岗站</a>
				</td>
    			<td>
                    凤岗竹塘侵校塘村
    			</td>
    			<td><span title="联系电话:4007007147 ">4007007147</span></td>
    			<td width="160px">接货、派送</td>
            </tr>
    		    		<tr>
    			<td>
					<a title="网点详情" href="http://56.1688.com/corp-b2b-1771892786239/network-485A5F48554959414E.htm">惠阳站</a>
				</td>
    			<td>
                    河南岸惠淡大道边南山花园首层
    			</td>
    			<td><span title="联系电话:4007007147 ">4007007147</span></td>
    			<td width="160px">接货、派送</td>
            </tr>
    		    		<tr>
    			<td>
					<a title="网点详情" href="http://56.1688.com/corp-b2b-1771892786239/network-535A5F42554A49.htm">布吉站</a>
				</td>
    			<td>
                    布吉镇丹竹头金鹏物流园B区八栋十四号
    			</td>
    			<td><span title="联系电话:4007007147 ">4007007147</span></td>
    			<td width="160px">接货、派送</td>
            </tr>
    		    		<tr>
    			<td>
					<a title="网点详情" href="http://56.1688.com/corp-b2b-1771892786239/network-535A5F42414F414E.htm">宝安站</a>
				</td>
    			<td>
                    龙华街道民治大道华通源物流园C3120档
    			</td>
    			<td><span title="联系电话:4007007147 ">4007007147</span></td>
    			<td width="160px">接货、派送</td>
            </tr>
    		            </tbody>
        </table>
    	<input id="pageSize" value="2" type="hidden">
		<div class="pages" id="pages" align="right">
						 第1页/共2页
			
																<a id="nextPage" href="http://56.1688.com/corp-b2b-1771892786239/search_network-p1.htm">下一页</a>
										
						
			<input value="0" name="offerSet" id="offerSet" type="hidden">
			<input value="1" size="3" maxlength="5" id="showOfferSet" type="text">
			<input id="pageCommit" value="确定" style="margin-left:8px" onclick="clickGo()" type="button">
		</div>	
		
		
		</div>
	</form>
</div>

</div>
</div>
<%@include file="/shop/enterprise/footer.jsp" %>
</body>
</html>