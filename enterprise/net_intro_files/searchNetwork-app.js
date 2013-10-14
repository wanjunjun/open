function onChangeSelect(obj) {
	jQuery("#area_select_city").find("option").remove();
	jQuery("#area_select_city").prepend("<option value='' rel='template'>请选择</option>");
	var v = jQuery(obj).find("option:selected");
	if (v.val()) {
    	jQuery("#hidden_searchnetwork_provinceName").val(v.text());
		jQuery.get('/home/areaJson.do',{provinceId:v.val()},function(data){
			if(data) {
				var c = data.data.cities;
				for ( var i = 0; i < c.length; i++) {
					var city = c[i];
					jQuery("#area_select_city").append("<option value='"+city.id+"' rel='template'>"+ city.name + "</option>");
				}
			}
		});
	} else {
		jQuery("#hidden_searchnetwork_provinceName").val("");
	}
}

function onChangeSelectCity(obj) {
	var v = jQuery(obj).find("option:selected");
	if(v.val()){
		jQuery("#hidden_searchnetwork_cityName").val(v.text());
	} else {
		jQuery("#hidden_searchnetwork_cityName").val("");
	}
}

/**
 * 空文本提示	
 */
function inputEmptyText(obj,tips){
	obj.focus(function(){
		var v=obj.val();
		if(v==tips){
			obj.val("");
		}
	});
	obj.blur(function(){
		var v=obj.val();
		if(v==""){
			obj.val(tips);
		}
	})
}

jQuery(document).ready(function(){
	selectDefaultMenu("network");
    jQuery("input[emptytext]").each(function(){
    	var obj=jQuery(this);
    	var tips=obj.attr("emptytext");
    	if(!obj.val()) {
        	obj.val(tips);
    	}
    	inputEmptyText(obj,tips);
    });
});
