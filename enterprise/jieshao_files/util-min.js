xui.util.Ajax={asyncGET:function(b,c,d){var a=this._createHTTP();a.onreadystatechange=function(){if(a.readyState==4){if(a.status==200){xui.util.Ajax._callback(c,a.responseText)}else{xui.util.Ajax._callback(d,a.responseText)}}};a.open("get",xui.util.Ajax._newURL(b),true);a.send(null)},_iframeCallback:{},_iframeOnload:function(b){try{xui.util.Ajax._callback(xui.util.Ajax._iframeCallback[b],window.frames[b].document.body.innerHTML)}catch(a){}},asyncPOST:function(b,g,c,f){var a=this._createHTTP();a.onreadystatechange=function(){if(a.readyState==4){if(a.status==200){xui.util.Ajax._callback(c,a.responseText)}else{xui.util.Ajax._callback(f,a.responseText)}}};a.open("POST",b,true);a.setRequestHeader("cache-control","no-cache");a.setRequestHeader("CONTENT-TYPE","application/x-www-form-urlencoded;");var e="ts="+new Date().getTime()+"&"+g;a.setRequestHeader("Content-Length",e.length);a.send(e)},asyncPOSTForm:function(a,d,b){var c=typeof d=="string"?$(d):d;var g=$UUID("xaj_");xui.util.Ajax._iframeCallback[g]=b;var e=document.createElement("span");e.style.display="none";e.innerHTML='<iframe id="'+g+'" name="'+g+'" src="javascript:false;" onload="xui.util.Ajax._iframeOnload(this.id);" style="width:0px;height:0px;"></iframe>';document.body.appendChild(e);c.action=a;c.target=g;c.method="post";c.submit()},syncGet:function(b){var a=this._createHTTP();a.open("get",xui.util.Ajax._newURL(b),false);a.setRequestHeader("cache-control","no-cache");a.send(null);if(a.readyState==4){if(a.status==200){return xui.util.Ajax._trim(a.responseText)}else{return null}}},asyncGETProxy:function(attrs,callback){var script=document.createElement("script");script.setAttribute("type","text/javascript");if(attrs.charset){script.setAttribute("charset",attrs.charset)}var url=attrs.url;if(attrs.vName){url+=(url.indexOf("?")>-1?"":"?")+"&_xui_ajax_callback="+attrs.vName}script.src=xui.util.Ajax._newURL(url);if(document.all){script.onreadystatechange=function(){var rs=this.readyState;if("loaded"===rs||"complete"===rs){try{xui.util.Ajax._callback(callback,eval(attrs.vName))}catch(e){}this.onreadystatechange=null;this.parentNode.removeChild(this)}}}else{script.async=true;script.onload=function(){try{xui.util.Ajax._callback(callback,eval(attrs.vName))}catch(e){}this.onreadystatechange=null;this.parentNode.removeChild(this)}}document.body.appendChild(script)},_createHTTP:function(){var a;try{a=new XMLHttpRequest()}catch(b){try{a=new ActiveXObject("Msxml2.XMLHTTP")}catch(b){try{a=new ActiveXObject("Microsoft.XMLHTTP")}catch(b){a=null}}}return a},_newURL:function(a){if(a.indexOf("?")>0){s=a+"&ts="+new Date().getTime()}else{s=a+"?ts="+new Date().getTime()}return s},_callback:function(a,b){if(a){a.call(this,xui.util.Ajax._trim(b))}},_trim:function(a){if(a&&a.length>0){return a.replace(/(^\s*)|(\s*$)/g,"")}return""}};xui.util.Cookie=function(){return{NAME_SPACE:"XUI_COOKIE_",write:function(b,c,a,e){if(!b){return}var d=e?e:"/";var f=a?a.toGMTString():"Tus, 2 Sep 2049 11:11:11 GMT";document.cookie=this.NAME_SPACE+b+"="+escape(""+c)+"; path="+d+"; expires="+f},read:function(b){var c=new RegExp("(^| )"+this.NAME_SPACE+b+"=([^;]*)(;|$)","gi");var a=document.cookie.replace(/(^\s*)|(\s*$)/g,"");var d=c.exec(a);return d?(d[2]==""?null:unescape(d[2])):null},clear:function(a){this.write(a,"")},deleteKey:function(a,d){var e=new Date();e.setTime(e.getTime()-1);var b=xui.util.Cookie.read(a);var c=d?d:"/";xui.util.Cookie.read(a);xui.util.Cookie.write(a,b,e,c)}}}();xui.util.DateUtil={toYYYYMMDD:function(c){var a=(c.getMonth()+1).toString();var b=(c.getDate()).toString();if(a.length<2){a="0"+a}if(b.length<2){b="0"+b}return c.getFullYear()+"-"+a+"-"+b},getYear:function(a){if(xui.lang.isString(a)){return parseInt(a.split("-")[0],10)}return a.getFullYear()},getMonth:function(a){if(xui.lang.isString(a)){return parseInt(a.split("-")[1],10)-1}return a.getMonth()},getMonthDay:function(a){if(xui.lang.isString(a)){return parseInt(a.split("-")[2],10)}return a.getDate()},getHours:function(a){return a.getHours()},getMinutes:function(a){return a.getMinutes()},isYYYYMMDD:function(b){if(!b||typeof b!="string"){return false}if(!(new RegExp(/^(\d{1,4})(-)(\d{1,2})\2(\d{1,2})$/)).test(b)){return false}var e=this.getYear(b);if(e<1970){return false}var a=this.getMonth(b);if(a<0||a>11){return false}var c=this.getMonthDay(b);if(c<1||c>31){return false}return true},toDate:function(a){if(!this.isYYYYMMDD(a)){return null}return new Date(this.getYear(a),this.getMonth(a),this.getMonthDay(a))},compare:function(b,a){if(!b||!a){return null}var d=(typeof b=="string")?this.toDate(b):b;var c=(typeof a=="string")?this.toDate(a):a;return Date.parse(d)-Date.parse(c)},clearTime:function(a){this.parse(a);a.setHours(0);a.setMinutes(0);a.setSeconds(0);a.setMilliseconds(0);return a},clone:function(a){this.parse(a);return new Date(a.getTime())},today:function(){return this.clearTime(new Date())},now:function(){return new Date()},isLeapYear:function(a){return(((a%4===0)&&(a%100!==0))||(a%400===0))},getDaysInMonth:function(a,b){return[31,(this.isLeapYear(a)?29:28),31,30,31,30,31,31,30,31,30,31][b]},_addMs:function(a,b){a.setMilliseconds(a.getMilliseconds()+b);return a},_addSeconds:function(a,b){return this._addMs(a,b*1000)},_addMinutes:function(a,b){return this._addMs(a,b*60000)},_addHours:function(a,b){return this._addMs(a,b*3600000)},_addDays:function(a,b){return this._addMs(a,b*86400000)},_addWeeks:function(a,b){return this._addMs(a,b*604800000)},_addMonths:function(a,b){var c=a.getDate();a.setDate(1);a.setMonth(a.getMonth()+b);a.setDate(Math.min(c,this.getDaysInMonth(a.getFullYear(),a.getMonth())));return a},_addYears:function(a,b){return this._addMonths(a,b*12)},parse:function(v,k){if($type(v)==="string"){k=v}else{if(!k){return v}}k=k.replace(/^\s+|\s+$/g,"");var m=this;var r=/(?:((?:(today|now)|(?:^(\d{4})[-\/](0?[1-9]|1[0-2])[-\/]([0-2][0-9]|3[01]|[0-9])))\s*(?:(?:([01][0-9]|2[0-3]|[0-9])(?:[:]([0-5]?\d))?(?:[:](\d+))?)?)?)?\s*(?:([+-])\s*(\d|\d*.?\d+)\s*([smhDWMY])$)?)?/;var n=function(d){if($type(d)==="string"){return d.replace(/^0/,"")-0}return d};var f=function(d,z,x,y){x=(z==="+")?x:(0-x);switch(y){case"Y":return m._addYears(d,x);break;case"M":return m._addMonths(d,x);break;case"W":return m._addWeeks(d,x);break;case"D":return m._addDays(d,x);break;case"h":return m._addHours(d,x);break;case"m":return m._addMinutes(d,x);break;case"s":return m._addSeconds(d,x);break}};var q=r.exec(k),j=[];if(!r.test(k)||($type(v)!=="date"&&!q[1])){throw new Error("Format error!")}$each(q,function(x,d){if(x===undefined){x=null}else{if(d>3&&d<9){x=n(x)}}j.push(x)});var g=j[2],h=j[3],o=j[4]?(j[4]-1):null,t=j[5],c=j[6],a=j[7],u=j[8],w=j[9],e=j[10],b=j[11];if(j[1]){if(g){var p=null;switch(g){case"now":p=this.now();break;case"today":p=this.today();break}return f(p,w,e,b)}else{if(w){return f(new Date(h,o,t,c,a,u),w,e,b)}else{return new Date(h,o,t,c,a,u)}}}else{return f(v,w,e,b)}},addMs:function(a,b){a=this.parse(a);return addMs(a,b)},addSeconds:function(a,b){a=this.parse(a);return addSeconds(a,b)},addMinutes:function(a,b){a=this.parse(a);return addMinutes(a,b)},addHours:function(a,b){a=this.parse(a);return addHours(a,b)},addDays:function(a,b){a=this.parse(a);return addDays(a,b)},addWeeks:function(a,b){a=this.parse(a);return addWeeks(a,b)},addMonths:function(a,b){a=this.parse(a);return addMonths(a,b)},addYears:function(a,b){a=this.parse(a);return addYears(a,b)},getWeekDays:function(b){var a=this.parse(b).getDay(),c=1;l=7,days=[];for(;c<=l;c++){days.push(this._addDays(this.clone(b),c-a))}return days},isWeekday:function(a){return a.getDay()<6},isBefore:function(a,b){return this.parse(a).getTime()>this.parse(b).getTime()},isAfter:function(a,b){return this.parse(a).getTime()<this.parse(b).getTime()},isEquals:function(b,a){return this.parse(b).getTime()===this.parse(a).getTime()},hasDate:function(d,c){var b=this,f=function(h,k,g){var j=b.parse(h).getTime();k=b.parse(k).getTime();if(g){g=b.parse(g).getTime()}else{return j===k}return j>=k&&j<=g};if($type(c[0])==="array"){var e=0,a=c.length;for(;e<a;e++){if(f(d,c[e][0],c[e][1])){return true}}return false}else{return f(d,c[0],c[1])}}};xui.util.JsonUtil=function(){var useHasOwn={}.hasOwnProperty?true:false;var pad=function(n){return n<10?"0"+n:n};var m={"\b":"\\b","\t":"\\t","\n":"\\n","\f":"\\f","\r":"\\r",'"':'\\"',"\\":"\\\\"};var encodeString=function(s){if(/["\\\x00-\x1f]/.test(s)){return'"'+s.replace(/([\x00-\x1f\\"])/g,function(a,b){var c=m[b];if(c){return c}c=b.charCodeAt();return"\\u00"+Math.floor(c/16).toString(16)+(c%16).toString(16)})+'"'}return'"'+s+'"'};var encodeDate=function(o){return'"'+o.getFullYear()+"-"+pad(o.getMonth()+1)+"-"+pad(o.getDate())+"T"+pad(o.getHours())+":"+pad(o.getMinutes())+":"+pad(o.getSeconds())+'"'};var encodeArray=function(o){var a=["["],b,i,l=o.length,v;for(i=0;i<l;i+=1){v=o[i];switch(typeof v){case"undefined":case"function":case"unknown":break;default:if(b){a.push(",")}a.push(v===null?"null":xui.util.JsonUtil.encode(v));b=true}}a.push("]");return a.join("")};return{decode:function(sJson){return eval("("+sJson+")")},encode:function(o){if(typeof o=="undefined"||o===null){return"null"}else{if(o instanceof Array){return encodeArray(o)}else{if(o instanceof Date){return encodeDate(o)}else{if(typeof o=="string"){return encodeString(o)}else{if(typeof o=="number"){return isFinite(o)?String(o):"null"}else{if(typeof o=="boolean"){return String(o)}else{var a=["{"],b,i,v;for(i in o){if(!useHasOwn||o.hasOwnProperty(i)){v=o[i];switch(typeof v){case"undefined":case"function":case"unknown":break;default:if(b){a.push(",")}a.push(this.encode(i),":",v===null?"null":this.encode(v));b=true}}}a.push("}");return a.join("")}}}}}}}}}();xui.util.Key={backspace:8,tab:9,enter:13,shift:16,ctrl:17,alt:18,pause:19,caps:20,esc:27,pageup:33,pagedown:34,end:35,home:36,left:37,up:38,right:39,down:40,insert:45,"delete":46,f1:112,f2:113,f3:114,f4:115,f5:116,f6:117,f7:118,f8:119,f9:120,f10:121,f11:122,f12:123};xui.util.KeyBoard={initTabIndex:function(c){if(!c){return}for(var b=0,a=c.length;b<a;b++){var d=$(c[b]);if(!d){continue}d.setAttribute("tabIndex",b+1)}},initEnterTab:function(){xui.util.Event.on(document,"keyup",function(){var d=event.keyCode;if(d!=xui.util.Key.enter){return}var f=event.srcElement.tabIndex;if(!f||f<1){f=0}var c=document.getElementsByTagName("*");for(var b=0,a=c.length;b<a;b++){var e=c[b];if(e.tabIndex==(f+1)){e.focus();return}}})},_events0:{},_events1:{},onKey:function(b,a){if(b){this._events0["key_"+b]=a}},onKeyAndCtrl:function(b,a){if(b){this._events1["key_"+b]=a}},initHotKey:function(){xui.util.Event.on(document,"keydown",function(){var a=event.keyCode;if(event.ctrlKey&&(a==78||a==69)){event.returnValue=false}});xui.util.Event.on(document,"keyup",function(){var e=event.keyCode;var c=xui.util.KeyBoard;var d=c._events0["key_"+e];if(d){d.call()}var b=c._events1["key_"+e];if(b&&event.ctrlKey){b.call()}})}};xui.util.NumberUtil={add:function(s1,s2,opt){if(!opt){opt="+"}s1=this.toNumber(s1);s2=this.toNumber(s2);if(this.isInt(s1)&&this.isInt(s2)){return eval("s1"+opt+"s2")}s1=this.toString(s1);s2=this.toString(s2);var m=Math.pow(10,Math.max(this.getDigitsLength(s1),this.getDigitsLength(s2)));var n1=this.multiply(s1,m);var n2=this.multiply(s2,m);return(!opt||opt=="-")?this.divide(n1-n2,m):this.divide(n1+n2,m)},subtract:function(b,a){return this.add(b,a,"-")},_insertString:function(b,a,c){return b.substring(0,c)+a+b.slice(c)},toString:function(p){if(p==null||typeof p=="undefined"){return""}var b=this.toNumber(p);var o=b.toString().toLowerCase();if(o.indexOf("e")<=0){return o}var f=Math.abs(b).toString();var c=f.indexOf(".");var d=f.indexOf("e");var m=f.substring(0,d);var a=f.slice(d+1);if(a==""||a=="+"||a=="-"||this.isZero(a)){return(Math.abs(b)!=b)?"-"+m:m}var k=m.replace(".","").replace(/0/g,"");var j=c<0?0:d-c-1;var h=[];pLen=Math.abs(a);if(this.isPlus(a)){for(var e=0;e<pLen;e++){h.push("0")}k=k+h.join("");if(j>0){k=this._insertString(k,".",k.length-j)}}else{for(var e=0,g=pLen+j;e<g;e++){h.push("0")}k=h.join("")+k;k=this._insertString(k,".",k.length-j-pLen)}k=k.replace(/^0+\./g,"0.");k=k.replace(/0+$/g,"");return(Math.abs(b)!=b)?"-"+k:k},multiply:function(c,b){c=this.toNumber(c);b=this.toNumber(b);if(b==0||c==0){return 0}if(this.isInt(c)&&this.isInt(b)){return c*b}if(c===1){return b}if(b===1){return c}var a=0;c=this.toString(c);b=this.toString(b);try{a+=c.split(".")[1].length}catch(d){}try{a+=b.split(".")[1].length}catch(d){}return Number(c.replace(".",""))*Number(b.replace(".",""))/Math.pow(10,a)},divide:function(e,c){e=this.toNumber(e);c=this.toNumber(c);if(e==0){return 0}if(c==0){alert("\u9664\u6570\u4e0d\u80fd\u4e3a\u96f6");return null}e=this.toString(e);c=this.toString(c);var b=this.getDigitsLength(e);var a=this.getDigitsLength(c);var f=Number(e.replace(".",""));var d=Number(c.replace(".",""));return this.multiply(f/d,Math.pow(10,a-b))},toNumber:function(a){if(!this.isNumber(a)){return 0}if(typeof a=="string"){var b=parseFloat(a.replace(/,/g,""));return isNaN(b)?0:b}else{return Number(a)}},toInt:function(a,b){if(this.isInt(a)){return a}if(!b){b=0}switch(b){case 0:return Math.round(this.toNumber(a));break;case 1:return Math.ceil(this.toNumber(a));break;case 2:return Math.floor(this.toNumber(a));break}},isNumber:function(a){if(a==null||typeof a=="undefined"){return false}if(typeof a=="number"){return true}else{if(typeof a=="string"){if(a.toLowerCase().indexOf("e")>=0){return !isNaN(a)}if(a.indexOf(",")>0){var d=a.lastIndexOf(",");var b=a.lastIndexOf(".");if(d>b&&b>-1){return false}}var c=a.replace(/,/g,"");return(!c||isNaN(c))?false:true}}return false},isFloat:function(a){if(!this.isNumber(a)){return false}a=a.toString();var b=a.replace(/,/g,"");if(b.indexOf(".")>=0){return true}return false},isInt:function(a){if(!this.isNumber(a)){return false}return !this.isFloat(a)},isZero:function(a){if(!this.isNumber(a)){return false}return parseFloat(a)==0},isNegative:function(a){if(!this.isNumber(a)){return false}var b=this.toNumber(a);return !this.isZero(a)&&Math.abs(b)!=b},isPlus:function(a){if(!this.isNumber(a)){return false}var b=this.toNumber(a);return !this.isZero(a)&&Math.abs(b)==b},reverseValue:function(a){if(!this.isNumber(a)){return 0}if(this.isNegative(a)){return this.toNumber(a.toStirng().slice(1))}return this.toNumber("-"+a)},absValue:function(a){if(!this.isNumber(a)){return 0}return Math.abs(a)},getDigitsLength:function(a){if(!this.isNumber(a)){return -1}if(this.isInt(a)){return 0}a=a.toString();var b=a.split(".")[1];return b?b.toString().length:0},getIntegersLength:function(a){if(!this.isNumber(a)){return -1}return this.toInt(a).toString().length},round:function(a,c){if(!this.isNumber(a)){return 0}var b=this.toNumber(a);if(this.isInt(b)){return b}if(!c){c=0}else{if(!this.isInt(c)||c<0){c=3}}return xui.util.NumberUtil.toNumber(b.toFixed(c))},formatMoney:function(n,g,f){if(!this.isNumber(n)){return"0"}if(!g){g="#,###.###"}var a=g.split(".");var j=parseInt(a[1].length);if(f){var e=this.round(n,j).toFixed(j).toString()}else{var e=this.round(n,j).toString()}if(a[0].indexOf(",")>0){var b=false;if(this.isNegative(e)){b=true;e=e.slice(1)}var c=(this.isFloat(e))?e.indexOf("."):e.length;if(c<=j){return e}var d=[];var k=0;var h=c%3;while(h<=e.length){var m=e.slice(k,h);if(m){d[d.length]=m}k=h;if(h==(c-3)){h=e.length}else{h+=3}}return((b)?"-":"")+d.join(",")}return e},calc:function(d,a,c){var b=null;switch(a){case"+":b=this.add(d,c);break;case"-":b=this.subtract(d,c);break;case"*":b=this.multiply(d,c);break;case"\\":b=this.divide(d,c);break}return b},arth:function(){if(arguments==null||arguments.length<=0){return null}var a=null;for(var b=1;b<arguments.length;b=b+2){if(b==1){a=this.calc(arguments[b-1],arguments[b],arguments[b+1])}else{a=this.calc(a,arguments[b],arguments[b+1])}}return a}};xui.util.StringUtil={trim:function(a){if(a&&a.length>0){return a.replace(/(^\s*)|(\s*$)/g,"")}return""},isEmpty:function(a){return(a||a.length>0)?false:true},startsWith:function(b,a){return b&&b.indexOf(a)==0},getChar:function(a,b){return a.substring(b,b+1)},replaceFirstChar:function(b,a){return a+b.slice(1)},getBetweenText:function(b,c,a){return b.substring(b.indexOf(c)+c.length,b.indexOf(a))},getBeforeText:function(b,a){if(b.indexOf(a)<0){return b}return b.substring(0,b.indexOf(a))},toChars:function(c){if(!c||c.length<=0){return null}var a=[];for(var b=0;b<c.length;b++){a[b]=xui.util.StringUtil.getChar(c,b)}return a},parseInt:function(a){a=""+a;return(a&&a.length>0)?parseInt(a,10):0},replaceAll:function(c,b,a){return c.replace(new RegExp(b,"g"),a)},byteLength:function(a){return a.replace(/[^\x00-\xff]/g,"aa").length},replaceCharByPostion:function(b,a,c){return b.substring(0,c-1)+a+b.substring(c)},htmlEncode:function(a){return !a?a:String(a).replace(/&/g,"&amp;").replace(/>/g,"&gt;").replace(/</g,"&lt;").replace(/"/g,"&quot;")},htmlDecode:function(a){return !a?a:String(a).replace(/&gt;/g,">").replace(/&lt;/g,"<").replace(/&quot;/g,'"').replace(/&amp;/g,"&")},stripTags:function(a){if(!a||typeof a!="string"){return""}return a.replace(/<\/?[^>]+>/gi,"")},escapeHTML:function(b){if(!b||typeof b!="string"){return""}var c=document.createElement("div");var a=document.createTextNode(b);c.appendChild(a);return c.innerHTML},unescapeHTML:function(a){if(!a||typeof a!="string"){return""}var b=document.createElement("div");b.innerHTML=this.stripTags(a);return b.childNodes[0]?b.childNodes[0].nodeValue:""},btSub:function(c,b,g){if(c===null||c===""){return""}var e=c.match(/(.{1})/g),a=[],h="",f=0;if(g){h=g}for(var d=0;d<b;d++){a.push(e[f]);f++;if(!/^[\u0000-\u00ff]$/.test(e[f])){d++}}return a.join("")+h}};xui.util.Validator=function(){var REG_EXPRESS={FULLNUMBER:/^\d+$/,EMAIL:/^\w+(((-|&)\w*)|(\.\w+))*\@[A-Za-z0-9]+((\-)[A-Za-z0-9]*|(\.)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/,EMAIL_DOMAIN:/^@[A-Za-z0-9]+((\-)[A-Za-z0-9]*|(\.)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/,YYYY_MM_DD:/^(\d{1,4})(-)(\d{1,2})\2(\d{1,2})$/,HALFANGLE:/^[\u0000-\u00FF]+$/,ENTIREANGLE_CHARS:/^[\uFF00-\uFFFF]+$/,ENTIREANGLE_FULL:/^[\u0391-\uFFE5]+$/,ENGLISH:/^[A-Za-z]+$/,NUMORENG:/^[A-Za-z\d]+$/,IP:/^(0|[1-9]\d?|[0-1]\d{2}|2[0-4]\d|25[0-5]).(0|[1-9]\d?|[0-1]\d{2}|2[0-4]\d|25[0-5]).(0|[1-9]\d?|[0-1]\d{2}|2[0-4]\d|25[0-5]).(0|[1-9]\d?|[0-1]\d{2}|2[0-4]\d|25[0-5])$/};var _validateByReg=function(sStr,sRegexp){sStr=_trim(sStr);if(sStr&&(new RegExp(sRegexp))&&(new RegExp(sRegexp)).test(sStr)){return true}return false};var _trim=function(str){if(str&&str.length>0){return str.replace(/(^\s*)|(\s*$)/g,"")}return""};var _isArray=function(obj){return(typeof obj=="object")&&obj.constructor==Array};var _validateInput=function(ipt,onerror,emptyPassed){var sId,oInput;if(xui.lang.isString(ipt)){sId=ipt;oInput=$(sId)}else{oInput=ipt;sId=ipt.id}var value=xui.util.WinUtil.getInputValue(sId);if(emptyPassed&&(!value||value=="")){return true}var eps=oInput.getAttribute("validate");if(!eps){return true}var rules;try{rules=eval("("+eps+")")}catch(e){alert("[xui-util-Validator]<"+sId+"> error");return}if(!rules){return true}if(!_isArray(rules)){alert("[xui-util-Validator]<"+sId+"> error");return}for(i in rules){var rule=rules[i];if(rule&&rule.check){var is=true;var callback=eval("xui.util.Validator."+rule.check);if(callback&&(typeof callback=="function")){try{is=(rule.format)?callback.call(xui.util.Validator,value,rule.format):callback.call(xui.util.Validator,value)}catch(e){}}if(!is){if(!onerror){return is}try{onerror.call(null,sId,rule,value)}catch(e){alert("[xui-util-Validator]<"+sId+"> error")}return is}}}return true};return{setExpress:function(input,rule){var oInput=(typeof input=="string")?$(input):input;if(oInput){oInput.setAttribute("validate",rule)}},isNotEmpty:function(sStr){if(!sStr||!sStr instanceof String){return false}return sStr.length>0},isEmpty:function(sStr){return !this.isNotEmpty(sStr)},isDate:function(sStr){if(!sStr){return false}return _validateByReg(_trim(sStr),REG_EXPRESS.YYYY_MM_DD)},isEmail:function(sStr){if(!sStr){return false}return _validateByReg(_trim(sStr),REG_EXPRESS.EMAIL)},isEmailDomain:function(sStr){if(!sStr){return false}return _validateByReg(_trim(sStr),REG_EXPRESS.EMAIL_DOMAIN)},isFullNumber:function(sStr){if(!sStr){return false}return _validateByReg(_trim(sStr),REG_EXPRESS.FULLNUMBER)},isNumber:function(sStr){if(!sStr){return false}return xui.util.NumberUtil.isNumber(_trim(sStr))},isPlusNumber:function(sStr){if(!sStr){return false}return xui.util.NumberUtil.isPlus(_trim(sStr))},isNegativeNumber:function(sStr){if(!sStr){return false}return xui.util.NumberUtil.isNegative(_trim(sStr))},isInt:function(sStr){if(!sStr){return false}return xui.util.NumberUtil.isInt(_trim(sStr))},isFloat:function(sStr){if(!sStr){return false}return xui.util.NumberUtil.isFloat(_trim(sStr))},isHalfAngle:function(sStr){if(!sStr){return false}return _validateByReg(sStr,REG_EXPRESS.HALFANGLE)},isFullEntireAngle:function(sStr){if(!sStr){return false}return _validateByReg(sStr,REG_EXPRESS.ENTIREANGLE_FULL)},isFullEntireAngleAndNoChinese:function(sStr){if(!sStr){return false}return _validateByReg(sStr,REG_EXPRESS.ENTIREANGLE_CHARS)},hasEntireAngle:function(sStr){if(!sStr){return false}sStr=_trim(sStr);for(var i=0;i<sStr.length;i++){if(this.isFullEntireAngle(sStr.charAt(i))){return true}}return false},isFormatNumber:function(sStr,sFormat){sStr=_trim(sStr);if(!sStr){return false}if(!sFormat||!this.isNumber(sStr)){return false}var f=sFormat.split(".");var iLength=xui.util.NumberUtil.getIntegersLength(sStr);var dLength=xui.util.NumberUtil.getDigitsLength(sStr);f[0]=f[0]?f[0]:0;f[1]=f[1]?f[1]:0;if(f[0]>0&&iLength>f[0]){return false}if(f[1]>0&&dLength>f[1]){return false}return true},isTextLength:function(str,len){if(!str||len<1){return false}return str.length>len?false:true},isTextByteLength:function(str,len){if(!str||len<1){return false}return str.replace(/[^\x00-\xff]/g,"aa").length>len?false:true},isEnglish:function(sStr){if(!sStr){return false}return _validateByReg(sStr,REG_EXPRESS.ENGLISH)},isIP:function(sStr){if(!sStr){return false}return _validateByReg(sStr,REG_EXPRESS.IP)},isNumOrEng:function(sStr){if(!sStr){return false}return _validateByReg(sStr,REG_EXPRESS.NUMORENG)},checkInput:function(input,onerror,emptyPassed){return _validateInput(input,onerror,emptyPassed)},checkForm:function(formId,onError,emptyPassed){var oForm=$(formId);var els=oForm.elements;var rst=true;for(var i=0,len=els.length;i<len;i++){if(!_validateInput(els[i],onError,emptyPassed)){rst=false}}return rst}}}();xui.util.Vobot=function(){return{onError:null,_configs:{},addTemplate:function(b,a){this._configs[b]=a},setExpress:function(d,c,a){var b=$(d);xui.util.Validator.setExpress(b,c);if(a){b.setAttribute("label",a)}},_onError:function(h,f,d){var b=this;if(b.onError){var g=b._configs[f.check];if(!g){return}if(g.indexOf("?")>-1){var c=$(h).getAttribute("label");g=g.replace("?",c?c:"");if("isFormatNumber"==f.check){var e=f.format.split(".");g=g.replace("?",e[0]?e[0]:"*");g=g.replace("?",e[1]?e[1]:"*")}else{g=g.replace("?",f.format)}}b.onError.call(null,h,g)}},checkForm:function(d,c){var b=this;return xui.util.Validator.checkForm(d,function(f,e,a){b._onError(f,e,a)},c)},checkInput:function(d,c){var b=this;return xui.util.Validator.checkInput(d,function(f,e,a){b._onError(f,e,a)},c)}}}();xui.util.WinUtil={openWindow:function(b,c,m,k){var j=c?c:640,e=m?m:480;var d=0,g=0;if(k&&k.left){d=k.left}else{d=parseInt((window.screen.availWidth-j)/2)}if(k&&k.top){g=k.top}else{g=parseInt((window.screen.availHeight-e)/2)}var f=[];f.push("width="+j);f.push("height="+e);f.push("left="+d);f.push("top="+g);f.push("scrollbars="+((k&&k.scrollbars)?k.scrollbars:"yes"));f.push("resizable="+((k&&k.resizable)?k.resizable:"yes"));f.push("status="+((k&&k.status)?k.status:"no"));var a=(k&&k.name)?k.name:"_blank";var n=f.join(",");n=n+",toolbar=no,directories=no,menubar=no";return window.open(b,a,n)},openFullWindow:function(b,a){return this.openWindow(b,window.screen.availWidth,window.screen.availHeight,a)},selectOption:function(b,a){if(!b){return}if(!a||a<0){a=0}b.options[a].selected=true},loadIframe:function(c,a){var b=xui.lang.isString(c)?window.frames[c]:c;if(!b){return}b.location.href=a?a:b.location.href},getInputValue:function(e){var d=xui.lang.isString(e)?$(e):e;if(!d){return null}var c=d.tagName?d.tagName.toLowerCase():null;if(!c){return null}var a="";switch(c){case"input":if(d.type=="radio"){d=$N(d.name);for(var b=0;b<d.length;b++){if(d[b].checked){a=d[b].value}}}else{if(d.type=="checkbox"){d=$N(d.name);a=[];for(var b=0;b<d.length;b++){if(d[b].checked){a[a.length]=d[b].value}}}else{a=d.value}}break;case"select":if(d.type=="select-one"){if(d.selectedIndex!=-1){a=d.options[d.selectedIndex].value}}else{if(d.type=="select-multiple"){a=[];for(var b=0;b<d.length;b++){if(d[b].selected){a[a.length]=d[b].value}}}}break;case"textarea":a=d.value;break}return a},_onoffSwitch:function(b){var a=$(b).style.display;if(a=="none"){$(b).style.display=""}else{$(b).style.display="none"}},onoffSwitch:function(b){if(xui.lang.isArray(b)){for(var a=0;a<b.length;a++){this._onoffSwitch(b[a])}}else{this._onoffSwitch(b)}},isFormChanged:function(g){var c=$(g);for(var b=0;b<c.elements.length;b++){var e=c.elements[b];if(!e||!e.id){continue}var a=e.getAttribute("old-value");if(a==null||typeof a=="undefined"){continue}var d=xui.util.WinUtil.getInputValue(e.id)==a;if(!d){return true}}return false},isIE:function(){return xui.env.ua.ie>0?true:false},isIE6:function(){return xui.env.ua.ie==6?true:false},isIE7:function(){return xui.env.ua.ie==7?true:false},isIE8:function(){return xui.env.ua.ie==8?true:false},isFF:function(){return xui.env.ua.gecko>0?true:false}};xui.util.ElementUtil=function(c,b,a){if(a){this.attr=a}if(!b){b=document}this.length=0;this.dom=$$(c,b)};xui.util.ElementUtil.prototype={attr:{emptyColor:"#999",loop:true},initEmptyText:function(){for(var b=0,a=this.dom.length;b<a;b++){var d=xui.util.Dom.getAttribute(this.dom[b],"emptytext");if(d!=null){var c=xui.util.Dom.getStyle(this.dom[b],"color");xui.util.Dom.setAttribute(this.dom[b],"valueColor",c);xui.util.Dom.addClass(this.dom[b],"xui-emptytext");xui.util.ElementUtil.emptyBlur(this.dom[b]);(function(f,e){xui.util.Event.on(f,"focus",xui.util.ElementUtil.emptyFoucs);xui.util.Event.on(f,"blur",xui.util.ElementUtil.emptyBlur);if(!e){xui.util.Event.removeListener(f,"blur",xui.util.ElementUtil.emptyBlur);xui.util.Event.on(f,"focus",function(){xui.util.Event.removeListener(f,"focus",xui.util.ElementUtil.emptyFoucs)})}})(this.dom[b],this.attr.loop)}}},setAttr:function(a){for(var b in a){this.attr[b]=a[b]}}};xui.util.ElementUtil.emptyBlur=function(f,c){var b="#999";if(c){b=c}var e=this;if(f&&f.nodeType){e=f}var d=xui.util.Dom.getAttribute(e,"emptytext");var a=xui.util.StringUtil.trim(e.value);if(a==""){e.value=d;e.style.color=b}};xui.util.ElementUtil.emptyFoucs=function(e){var d=this;if(e&&e.nodeType){d=e}var c=xui.util.Dom.getAttribute(d,"emptytext");var b=xui.util.StringUtil.trim(d.value);var a=xui.util.Dom.getAttribute(d,"valueColor");xui.util.Dom.removeClass(d,"xui-emptytext");if(b==c){d.value="";d.style.color=a}};xui.util.ElementUtil.getValue=function(b){var c=xui.util.Dom.getAttribute(b,"emptytext");var a=xui.util.StringUtil.trim(b.value);if(a==c){return""}return a};xui.util.Template=xui.util.template={cache:{},_tmpl:function(b){var a=new Function("obj","var p=[];with(obj){p.push('"+b.replace(/[\r\t\n]/g," ").split("{%").join("\t").replace(/((^|%})[^\t]*)'/g,"$1\r").replace(/\t=(.*?)%}/g,"',$1,'").split("\t").join("');").split("%}").join("p.push('").split("\r").join("\\'")+"');}return p.join('');");return a},htmlFn:function(a){return fn=this.cache[a]=this.cache[a]||this._tmpl($(a).innerHTML)},html:function(b,a){return a?this.htmlFn(b)(a):this.htmlFn(b)({})},stringFn:function(){var c,e="",a=arguments.length,d=arguments[a-1],b=Array.prototype.slice.call(arguments);if(!/^[a-z0-9-_]+$/.test(d)){c=this._tmpl(b.join(""))}else{b.pop();c=this.cache[d]=this.cache[d]||this._tmpl(b.join(""))}return c},string:function(){var c,d={},f="",a=arguments.length,e=arguments[a-1],b=Array.prototype.slice.call(arguments);if($type(e)==="object"){d=b.pop();c=this.stringFn.apply(this,b)}else{c=this.stringFn.apply(this,arguments)}return c(d)}};YAHOO.util.Attribute=function(c,d){if(d){this.owner=d;this.configure(c,true)}};YAHOO.util.Attribute.INVALID_VALUE={};YAHOO.util.Attribute.prototype={name:undefined,value:null,owner:null,readOnly:false,writeOnce:false,_initialConfig:null,_written:false,method:null,setter:null,getter:null,validator:null,getValue:function(){var b=this.value;if(this.getter){b=this.getter.call(this.owner,this.name,b)}return b},setValue:function(m,h){var n,j=this.owner,p=this.name,k=YAHOO.util.Attribute.INVALID_VALUE,o={type:p,prevValue:this.getValue(),newValue:m};if(this.readOnly||(this.writeOnce&&this._written)){return false}if(this.validator&&!this.validator.call(j,m)){return false}if(!h){n=j.fireBeforeChangeEvent(o);if(n===false){return false}}if(this.setter){m=this.setter.call(j,m,this.name);if(m===undefined){}if(m===k){return false}}if(this.method){if(this.method.call(j,m,this.name)===k){return false}}this.value=m;this._written=true;o.type=p;if(!h){this.owner.fireChangeEvent(o)}return true},configure:function(d,f){d=d||{};if(f){this._written=false}this._initialConfig=this._initialConfig||{};for(var e in d){if(d.hasOwnProperty(e)){this[e]=d[e];if(f){this._initialConfig[e]=d[e]}}}},resetValue:function(){return this.setValue(this._initialConfig.value)},resetConfig:function(){this.configure(this._initialConfig,true)},refresh:function(b){this.setValue(this.value,b)}};(function(){var b=YAHOO.util.Lang;YAHOO.util.AttributeProvider=function(){};YAHOO.util.AttributeProvider.prototype={_configs:null,get:function(d){this._configs=this._configs||{};var a=this._configs[d];if(!a||!this._configs.hasOwnProperty(d)){return null}return a.getValue()},set:function(g,f,a){this._configs=this._configs||{};var h=this._configs[g];if(!h){return false}return h.setValue(f,a)},getAttributeKeys:function(){this._configs=this._configs;var d=[],a;for(a in this._configs){if(b.hasOwnProperty(this._configs,a)&&!b.isUndefined(this._configs[a])){d[d.length]=a}}return d},setAttributes:function(e,a){for(var f in e){if(b.hasOwnProperty(e,f)){this.set(f,e[f],a)}}},resetValue:function(d,a){this._configs=this._configs||{};if(this._configs[d]){this.set(d,this._configs[d]._initialConfig.value,a);return true}return false},refresh:function(h,k){this._configs=this._configs||{};var g=this._configs;h=((b.isString(h))?[h]:h)||this.getAttributeKeys();for(var j=0,a=h.length;j<a;++j){if(g.hasOwnProperty(h[j])){this._configs[h[j]].refresh(k)}}},register:function(a,d){this.setAttributeConfig(a,d)},getAttributeConfig:function(f){this._configs=this._configs||{};var a=this._configs[f]||{};var e={};for(f in a){if(b.hasOwnProperty(a,f)){e[f]=a[f]}}return e},setAttributeConfig:function(a,f,e){this._configs=this._configs||{};f=f||{};if(!this._configs[a]){f.name=a;this._configs[a]=this.createAttribute(f)}else{this._configs[a].configure(f,e)}},configureAttribute:function(a,f,e){this.setAttributeConfig(a,f,e)},resetAttributeConfig:function(a){this._configs=this._configs||{};this._configs[a].resetConfig()},subscribe:function(a,d){this._events=this._events||{};if(!(a in this._events)){this._events[a]=this.createEvent(a)}YAHOO.util.EventProvider.prototype.subscribe.apply(this,arguments)},on:function(){this.subscribe.apply(this,arguments)},addListener:function(){this.subscribe.apply(this,arguments)},fireBeforeChangeEvent:function(d){var a="before";a+=d.type.charAt(0).toUpperCase()+d.type.substr(1)+"Change";d.type=a;return this.fireEvent(d.type,d)},fireChangeEvent:function(a){a.type+="Change";return this.fireEvent(a.type,a)},createAttribute:function(a){return new YAHOO.util.Attribute(a,this)}};YAHOO.augment(YAHOO.util.AttributeProvider,YAHOO.util.EventProvider)})();(function(){var e=YAHOO.util.Dom,g=YAHOO.util.AttributeProvider,h={mouseenter:true,mouseleave:true};var f=function(b,a){this.init.apply(this,arguments)};f.DOM_EVENTS={click:true,dblclick:true,keydown:true,keypress:true,keyup:true,mousedown:true,mousemove:true,mouseout:true,mouseover:true,mouseup:true,mouseenter:true,mouseleave:true,focus:true,blur:true,submit:true,change:true};f.prototype={DOM_EVENTS:null,DEFAULT_HTML_SETTER:function(a,c){var b=this.get("element");if(b){b[c]=a}return a},DEFAULT_HTML_GETTER:function(c){var b=this.get("element"),a;if(b){a=b[c]}return a},appendChild:function(a){a=a.get?a.get("element"):a;return this.get("element").appendChild(a)},getElementsByTagName:function(a){return this.get("element").getElementsByTagName(a)},hasChildNodes:function(){return this.get("element").hasChildNodes()},insertBefore:function(b,a){b=b.get?b.get("element"):b;a=(a&&a.get)?a.get("element"):a;return this.get("element").insertBefore(b,a)},removeChild:function(a){a=a.get?a.get("element"):a;return this.get("element").removeChild(a)},replaceChild:function(b,a){b=b.get?b.get("element"):b;a=a.get?a.get("element"):a;return this.get("element").replaceChild(b,a)},initAttributes:function(a){},addListener:function(b,c,a,d){d=d||this;var o=YAHOO.util.Event,m=this.get("element")||this.get("id"),n=this;if(h[b]&&!o._createMouseDelegate){return false}if(!this._events[b]){if(m&&this.DOM_EVENTS[b]){o.on(m,b,function(j,k){if(j.srcElement&&!j.target){j.target=j.srcElement}if((j.toElement&&!j.relatedTarget)||(j.fromElement&&!j.relatedTarget)){j.relatedTarget=o.getRelatedTarget(j)}if(!j.currentTarget){j.currentTarget=m}n.fireEvent(b,j,k)},a,d)}this.createEvent(b,{scope:this})}return YAHOO.util.EventProvider.prototype.subscribe.apply(this,arguments)},on:function(){return this.addListener.apply(this,arguments)},subscribe:function(){return this.addListener.apply(this,arguments)},removeListener:function(a,b){return this.unsubscribe.apply(this,arguments)},addClass:function(a){e.addClass(this.get("element"),a)},getElementsByClassName:function(a,b){return e.getElementsByClassName(a,b,this.get("element"))},hasClass:function(a){return e.hasClass(this.get("element"),a)},removeClass:function(a){return e.removeClass(this.get("element"),a)},replaceClass:function(a,b){return e.replaceClass(this.get("element"),a,b)},setStyle:function(a,b){return e.setStyle(this.get("element"),a,b)},getStyle:function(a){return e.getStyle(this.get("element"),a)},fireQueue:function(){var b=this._queue;for(var a=0,c=b.length;a<c;++a){this[b[a][0]].apply(this,b[a][1])}},appendTo:function(b,a){b=(b.get)?b.get("element"):e.get(b);this.fireEvent("beforeAppendTo",{type:"beforeAppendTo",target:b});a=(a&&a.get)?a.get("element"):e.get(a);var c=this.get("element");if(!c){return false}if(!b){return false}if(c.parent!=b){if(a){b.insertBefore(c,a)}else{b.appendChild(c)}}this.fireEvent("appendTo",{type:"appendTo",target:b});return c},get:function(c){var a=this._configs||{},b=a.element;if(b&&!a[c]&&!YAHOO.lang.isUndefined(b.value[c])){this._setHTMLAttrConfig(c)}return g.prototype.get.call(this,c)},setAttributes:function(a,d){var n={},c=this._configOrder;for(var b=0,o=c.length;b<o;++b){if(a[c[b]]!==undefined){n[c[b]]=true;this.set(c[b],a[c[b]],d)}}for(var m in a){if(a.hasOwnProperty(m)&&!n[m]){this.set(m,a[m],d)}}},set:function(c,a,d){var b=this.get("element");if(!b){this._queue[this._queue.length]=["set",arguments];if(this._configs[c]){this._configs[c].value=a}return}if(!this._configs[c]&&!YAHOO.lang.isUndefined(b[c])){this._setHTMLAttrConfig(c)}return g.prototype.set.apply(this,arguments)},setAttributeConfig:function(c,b,a){this._configOrder.push(c);g.prototype.setAttributeConfig.apply(this,arguments)},createEvent:function(a,b){this._events[a]=true;return g.prototype.createEvent.apply(this,arguments)},init:function(a,b){this._initElement(a,b)},destroy:function(){var a=this.get("element");YAHOO.util.Event.purgeElement(a,true);this.unsubscribeAll();if(a&&a.parentNode){a.parentNode.removeChild(a)}this._queue=[];this._events={};this._configs={};this._configOrder=[]},_initElement:function(c,d){this._queue=this._queue||[];this._events=this._events||{};this._configs=this._configs||{};this._configOrder=[];d=d||{};d.element=d.element||c||null;var a=false;var j=f.DOM_EVENTS;this.DOM_EVENTS=this.DOM_EVENTS||{};for(var b in j){if(j.hasOwnProperty(b)){this.DOM_EVENTS[b]=j[b]}}if(typeof d.element==="string"){this._setHTMLAttrConfig("id",{value:d.element})}if(e.get(d.element)){a=true;this._initHTMLElement(d);this._initContent(d)}YAHOO.util.Event.onAvailable(d.element,function(){if(!a){this._initHTMLElement(d)}this.fireEvent("available",{type:"available",target:e.get(d.element)})},this,true);YAHOO.util.Event.onContentReady(d.element,function(){if(!a){this._initContent(d)}this.fireEvent("contentReady",{type:"contentReady",target:e.get(d.element)})},this,true)},_initHTMLElement:function(a){this.setAttributeConfig("element",{value:e.get(a.element),readOnly:true})},_initContent:function(a){this.initAttributes(a);this.setAttributes(a,true);this.fireQueue()},_setHTMLAttrConfig:function(c,a){var b=this.get("element");a=a||{};a.name=c;a.setter=a.setter||this.DEFAULT_HTML_SETTER;a.getter=a.getter||this.DEFAULT_HTML_GETTER;a.value=a.value||b[c];this._configs[c]=new YAHOO.util.Attribute(a,this)}};YAHOO.augment(f,g);YAHOO.util.Element=f})();YAHOO.register("element",YAHOO.util.Element,{version:"2.9.0",build:"2800"});(function(){var a=xui.util.Dom;$augment(xui.util.Element,{attr:function(c,b){if(!b){if($type(c)==="object"){$each(c,function(e,d){a.setAttribute(this.get("element"),d,e)},this)}else{return a.getAttribute(this.get("element"),c)}}else{a.setAttribute(this.get("element"),c,b)}return this},css:function(c,b){if(!b){if($type(c)==="object"){$each(c,function(e,d){a.setStyle(this.get("element"),d,e)},this)}else{return a.getStyle(this.get("element"),c)}}else{a.setStyle(this.get("element"),c,b)}return this},html:function(b){if(b){this.get("element").innerHTML=b;return this}else{return this.get("element").innerHTML}},remove:function(){var b=this.get("element");if(b.parentNode){b.parentNode.removeChild(b)}},offset:function(b){var c=this.get("element");if(b){b.x!==undefined&&a.setX(c,b.x);b.y!==undefined&&a.setY(c,b.y);return this}else{return{x:a.getX(c),y:a.getY(c)}}}})})();