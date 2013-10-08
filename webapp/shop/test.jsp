<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
    
    <title>网上发货从这里开始</title>
      
    <link rel="stylesheet" href="${ctx}/jqueryui/jarea/theme/layout.css">
	<link rel="stylesheet" href="${ctx}/jqueryui/jarea/theme/jquery.jarea.css">
    
	<script src="${ctx}/js/entry.js" type="text/javascript"></script>
	<script src="${ctx}/js/entry.jquery.js" type="text/javascript"></script>
	
    <script>
    $(document).ready(function(){    	
	
				
    });
	
    </script>
     
	  <style type="text/css">
	  	.index .banner ul  {
	        width: 120px;
	    	left: 260px;
	    }
	  </style>



</head>
<body data-spm="2176793">
<input name="" id="start1" type="text"  class="city_input  inputFocus proCityQueryAll proCitySelAll" >
<div class="provinceCityAll">
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


<script src="${ctx}/jqueryui/jarea/public.js" type="text/javascript"></script>
</body>
</html>