<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
    
    <title>网上发货从这里开始</title>
    
	<script src="${ctx}/js/entry.js" type="text/javascript"></script>
	<script src="${ctx}/js/entry.jquery.js" type="text/javascript"></script>
	
	<link rel="stylesheet" type="text/css" href="${ctx}/jeditor/markitup/skins/markitup/style.css">
	<!--  markItUp! toolbar skin -->
	<link rel="stylesheet" type="text/css" href="${ctx}/jeditor/markitup/sets/default/style.css">	
	<!-- markItUp! -->
	<script type="text/javascript" src="${ctx}/jeditor/markitup/jquery.markitup.js"></script>
	<!-- markItUp! toolbar settings -->
	<script type="text/javascript" src="${ctx}/jeditor/markitup/sets/default/set.js"></script>
	
    <script>
    $(document).ready(function(){    	
    	$('#userName').markItUp(mySettings);				
    });
    function test(){
    	var c = $("#userName.markItUpEditor").val();
    	alert(c);
    	$("#tform").submit();
    }
    </script>

</head>
<body data-spm="2176793">
<form action="${ctx}/user/reg.do" method="post" id="tform" >
<textarea id="userName" name="userName" cols="80" rows="20">

</textarea>
<input type="button" value="test" onclick="test()">
</form>
</body>
</html>