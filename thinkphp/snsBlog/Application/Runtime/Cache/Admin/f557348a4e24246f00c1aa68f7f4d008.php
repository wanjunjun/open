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
<form id="form1" action="/wp/snsBlog/admin/index/captureSave.shtml" method="post">
<input type="hidden" name="url" value="<?php echo ($url); ?>">
<div style="height:20px;"></div>
<div style="margin-left:10px; ">
	<div style="float:left;width:260px;"><img src="<?php echo ($url); ?>"/></div>

	<div style="float:left;width:260px;">
		<textarea name="introduce" class="xsArea fwA01" style="width:240px;"></textarea>
		<input type="submit" value="采下来">
	</div>
</div>
</form>
</body>
</html>
<script type="text/javascript">
	$(function () {
		
    });

	
</script>