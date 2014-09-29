
$(function(){

	/*setInterval(function(){
		alert($("input[name='btnK']").val());
		$("input[name='btnK']").val("google 不搜索");
		$("input[name='btnK']").attr("disabled", true);
	}, 5000);*/
	
	$("input[name='btnK']").val("google 不搜索");
	$("input[name='btnK']").attr("disabled", true);


	$('#bn').click(function () {
	    alert("测试");
	});

	/*Common.ajax("http://sneezryworks.sinaapp.com/ip.php", null, function(data){
		$("#ip").text(data);
	},"text");*/

	/*setInterval(function(){
		var notification = webkitNotifications.createNotification('image/my.jpg', 'Notification Demo', 'Merry Christmas');
		notification.show();
	}, 5000);*/

	
});
