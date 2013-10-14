var transitApp=function(){
	var DOM=xui.util.Dom,EV=xui.util.Event;//,step=20,i=1,S=20;
	//,noteScroll=$("noteScroll");
//	noteScroll.innerHTML=noteScroll.innerHTML+noteScroll.innerHTML;
//	function txtScroll(){
//		S=step*i++;
//		var attr={scroll:{to:[0,S]}};
//		var anim=new YAHOO.util.Scroll(noteScroll,attr,0.5,YAHOO.util.Easing.easeOut)
//		anim.onComplete.subscribe(function(){ 
//			 if(S==step*5){
//				i=1;
//				noteScroll.scrollTop=0;
//			}
//		});
//		anim.animate();
//	}
//	var t=setInterval(txtScroll,1000);
//	EV.on(noteScroll,'mouseenter',function(e){
//		clearInterval(t)
//	});
//	EV.on(noteScroll,'mouseleave',function(e){
//		t=setInterval(txtScroll,1000);
//	});
	EV.on($$("#menu li"),'mouseenter',function(e){
		var subMenu=$$("div",this)[0];
		this.prevClassName = this.className;
		this.className="curMenu";
		if(subMenu!=null){
			subMenu.style.display="block";
			var mainMenuWidth = $$("a",this)[0].offsetWidth;
			if (subMenu.scrollWidth < mainMenuWidth) {
				subMenu.style.width=mainMenuWidth + "px";
			}
			else{
				subMenu.style.width=subMenu.offsetWidth + "px";	
			}
		}
	});
	EV.on($$("#menu li"),'mouseleave',function(e){
		var subMenu=$$("div",this)[0];
		this.className= this.prevClassName;
		if(subMenu!=null){
			subMenu.style.display="none";
		}
	});
	
	
}();
