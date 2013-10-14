/**
 * 价格查询模块 update by sapphire.shand
 * 
 * @20111208
 * 
 */
(function($){
	ALP.PriceQueryModel = {
		
		sourceSelect: $("#source-area-select"),
		destSelect: $("#dest-area-select"),
		sourceArea: $("#source-area"),
		destArea: $("#dest-area"),
		destMenuTip: $("<div class='alp-autocomplete-menutip'>您可以使用键盘的<span class='arr'>&nbsp;&uarr;&nbsp;&darr;&nbsp;</span>键来选择</div>"),
		areaTip: $("<span class='alp-autocomplete-tips'></span>"),
		placeHolderForArea: "请选择城市（可输入中文或拼音）",
		areaData:{},
		requestURL:$("#areasByPinyinURL").attr("value"),
		senderAreaURL:$("#senderAreaURL").attr("value"),
		areaSelect: $("div.area-select"),
		areaTxt: $("input.alp-area-text"),
		sourceAreaAddressData : {},
		destAreaAddressData:{},
		showGrade:3,// 控件需要展示的级数
		validateGrade:2,// 需要验证的级数
		
		
		init : function (submitUrl) {
			var self = this;
			this.map = {
				"source-area":[this.sourceSelect, this.destSelect, this.sourceArea, this.showGrade],
				"dest-area":[this.destSelect, this.sourceSelect, this.destArea, this.showGrade]
			};
			
			$("html").bind("click", function(event){
				self.pageClickHandler(event);
			});

			
			this.areaData = eval( "(" + EXPRESS.areaData + ")" );
			this.initAreaSelect();
			this.initAutoComplete();
			this.initText();
			$("#price-query-btn").bind("click",function(){
				$('#pageIndex').val('1');// 每次点击查询，充值页为第一页
				//重新设置赛选条件
				$('#corpLevels').val('');
				$('#isCreditOpened').val('');
				$('#isCod').val('');
				$('#routeType').val('');
				$('#isFreeReceive').val('');
				$('#isFreeDelivery').val('');
				$('#isPromotion').val('');
				$('#corpFilter').val('');
				$("#specials").val('');
				$("#sentCorpsFlag").val('');
				$("#isAirTransport").val('');
				var action = $(this).attr("action");
				var jId = "#" + action;
				var dataObjList = [{"obj": self.sourceArea, "grade": self.validateGrade, "showGrade": self.showGrade}, {"obj":self.destArea, "grade":self.validateGrade, "showGrade": self.showGrade}];
				self.submitForm(jId,dataObjList,submitUrl);
				return false;
			});
		},
		
		initText : function() {
			
			var spc = $("#senderProvinceCode").val();
			var scc = $("#senderCityCode").val();
			var syc = $("#senderCountyCode").val();
			var rpc = $("#receiverProvinceCode").val();
			var rcc = $("#receiverCityCode").val();
			var ryc = $("#receiverCountyCode").val();
			
			var spn = $("#senderProvinceName").val();
			var scn = $("#senderCityName").val();
			var syn = $("#senderCountyName").val();
			var rpn = $("#receiverProvinceName").val();
			var rcn = $("#receiverCityName").val();
			var ryn = $("#receiverCountyName").val();
			
			this.setSourceArea(spc,scc,syc,spn,scn,syn);
			if(rpc || rcc || ryc) {
				this.destAreaAddressData = {
					1:{ name:rpn, code:rpc },
					2:{ name:rcn, code:rcc },
					3:{ name:ryn, code:ryc }
				};	
				$(this.destSelect).areaselect("initTab", this.destAreaAddressData);
				var destAreaValue = "";
				if(rpn) {
					destAreaValue += rpn;
				}
				if(rcn) {
					destAreaValue += "-" + rcn;
				}
				if(ryn) {
					destAreaValue += "-" + ryn;
				}
				this.destArea.val(destAreaValue);
			}
			if(this.sourceArea.val() == '') {
				this.setSenderArea();
			}
			if(this.destArea.val() == '') {
				this.destArea.val(this.placeHolderForArea);
			}
			
		},
		setSourceArea : function(spc,scc,syc,spn,scn,syn){
			if(spc || scc || syc) {
				this.sourceAreaAddressData = {
					1:{ name:spn, code:spc },
					2:{ name:scn, code:scc },
					3:{ name:syn, code:syc }
				};	
				$(this.sourceSelect).areaselect("initTab", this.sourceAreaAddressData);
				var sourceAreaValue = "";
				if(spn) {
					sourceAreaValue += spn;
				}
				if(scn) {
					sourceAreaValue += "-" + scn;
				}
				if(syn) {
					sourceAreaValue += "-" + syn;
				}
				this.sourceArea.val(sourceAreaValue);
			}
		},
		setSenderArea : function(){
			var self=this;
			if(self.senderAreaURL &&  typeof self.senderAreaURL =="undefined"){
				$.ajax({
				url: self.senderAreaURL,
				type: "POST",
				dataType: "json",
				success: function( data ) {
					try{
						if(data.success){
							var content=data.content;
							self.setSourceArea(content.provinceCode,content.cityCode,content.countyCode,content.province,content.city,content.county);
							$("#senderProvince").val(content.provinceCode);
							$("#senderCity").val(content.cityCode);
							if(content.countyCode!=null){
								$("#senderCounty").val(content.countyCode);
							}
						} else{
							self.sourceArea.val(self.placeHolderForArea);
						}
					}catch(e){
						self.sourceArea.val(self.placeHolderForArea);
					}
				},
				error : function(){
					self.sourceArea.val(self.placeHolderForArea);
				}
				});
			}else{
				self.sourceArea.val(self.placeHolderForArea);
			}
		},
		initAreaSelect:function() {
			var self = this,
				i,
				leng = this.areaSelect.length,
				temp,
				id,
				mapVal;
				
			for (i = 0; i < leng; i++) {
				
				temp = this.areaSelect[i].id.split('-');
				temp.pop();				
				id = temp.join("-");
				mapVal = self.map[id];
				
				$(this.areaSelect[i])
				.areaselect({
					"source": EXPRESS.areaData,
					"showIn": "#" + id,
					"grade":mapVal[3],
					after: function(target){
						curIndex = target.find('li.s-tab-t.current').attr('tabIndex');
						self.areaTip.hide();
						if(curIndex == 3) {
							target.areaselect("close");
						}
					}
				})
				.hide();
			}		
		},
		
		initAutoComplete: function() {
			var self = this;
			this.areaTxt
			.bind({"focus" : function(){
					if ($(this).val() === self.placeHolderForArea) {
						$(this).val('');
					}
					this.select();
					var id = this.id;
					self.map[id][0]
					.areaselect("open")
					.css({
						"top": self.map[id][2].position().top + 28,
						"left": self.map[id][2].position().left
					});
					if (self.map[id][1].areaselect) {
						self.map[id][1].areaselect("close");
					}
				},
				"blur": function(){
					var id = this.id;
					if ($(this).val() === '') {
						$(this).val(self.placeHolderForArea);
					}
				}			
			})
			.autocomplete({
				"source": function( request, response ) {
					var id = this.id;
					$.ajax({
						url: self.requestURL,
						dataType: "jsonp",
						data: {
							featureClass: "P",
							style: "full",
							maxRows: 30,
							term: request.term,
							level: self.map[this.element[0].id][3]
						},
						success: function( data ) {
							if (0 == data.length) {
								self.destMenuTip.remove();
							}
							response( data );
						}		
						});
					},
				"delay": 50,
				"minLength": 2,
				"position": {
					my: "left top",
					at: "left bottom",
					offset: "0 28"
				},
				select: function(event, ui){
					var id = this.id;
					self.selectHandler(self.map[id][0], ui.item, self.map[id][3]);	
				},
				open: function(){
					var id = this.id;
					$(this).after(self.destMenuTip.css({
						"top": $(this).position().top + 28,
						"left": $(this).position().left
					}));	
					self.map[id][0].areaselect("close");
				},
				close: function(event){
					self.destMenuTip.remove();
				}
			});			
		},
		
		pageClickHandler: function(event){
			var target = $(event.target),
				isArea = (target[0] == this.sourceArea[0] || target[0] == this.destArea[0]),
				sId,isMenu = target.parent().attr('class') == 'ui-menu-item';
			
			if (isArea && target.val() == "") {
				sId = "#" + target.attr("id") + "-select";
				$(sId).areaselect("initTab", {});
			} else {
				if (!isArea&&!isMenu) {
					$("div.area-select").hide();
				}
			}
		},
		
		/**
		 * 自动完成控件选择后的处理
		 */
		selectHandler: function(target, item, grade){//
			var codeList,
				nameList = item.value.split("-"),
				i,
				leng,
				address = {};
			if (item.code){
				codeList = item.code.split("-");
			} else {
				codeList = [];
			}
			leng = codeList.length;
			
			this.areaTip.hide();
			if (leng == nameList.length) {
				target.areaselect("initAddress");
				for (i = 0; i < leng; i++) {
					address[i + 1] = {
						"name": nameList[i],
						"code": codeList[i]
					};
				}
				target.areaselect("initTab", address);
				
				if (leng == grade) {// 选择了grade级区域后，areaselect组件隐藏，否则展示areaselect下一级tab
					target.areaselect("close");
				} else {
					target.areaselect("open");
				}
			}
		},
		
		/**
		 * 验证地址是否是2级，是否在数据源中
		 */
		
		checkAddress: function(nlist, area, areaData, grade, showGrade){
			var leng =  nlist.length
			,	i
			,	areaTmp
			,	code
			;
			
			if (!grade) { // 网点名称不需要校验
				return true;
			}
			
			if (nlist[0] == this.placeHolderForArea || nlist[0] == this.placeHolderForNet || leng < grade) {// 长度小于待校验的长度，地址填写不完整
				area.after(this.areaTip.css({
					"top": area.position().top - 26,
					"left": area.position().left
				}).show().html("请填写完整地址"));
				return false;
			}		
		
			try {
				areaTmp = areaData;
				for (i = 0 ; i < leng; i++) {
					
					areaTmp = areaTmp[nlist[i]];
					
					if (typeof areaTmp == 'undefined') {
						area.after(this.areaTip.css({
							"top": area.position().top - 26,
							"left": area.position().left
						}).show().html("请填写正确地址"));					
						return false;
						
					}
				}
				return true;					
			} catch (e) {
				area.after(this.areaTip.css({
					"top": area.position().top - 26,
					"left": area.position().left
				}).show().html("请填写正确地址"));
				return false;
			}
		},
		
		/**
		 * @param {Object}
		 *            formJId 要提交的form的JID
		 * @param {Object}
		 *            dataObjList 需要验证的表单对象数组{"obj":obj, "grade":grade}
		 *            没有grade值则不进行验证
		 */		
		submitForm: function(formJId, dataObjList,submitUrl){// 表单提交
			var i, j,
				textList = [],// 每个输入框的数据
				leng,
	// dataList = [],//需要提交的数据
				data,// 缓存数据对象
				sform = $(formJId),
	// hiddenList = sform.find(".hidden-area"),
				grade,
				obj,
				showGrade;
				
			for (i = 0; i < dataObjList.length; i++) {
				obj = dataObjList[i]["obj"];
				textList = obj.val().split("-");
				grade = dataObjList[i]["grade"];
				showGrade = dataObjList[i]["showGrade"];
				if (!grade) {
					if (textList[0] == this.placeHolderForArea || textList[0] == this.placeHolderForNet) {
						dataList[dataList.length] = '';
					} else {
						dataList[dataList.length] = textList[0];
					}
				} else if (this.checkAddress(textList, obj, this.areaData, grade, showGrade)) {
					data = this.areaData;
					leng = textList.length;
					for (j = 0; j < leng; j++) {
						var s = data[textList[j]].code;
	// dataList[dataList.length] = data[textList[j]].code;
						data = data[textList[j]];
						if(obj == this.sourceArea) {
							switch (j) {
								case 0:
									$("#senderProvince").val(s);
									break;
								case 1:
									$("#senderCity").val(s);
									break;
								case 2:
									$("#senderCounty").val(s);
									break;
								default:
									break;
							}
							if(leng == 2) {
								$("#senderCounty").val("");
							}
						} else if(obj == this.destArea) {
							switch (j) {
								case 0:
									$("#receiverProvince").val(s);
									break;
								case 1:
									$("#receiverCity").val(s);
									break;
								case 2:
									$("#receiverCounty").val(s);
									break;
								default:
									break;
							}
							if(leng == 2) {
								$("#receiverCounty").val("");
							}
						}
					}
					
				} else {
					return false;
				}
			}			
			
	// for (i = 0; i < dataList.length; i++) {//给待提交的隐藏域赋值
	// hiddenList[i].value = dataList[i];
	// }
			// 解决chrome下只能提交一次的问题
			var saction = submitUrl ? submitUrl.replace(/[\?#].*$/, '') : '';
			if (saction != "") {
				saction = saction + '?r=' + Math.random() + "#tab";
			}
			$("#hiddenrandom").val(new Date().getTime());
			sform.attr('action', saction).submit();
		}
	};
})(jQuery);
