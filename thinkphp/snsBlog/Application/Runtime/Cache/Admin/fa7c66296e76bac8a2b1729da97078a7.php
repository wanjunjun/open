<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtmBox">
<head>
	<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/wp/snsBlog/Public/css/reset-min.css">
<link rel="stylesheet" type="text/css" href="/wp/snsBlog/Public/css/style.css">
<script type="text/javascript" src="/wp/snsBlog/Public/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/wp/snsBlog/Public/js/Common.js"></script>


	
<title></title>
</head>

<body>
采集成功,<span id="time">5</span>秒后关闭窗口
</body>
</html>
<script type="text/javascript">
	$(function () {
		setInterval("cal()",1000); 
    });

	function cal(){
		var t = parseInt($("#time").text());
		if(t == 1){
			window.close();
		}
		$("#time").text(t-1);
	}
	
</script>