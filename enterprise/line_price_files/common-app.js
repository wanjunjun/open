var CmApp = function() {
	var XD = xui.util.Dom;
	var XE = xui.util.Event;
	var vali = xui.util.Validator;
	var strUtil = xui.util.StringUtil;
	var tip = xui.widgets.Tip;
	var areaSelectSingleton;
	var namespace = '';
	return {
		_systemError : function() {
			xui.widgets.MsgBox.show({
				type : 'fail',
				msg : '系统异常，请稍后再试'
			}, function() {
			}, {
				'error' : '确定'
			});
		},
		/**
		 * ajax是否成功,成功请求返回json,成功请求数据中有isSuccess按照isSuccess判断，没有默认为true
		 * 
		 */
		_isSuccess : function(str) {
			try {
				var o = eval('(' + str + ')');
				if (o.isSuccess == false && o.code && o.code == 401) {
					BlackApp._reload();
					return false;
				} else if (o.isSuccess == false) {
					if (o.message) {
						xui.widgets.MsgBox.show({
							type : 'fail',
							msg : o.message
						}, function() {
						}, {
							'error' : '确定'
						});
					}
					return false;
				} else {
					return true;
				}
			} catch (e) {
				BlackApp._systemError();
				return false;
			}
		},

		/**
		 * 给后台isAjax的参数
		 */
		_addAjax : function(url) {
			return url += (url.indexOf('?') > -1 ? '' : '?') + '&isAjax=true';
		},

		_reload : function() {
			window.location.reload();
		},

		/**
		 * 验证字段
		 * 
		 * @param inputId
		 *            字段控件id
		 * @param focus
		 *            是否要在出错时把焦点设置在控件上
		 * @param fun
		 *            验证方法
		 * @param message
		 *            如果出错，则显示消息。（如果不传，则不显示消息）
		 * @param target
		 *            focus以及提示的message的目标位置，如果不传则由inputId决定
		 * @returns 失败false，成功true
		 */
		_checkInput : function(inputId, focus, fun, message, target) {
			inputId = namespace + inputId;
			// 去掉前后空格
			var value = strUtil.trim($(inputId).value);
			target = target ? target : $(inputId);
			$(inputId).value = value;
			if (!fun.call(null, value)) {
				if (message) {
					tip.show(target, message, '', {
						autoClose : 3000
					});
				}
				if (focus) {
					target.focus();
				}
				return false;
			}
			return true;
		},
		
		setNamespace : function(ns) {
			namespace = ns;
		},

		htmlEncode : function(str) {
			if (str) {
				return strUtil.htmlEncode(str);
			} else {
				return '';
			}
		},

		/**
		 * 初始化验证器
		 */
		initValidator : function() {
			// 字符串长度范围为[min,max]
			vali.isLengthBetween = function(str, min, max) {
				if (!str || !str instanceof String) {
					return false;
				}
				return str.length >= min && str.length <= max;
			};
			// 判断正则
			vali.testReg = function(str, reg) {
				return reg.test(str);
			};
			return vali;
		},

		/**
		 * 初始化省市区资源
		 * 
		 * @param options
		 *            id为控件select的id，value为默认选中值（如果没有，则不传，或为null|false|''），url为ajax地址
		 *            {'province':{'id':'receiverProvince','value':'123'},{},{},'url':'xx'}
		 * singleton:true 唯一实例 @ returns
		 */
		initArea : function(options, onchanges, singleton) {
			if (singleton) {
				if (!areaSelectSingleton) {
					areaSelectSingleton = new SelectAddress.Select(
							options.province.id, options.city.id,
							options.county.id, options.url, onchanges);
				}
			} else {
				var areaSelect = new SelectAddress.Select(options.province.id,
						options.city.id, options.county.id, options.url,
						onchanges);
			}

			var params = {};
			if (options.province.value && options.province.value != '') {
				params['provinceId'] = options.province.value;
			}
			if (options.city.value && options.city.value != '') {
				params['cityId'] = options.city.value;
			}
			if (options.county.value && options.county.value != '') {
				params['countyId'] = options.county.value;
			}
			if (singleton) {
				areaSelectSingleton.loading(params);
				return areaSelectSingleton;
			} else {
				areaSelect.loading(params);
				return areaSelect;
			}

		},
		/**
		 * 验证收货方
		 */
		checkReceiverCop : function(focus, showMsg) {
			return CmApp._checkInput('receiverCorp', focus, function(v) {
				return vali.isLengthBetween(v, 1, 50);
			}, showMsg === false ? false : "请填写，且不超过50个字。");
		},

		/**
		 * 收货人省份
		 */
		checkReceiverProvince : function(focus, target, showMsg) {
			return CmApp._checkInput('receiverProvince', focus, function(v) {
				return vali.isNotEmpty(v);
			}, showMsg === false ? false : "请选择。", target);
		},

		/**
		 * 收货人城市
		 */
		checkReceiverCity : function(focus, target, showMsg) {
			return CmApp._checkInput('receiverCity', focus, function(v) {
				return vali.isNotEmpty(v);
			}, showMsg === false ? false : "请选择。", target);
		},

		/**
		 * 收货人区县
		 */
		checkReceiverCounty : function(focus, target, showMsg) {
			return CmApp._checkInput('receiverCounty', focus, function(v) {
				return vali.isNotEmpty(v);
			}, showMsg === false ? false : "请选择。", target);
		},

		/**
		 * 验证收货方地址
		 */
		checkReceiverAddress : function(focus, showMsg) {
			return CmApp._checkInput('receiverAddress', focus, function(v) {
				return vali.isLengthBetween(v, 1, 50);
			}, showMsg === false ? false : "请填写，且不超过50个字。");
		},

		/**
		 * 验证收货方联系人
		 */
		checkReceiver : function(focus, showMsg) {
			return CmApp._checkInput('receiver', focus, function(v) {
				return vali.isLengthBetween(v, 1, 50);
			}, showMsg === false ? false : "请填写，且不超过50个字。");
		},

		/**
		 * 验证收货方手机号
		 */
		checkReceiverMobile : function(focus, showMsg) {
			return CmApp._checkInput('receiverMobile', focus, function(v) {
				if (vali.isEmpty(v)) {
					return true;
				}
				// /^(.)\1+$/ 表示不能全部是相同的字符
				return vali.testReg(v, /^[0-9]{8,16}$/) && (!vali.testReg(v, /^(.)\1+$/));
//				return vali.isFullNumber(v) && vali.isFormatNumber(v, '11.0');
			}, showMsg === false ? false : "请填写正确的手机号码。");
		},

		/**
		 * 验证收货方电话区号
		 */
		checkReceiverAreaCode : function(focus, showMsg) {
			return CmApp._checkInput('receiverAreaCode', focus, function(v) {
				if (vali.isEmpty(v) || v == "区号") {
					return true;
				}
				return vali.testReg(v, /^[0-9]{3,6}$/);
//				return vali.isTextLength(v, 5) && vali.isFullNumber(v);
			}, showMsg === false ? false : "请填写正确的电话号码。");
		},

		/**
		 * 验证收货方电话主机
		 */
		checkReceiverTel : function(focus, showMsg) {
			return CmApp._checkInput('receiverTel', focus, function(v) {
				if (vali.isEmpty(v) || v == "电话号") {
					return true;
				}
				// /^(.)\1+$/ 表示不能全部是相同的字符
				return vali.testReg(v, /^[0-9]{5,10}$/) && (!vali.testReg(v, /^(.)\1+$/));
//				return vali.isTextLength(v, 10) && vali.isFullNumber(v);
			}, showMsg === false ? false : "请填写正确的电话号码。");
		},

		/**
		 * 验证收货方电话主机分机号
		 */
		checkReceiverTelExt : function(focus, showMsg) {
			return CmApp._checkInput('receiverTelExt', focus, function(v) {
				if (vali.isEmpty(v) || v == "分机号") {
					return true;
				}
				return vali.testReg(v, /^[0-9]{1,6}$/);
//				return vali.isTextLength(v, 6) && vali.isFullNumber(v);
			}, showMsg === false ? false : "请填写正确的电话号码。");
		},
		/**
		 * 校验手机和电话至少选填一项
		 */
		checkReceiverContact : function(focus, showMsg) {
			var mobile = strUtil.trim($(namespace + 'receiverMobile').value);
			var telAreaCode = strUtil.trim($(namespace + 'receiverAreaCode').value);
			var telephone = strUtil.trim($(namespace + 'receiverTel').value);
			var telephoneExt = strUtil.trim($(namespace + 'receiverTelExt').value);
			var result = CmApp.checkContact(mobile, telAreaCode, telephone,telephoneExt);
			if (!result.success) {
				var target = result.targetIsMoblie ? $(namespace + 'receiverMobile') : $(namespace + 'receiverTel');
				var message = showMsg ? showMsg : result.message;
				if (showMsg !== false) {
					tip.show(target, message, '', {
						autoClose : 3000
					});
				}
				if (focus) {
					target.focus();
				}
				return false;
			}
			return true;
		},
		/**
		 * 验证发货方
		 */
		checkSenderCop : function(focus, showMsg) {
			return CmApp._checkInput('senderCorp', focus, function(v) {
				return vali.isLengthBetween(v, 1, 50);
			}, showMsg === false ? false : '请填写，且不超过50个字。');
		},

		/**
		 * 发货人省份
		 */
		checkSenderProvince : function(focus, target, showMsg) {
			return CmApp._checkInput('senderProvince', focus, function(v) {
				return vali.isNotEmpty(v);
			}, showMsg === false ? false : "请选择。", target);
		},

		/**
		 * 发货人城市
		 */
		checkSenderCity : function(focus, target, showMsg) {
			return CmApp._checkInput('senderCity', focus, function(v) {
				return vali.isNotEmpty(v);
			}, showMsg === false ? false : "请选择。", target);
		},

		/**
		 * 发货人区县
		 */
		checkSenderCounty : function(focus, target, showMsg) {
			return CmApp._checkInput('senderCounty', focus, function(v) {
				return vali.isNotEmpty(v);
			}, showMsg === false ? false : "请选择。", target);
		},

		/**
		 * 验证发货方地址
		 */
		checkSenderAddress : function(focus, showMsg) {
			return CmApp._checkInput('senderAddress', focus, function(v) {
				if (vali.isEmpty(v)) {
					return true;
				}
				return vali.isLengthBetween(v, 1, 50);
			}, showMsg === false ? false : "不超过50个字。");
		},

		/**
		 * 验证发货方联系人
		 */
		checkSender : function(focus, showMsg) {
			return CmApp._checkInput('sender', focus, function(v) {
				return vali.isLengthBetween(v, 1, 50);
			}, showMsg === false ? false : "请填写，且不超过50个字。");
		},

		/**
		 * 验证发货方手机号
		 */
		checkSenderMobile : function(focus, showMsg) {
			return CmApp._checkInput('senderMobile', focus, function(v) {
				if (vali.isEmpty(v)) {
					return true;
				}
				// /^(.)\1+$/ 表示不能全部是相同的字符
				return vali.testReg(v, /^[0-9]{8,16}$/) && (!vali.testReg(v, /^(.)\1+$/));
//				return vali.isFullNumber(v) && vali.isFormatNumber(v, '11.0');
			}, showMsg === false ? false : "请填写正确的手机号码。");
		},

		/**
		 * 验证发货方电话区号
		 */
		checkSenderAreaCode : function(focus, showMsg) {
			return CmApp._checkInput('senderAreaCode', focus, function(v) {
				if (vali.isEmpty(v) || v == "区号") {
					return true;
				}
				return vali.testReg(v, /^[0-9]{3,6}$/);
//				return vali.isTextLength(v, 5) && vali.isFullNumber(v);
			}, showMsg === false ? false : "请填写正确的电话号码。");
		},

		/**
		 * 验证发货方电话主机
		 */
		checkSenderTel : function(focus, showMsg) {
			return CmApp._checkInput('senderTel', focus, function(v) {
				if (vali.isEmpty(v) || v == "电话号") {
					return true;
				}
				// /^(.)\1+$/ 表示不能全部是相同的字符
				return vali.testReg(v, /^[0-9]{5,10}$/) && (!vali.testReg(v, /^(.)\1+$/));
//				return vali.isTextLength(v, 10) && vali.isFullNumber(v);
			}, showMsg === false ? false : "请填写正确的电话号码。");
		},

		/**
		 * 验证发货方电话主机分机号
		 */
		checkSenderTelExt : function(focus, showMsg) {
			return CmApp._checkInput('senderTelExt', focus, function(v) {
				if (vali.isEmpty(v) || v == "分机号") {
					return true;
				}
				return vali.testReg(v, /^[0-9]{1,6}$/);
//				return vali.isTextLength(v, 6) && vali.isFullNumber(v);
			}, showMsg === false ? false : "请填写正确的电话号码。");
		},
		/**
		 * 手机和电话至少选填一项
		 */
		checkSenderContact : function(focus, showMsg) {
			var mobile = strUtil.trim($(namespace + 'senderMobile').value);
			var telAreaCode = strUtil.trim($(namespace + 'senderAreaCode').value);
			var telephone = strUtil.trim($(namespace + 'senderTel').value);
			var telephoneExt = strUtil.trim($(namespace + 'senderTelExt').value);
			var result = CmApp.checkContact(mobile, telAreaCode, telephone,telephoneExt);
			if (!result.success) {
				var target = result.targetIsMoblie ? $(namespace + 'senderMobile') : $(namespace + 'senderTel');
				var message = showMsg ? showMsg : result.message;
				if (showMsg !== false) {
					tip.show(target, message, '', {
						autoClose : 3000
					});
				}
				if (focus) {
					target.focus();
				}
				return false;
			}
			return true;
		},
		
		/**
		 * 检验联系方式
		 */
		checkContact : function(mobile, phoneAreaCode, phoneTel,phoneTelExt){
			phoneAreaCode = phoneAreaCode == '区号' ? '' : phoneAreaCode;
			phoneTel = phoneTel == '电话号' ? '' : phoneTel;
			phoneTelExt = phoneTelExt == '分机号' ? '' : phoneTelExt;
			var result = {};
			if(vali.isEmpty(mobile) && vali.isEmpty(phoneTel)){
				result.message = '手机和电话至少选填一项。';
				result.success = false;
				result.targetIsMoblie = true;
			} else if(vali.isEmpty(phoneAreaCode) ^ vali.isEmpty(phoneTel)) {
				result.message = '请正确填写区号和电话号。';
				result.success = false;
				result.targetIsMoblie = false;
			} else if(!vali.isEmpty(phoneTelExt) && vali.isEmpty(phoneTel)) {
				result.message = '请正确填写区号,电话号,分机号。';
				result.success = false;
				result.targetIsMoblie = false;
			} else {
				result.success = true;
			}
			return result;
		},
		/**
		 * 货物名称
		 */
		checkGoodsName : function(focus, showMsg) {
			return CmApp._checkInput('goodsName', focus, function(v) {
				return vali.isLengthBetween(v, 1, 50);
			}, showMsg === false ? false : "请填写，且不超过50个字。");
		},

		/**
		 * 包装总件数
		 */
		checkTotalNumber : function(focus, showMsg) {
			return CmApp._checkInput('totalNumber', focus, function(v) {
				return vali.testReg(v, /^(([1-9][0-9]{0,5})|(0))$/);
			}, showMsg === false ? false : "请填写1~6位的数字。");
		},

		/**
		 * 总重量
		 */
		checkTotalWeight : function(focus, showMsg) {
			return CmApp._checkInput('totalWeight', focus, function(v) {
				var reg = /^(([1-9]{1}\d{0,4})|([0]{1}))(\.(\d){1,2})?$/;
				return vali.testReg(v, reg);
			}, showMsg === false ? false : "请填写1~5位的数字，可保留两位小数。");
		},

		/**
		 * 总体积
		 */
		checkTotalVolume : function(focus, showMsg) {
			return CmApp._checkInput('totalVolume', focus, function(v) {
				var reg = /^(([1-9]{1}\d{0,4})|([0]{1}))(\.(\d){1,2})?$/;
				return vali.testReg(v, reg);
			}, showMsg === false ? false : "请填写1~5位的数字，可保留两位小数。");
		},

		/**
		 * 增值服务中总重量
		 */
		checkVasTotalWeight : function(focus, showMsg, company) {
			return CmApp
					._checkInput(
							'vas_' + company + '_weight',
							focus,
							function(v) {
								if (strUtil
										.trim($('vas_' + company + '_weight').value) == '')
									return true;
								var reg = /^(([1-9]{1}\d{0,4})|([0]{1}))(\.(\d){1,2})?$/;
								return vali.testReg(v, reg);
							}, showMsg === false ? false
									: "请填写1~5位的数字，可保留两位小数。");
		},

		/**
		 * 增值服务中总体积
		 */
		checkVasTotalVolume : function(focus, showMsg, company) {
			return CmApp
					._checkInput(
							'vas_' + company + '_volume',
							focus,
							function(v) {
								if (strUtil
										.trim($('vas_' + company + '_volume').value) == '')
									return true;
								var reg = /^(([1-9]{1}\d{0,4})|([0]{1}))(\.(\d){1,2})?$/;
								return vali.testReg(v, reg);
							}, showMsg === false ? false
									: "请填写1~5位的数字，可保留两位小数。");
		},

		/**
		 * 保价金额
		 */
		checkInsuranceValue : function(focus, corpName, showMsg) {
			var checkId = corpName ? 'vas_' + corpName + '_insurance'
					: 'insurance';
			var id = corpName ? 'vas_' + corpName + '_insuranceValue'
					: 'insuranceValue';
			if(!$(checkId) || !$(id)){
				return true;
			}
			var insuranceChecked = $(checkId).checked;
			if (!insuranceChecked) {
				return true;
			}
			var regExp = /^((([1-9]{1}\d{0,7})(\.(\d){1,2})?)|((0)\.(0)[1-9])|((0)\.[1-9][0-9]?))$/;
			var result = CmApp._checkInput(id, focus, function(v) {
				return vali.testReg(v, regExp);
			}, showMsg === false ? false : "请填写大于0的1~8位数字,可保留2位小数。");

			// if(corpName=='DTW'){
			// if(result){
			// result=CmApp._checkInput(id, focus, function(v) {
			// return $(id).value>=3000;
			// }, showMsg === false ? false :
			// "最低保费金额为3000元，收费5元，3000元以上按照0.3%收费。");
			// return result;
			// }
			// }else{
			return result;
			// }

		},

		/**
		 * 代收货款
		 */
		checkCodTypeValue : function(focus, corpName, showMsg) {
			if(!$('vas_' + corpName + '_cod') || !$('vas_' + corpName + '_codValue')){
				return true;
			}
			var codTypeValue = $('vas_' + corpName + '_cod').checked;
			if (!codTypeValue) {
				return true;
			}
			var id = 'vas_' + corpName + '_codValue';
			// 必须大于10. modified by jinggang.huangjg @2011/12/12
			var regExp = /^((([1-9]{1}\d{1,7})(\.(\d){1,2})?)|((0)\.(0)[1-9])|((0)\.[1-9][0-9]?))$/;
			return CmApp._checkInput(id, focus, function(v) {
				return vali.testReg(v, regExp);
			}, showMsg === false ? false : "请填写大于10的1~8位数字,可保留2位小数。");
		},

		/**
		 * 备注
		 */
		checkRemark : function(focus) {
			return CmApp._checkInput('remark', focus, function(v) {
				return vali.isTextLength(v, 200);
			});
		},
		getDocHeight : function() {
			var D = document;
			return Math.max(Math.max(D.body.scrollHeight,
					D.documentElement.scrollHeight), Math.max(
					D.body.offsetHeight, D.documentElement.offsetHeight), Math
					.max(D.body.clientHeight, D.documentElement.clientHeight));
		},
		/**
		 * 选择货物保价金额，enable输入框
		 */
		enableInsurance : function() {
			if (this.checked) {
				$('insuranceValue').disabled = false;
				$('insuranceValue').focus();
			} else {
				$('insuranceValue').disabled = true;
				$('insuranceValue').value = "";
			}
		},

		/**
		 * 选中是提示文字
		 */
		onCheckedTip : function(checkBoxId, msg) {
			if ($(checkBoxId).checked) {
				tip.show(checkBoxId, msg, '', {
					autoClose : 3000
				});
			}
		},

		/**
		 * 物流跟踪信息查询页面运单号验证
		 */
		checkMailNos : function(focus, showMsg) {
			return CmApp._checkInput('mailNos', focus, function(v) {
				return vali.isNotEmpty(v);
			}, showMsg === false ? false : '请输入运单号。');
		},
		
		checkLogisticsCompId : function(focus, showMsg) {
			return CmApp._checkInput('logisticsCompId', focus, function(v) {
				return vali.isNotEmpty(v);
			}, showMsg === false ? false : '请选择物流公司。');
		},
		
		checkExtraInfo : function(focus, showMsg) {
			return CmApp._checkInput('extraInfo', focus, function(v) {
				return vali.isNotEmpty(v);
			}, showMsg === false ? false : '请输入手机号码。');
		}, 

		checkNetworkProvince : function(focus, target, showMsg) {
			return CmApp._checkInput('dprovince', focus, function(v) {
				return vali.isNotEmpty(v);
			}, showMsg === false ? false : "请选择。", target);
		},

		checkNetworkNo : function(focus, nwSelectId, showMsg) {
			return CmApp._checkInput(nwSelectId, focus, function(v) {
				return vali.isNotEmpty(v) && v != '-1';
			}, showMsg === false ? false : "请选择。");
		},
		
		/**
		 * 快递详情,验证运单号
		 */
		checkMailNo : function(focus, showMsg, target) {
			return CmApp._checkInput('mailNo', focus, function(v) {
				return vali.testReg(v, /^[0-9a-zA-Z]{1,18}$/);
			}, showMsg === false ? false : "运单号不符合规则", target);
		},
		
		checkMailNosFormate : function(focus, showMsg) {
			return CmApp._checkInput('mailNos', focus, function(v) {
				return vali.testReg(v, /^[0-9a-zA-Z]{5,20}$/);
			}, showMsg === false ? false : "运单号不符合规则或者运单小于5个字符");
		},
		/**
		 * 重量的验证
		 */
		checkWeight : function(inputId, focus, showMsg) {
			return CmApp._checkInput(inputId, focus, function(v) {
				var reg = /^(([1-9]{1}\d{0,4})|([0]{1}))(\.(\d){1,2})?$/;
				return vali.testReg(v, reg);
			}, showMsg === false ? false : "请填写1~5位的数字，可保留两位小数。");
		},
		checkComment : function (){
			var serviceStar = strUtil.trim($('service_star_value').value);
			var speedStar = strUtil.trim($('speed_star_value').value);
			var priceStar = strUtil.trim($('price_star_value').value);
			var orderId = strUtil.trim($('evaluateOrderId').value);
			var evaluationComment = strUtil.trim($('evaluationComment').value);
			var isLost = $('isLostY').checked || $('isLostN').checked;
			var isBroken = $('isBrokenY').checked || $('isBrokenN').checked;
			if (vali.isEmpty(serviceStar) && vali.isEmpty(speedStar) && vali.isEmpty(priceStar)
					&& vali.isEmpty(evaluationComment)
					&& !isLost && !isBroken) {
				var target = $('commentOrderBtn');
				var message = '请务必选择一项评价内容作为评价。';
				tip.show(target, message, '', {
					autoClose : 3000
				});
				return false;
			}
			return true;
		}
	};
}();