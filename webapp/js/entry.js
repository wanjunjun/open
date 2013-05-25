function includeScript(file){
	var script='<'+'script type="text/javascript" src="'+file+'"'+'><'+'/script>'; 
	document.writeln(script); 
}

function includeStyle(file){
	var style='<'+'link type="text/css" rel="stylesheet" href="'+file+'"'+' />'; 
	document.writeln(style); 
}
function getWebContext(){
	var strPath=window.document.location.pathname;
	var context=strPath.substring(0,strPath.substr(1).indexOf('/')+1);
	return context;
}
/** include css or js
includeStyle(getWebContext()+"/jqueryui/base/themes/style.css");

includeScript(getWebContext()+"/jqueryui/base/jquery.ui.core.js");
**/