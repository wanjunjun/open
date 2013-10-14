function clickPage(tag){
	var n = document.getElementById("offerSet").value;
	var x = document.getElementById("showOfferSet").value;
	if(tag=='1'){
		n= parseInt(n)+1;
		x= parseInt(x)+1;
	}else{
		n= parseInt(n)-1;
		x= parseInt(x)-1;
	}
	document.getElementById("offerSet").value = n;
	document.getElementById("showOfferSet").value = x;
	document.getElementById("pageCommit").click();
}
function clickGo() {
    var n = document.getElementById("offerSet").value;
    var x = document.getElementById("showOfferSet").value;
    var pageSize = document.getElementById("pageSize").value;
    var patrn=/^[0-9]{1,20}$/;
    if (parseInt(x) == 0) {
    	document.getElementById("offerSet").value=0;
    }
    else if (!patrn.exec(x)){
        document.getElementById("offerSet").value=0;
    } else if(parseInt(x) > parseInt(pageSize)) {
        document.getElementById("offerSet").value = parseInt(pageSize)-1;
    } else {
        document.getElementById("offerSet").value = parseInt(x)-1;
    }
    document.forms[0].submit();
}