(function(s,u){var G={version:"0.8",enabled:!0,debug:!1,ratio:1,timeout:3E3,timestamp:"-",token:"",serviceUrl:"/service/um.json"},y=[10,8,7,3,2],m=window,g=m.document,h=m.navigator,k=0,p=null,t=!1,l=null,z=!1,B,e={},H=function(){l=g.getElementById("umData");p=g.getElementById("umFlash");try{t||(t=p&&p.md5)}catch(a){}},q,N=g.getElementById!=u&&g.getElementsByTagName!=u&&g.createElement!=u,i=h.userAgent.toLowerCase(),n=h.platform.toLowerCase(),O=n?/win/.test(n):/win/.test(i),n=n?/mac/.test(n):/mac/.test(i),
I=/webkit/.test(i)?parseFloat(i.replace(/^.*webkit\/(\d+(\.\d+)?).*$/,"$1")):!1,P=/msie/.test(i);/opera/.test(i);var i=!I&&/gecko/.test(i),C=function(a,c){return h.plugins&&h.plugins[a]&&h.mimeTypes&&h.mimeTypes[c]&&h.mimeTypes[c].enabledPlugin?h.plugins[a]:!1},D=function(a){var c=!1;try{c=new ActiveXObject(a)}catch(d){}return c},b,j,v=[0,0,0],r=0,E=0;if(m.ActiveXObject){if(b=D("ShockwaveFlash.ShockwaveFlash")){try{if(j=b.GetVariable("$version"))j=j.split(" ")[1].split(","),v=[parseInt(j[0],10),parseInt(j[1],
10),parseInt(j[2],10)]}catch(S){}b=null}if(b=D("Aliedit.EditCtrl")){try{r=1,"undefined"!=typeof b.alieditVersion&&(r=parseInt(b.alieditVersion(),10)||1)}catch(T){}b=null}if(b=D("Alim.webmod")){try{E=1,"undefined"!=typeof b.getHardVersion&&(E=parseInt(b.getHardVersion().replace(/\./g,""),10)||1)}catch(U){}b=null}}else{if((b=C("Shockwave Flash","application/x-shockwave-flash"))&&b.description)j=b.description.replace(/^.*\s+(\S+\s+\S+$)/,"$1"),v[0]=parseInt(j.replace(/^(.*)\..*$/,"$1"),10),v[1]=parseInt(j.replace(/^.*\.(.*)\s.*$/,
"$1"),10),v[2]=/[a-zA-Z]/.test(j)?parseInt(j.replace(/^.*[a-zA-Z]+(.*)$/,"$1"),10):0,b=null;if(b=C("Aliedit Plug-In","application/aliedit")||C("Alipay security control","application/aliedit"))r=1,"undefined"!=typeof b.getAlieditVersion&&(r=parseInt(b.getAlieditVersion(),10)||1),b=null}q={w3:N,flash:v,edit:r,mod:E,wk:I,gk:i,ie:P,win:O,mac:n};var o,J=[];o=function(a){e.debug&&(window.Tracker?Tracker.click("um-"+a):a&&(J.push(a),setTimeout(function(){o(J.shift())},100)))};var Q=function(a){for(var c=
1,d=arguments.length;c<d;c++)for(var w in arguments[c])arguments[c].hasOwnProperty(w)&&(a[w]=arguments[c][w]);return a},K,F=g.getElementsByTagName("head")[0]||g.documentElement;K=function(a,c,d){var w=!1,f=document.createElement("script"),b="_"+parseInt(1E4*Math.random(),10)+"_"+(new Date).getTime();window[b]=function(a){c(a);F.removeChild(g.getElementById(b));try{delete window[b]}catch(d){}};var e;e=[];for(var h in d||{})e.push(h+"="+encodeURIComponent(d[h]));e.push("_callback="+b);a+=0<a.indexOf("?")?
"&":"?";a+=e.join("&");f.id=b;f.onload=f.onreadystatechange=function(){if(!w&&(!this.readyState||"loaded"===this.readyState||"complete"===this.readyState))w=!0,f.onload=f.onreadystatechange=null};f.src=a;F.insertBefore(f,F.firstChild)};s.getStatus=function(a){return a?k:200<=k};s.init=function(a){if(!z){z=!0;try{e=Q({},G,a||{})}catch(c){}k=1;var d=0;B=setTimeout(function(){if(3>k){H();d++;if(10>d&&p){o(t?"timeout-flash":"timeout-flash-na");setTimeout(arguments.callee,e.timeout>>1);x();return}setTimeout(arguments.callee,
200)}k=201},e.timeout);e.debug&&(s.options=e);if(e.enabled&&(1>=e.ratio||!parseInt(Math.random()*e.ratio,10)))try{L()}catch(b){o("init-error")}}};var x,R=function(a,c){if("boolean"!=typeof a&&(!a||"-"==a))return"-";switch(c){case 0:"string"===typeof a&&(a="true"===a);result=a?"1":"0";break;case 1:result=parseInt(a,10)||0;break;case 2:a=""+a;result=t&&32<a.length?p.md5(a):a;break;default:result="-"}return result},A={set:function(a,c){try{p&&p.setCookie(a,c)}catch(d){}m.localStorage&&(localStorage[a]=
c);if(h.cookieEnabled){var b=a+"="+encodeURIComponent(c),b=b+(";expires="+(new Date((new Date).getTime()+31536E6)).toGMTString());g.cookie=b}if(q.ie&&l){l.setAttribute(a,c);try{l.save("um")}catch(f){}}},get:function(a,c){var d,b="",f=0;c==u&&(c=255);if(t)try{d=p.getCookie(a)||"",!b&&c&1&&(b=d),f+=y[0]}catch(e){}m.localStorage&&(d=localStorage[a]||"",!b&&c&4&&(b=d),f+=y[2]);if(l){try{l.load("um")}catch(j){}d=l.getAttribute(a);!b&&c&8&&(b=d);f+=y[3]}if(h.cookieEnabled){d=g.cookie.indexOf(a+"=");if(-1!=
d){d+=a.length+1;var k=g.cookie.indexOf(";",d);-1==k&&(k=g.cookie.length);d=decodeURIComponent(g.cookie.substring(d,k))||"";!b&&c&16&&(b=d)}f+=y[4]}255==c&&o("points-"+f);b&&255==c&&A.set(a,b);return b},remove:function(a,c){c==u&&(c=255);h.cookieEnabled&&c&16&&(g.cookie=a+"=;expires=Thu, 01-Jan-70 00:00:01 GMT;");if(q.ie&&c&8&&l){l.removeAttribute(a);try{l.save("um")}catch(b){}}c&4&&m.localStorage&&localStorage.removeItem(a);c&1&&t&&p.setCookie(a,"")}},M=[{avHardwareDisable:[0,0],hasAudio:[0,0],hasAudioEncoder:[0,
0],hasMP3:[0,0],hasPrinting:[0,0],hasStreamingAudio:[0,0],hasStreamingVideo:[0,0],hasVideoEncoder:[0,0],maxLevelIDC:[1,0],pixelAspectRatio:[1,0],screenColor:[2,0],screenDPI:[1,0],screenResolutionX:[1,0],screenResolutionY:[1,0]},{hasAccessibility:[0,0],hasEmbeddedVideo:[0,0],hasScreenBroadcast:[0,0],hasScreenPlayback:[0,0],isDebugger:[0,0],isEmbeddedInAcrobat:[0,0],hasIME:[0,0],hasTLS:[0,0],language:[2,0],languages:[2,0],localFileReadDisable:[0,0],os:[2,0],cookieEnabled:[0,1],platform:[2,1,function(a){return!a?
"":a.split(" ").shift()}]},{playerType:[2,0],version:[2,0],userAgent:[2,1],appCodeName:[2,1],appMinorVersion:[2,1],appName:[2,1],appVersion:[2,1],systemLanguage:[2,1],userLanguage:[2,1],browserLanguage:[2,1],manufacturer:[2,0],fonts:[2,0],cpuClass:[2,1]}];G.debug&&(s.cookie=A,s.ua=q);x=function(){if(!arguments.callee.invoked&&z){arguments.callee.invoked=!0;k=3;window.__flash__removeCallback=function(a,b){a&&(a[b]=null)};H();var a={xt:e.token||"",xf:0};try{if(q.ie&&q.edit){var c=new ActiveXObject("Aliedit.EditCtrl");
c.UseP&&(a.xp=c.ci2())}if(q.mod){var b=new ActiveXObject("Alim.webmod");2001<=q.mod&&(b.timestamp=e.timestamp||"-");a.xh=b.ciraw()}}catch(g){if(o("err-run"),a.xp||(a.xp=""),!a.xh)a.xh=""}try{for(c=0;3>c;c++){var b=[],f=[],j=M[c],l;for(l in j)j.hasOwnProperty(l)&&b.push(l);for(var b=b.sort(),i=0,s=b.length;i<s;i++){var m=M[c][b[i]],n="";try{(n=(m[1]?h[b[i]]:t&&p.getCapabilities(b[i]))||"")&&m[2]&&(n=m[2](n))}catch(u){}f.push(R(n,m[0]))}a["x"+c]=f.join("^^")}}catch(v){o("err-read")}var r;try{r=a.xs=
A.get("_umdata")}catch(x){o("err-read-s")}k=4;try{K(e.serviceUrl,function(a){B&&clearTimeout(B);!a||!("id"in a)?k=200:(k=255,(r=a.id)&&A.set("_umdata",r),e.debug&&e.onCompleted&&e.onCompleted(a.id))},a)}catch(y){}}};var L;s.flashLoaded=function(){!arguments.callee.invoked&&z&&(t=arguments.callee.invoked=!0,x())};L=function(){if(!arguments.callee.invoked&&z){arguments.callee.invoked=!0;k=2;try{q.ie&&document.write('<input type="hidden" id="umData" style="behavior:url("#default#userData")"/>')}catch(a){o("err-ud")}if(9<=
q.flash[0])try{document.write('<object type="application/x-shockwave-flash" data="//img.alipay.com/common/um/lsa.swf" width="1" height="1" id="umFlash"><param name="movie" value="//img.alipay.com/common/um/lsa.swf" /><param name="allowScriptAccess" value="always" /></object>')}catch(b){o("err-fl"),x()}else o("no-flash"),x()}}})(window.um={});