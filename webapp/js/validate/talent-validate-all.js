var validateI18nMsgRequired = "{0}不允许为空!";
var validateI18nMsgEmail = "{0}不是一个合法的邮箱!";
var validateI18nMsgInt = "{0}必须为整数!";
var validateI18nMsgDatetime = "{0}不是一个合法的日期时间! 正确的格式为{1}";
var validateI18nMsgNumRange = "{0}必须为数字,且在{1}和{2}之间!";
var validateI18nMsgNumRangeNum = "{0}必须为数字!";
var validateI18nMsgNumRangeMin = "{0}必须为数字,且小于等于{1}!";
var validateI18nMsgNumRangeMax = "{0}必须为数字,且大于等于{1}!";
var validateI18nMsgNum = "{0}必须为数字!";
var validateI18nMsgRegex = "{0}不合法!{1}";
var validateI18nMsgIp = "{0}不是一个合法的IP!";

//-----  compare validator
var validateI18nCompare = "{0}不正确!";
var validateI18nStringCompare = "{0}必须{1}{2}{3}!";
var validateI18nNumCompare = "{0}必须为数字,且{1}{2}{3}!";
var validateI18nStringValueCompare = "{0}必须{1}{2}!";
var validateI18nNumValueCompare = "{0}必须为数字,且{1}{2}!";
var validateOperatorLabelMap = [];
validateOperatorLabelMap["<"] = "小于";
validateOperatorLabelMap["<="] = "小于或等于";
validateOperatorLabelMap["=="] = "等于";
validateOperatorLabelMap["!="] = "不等于";
validateOperatorLabelMap[">"] = "大于";
validateOperatorLabelMap[">="] = "大于或等于";
var talent_version = '1.6.0';
/**
 * 显示错误的方式.alert: 用alert进行提示; text: 在对象后面跟提示信息
 */
var validateErrorMsgDisplayStyle = 'text';
/**
 * 是否在keyon时对输入框进行验证
 * @type Boolean
 */
var isValidateWhenOnKeyUp = true;

/**
 * 是否在onchange时对输入框时进行验证
 * @type Boolean
 */
var isValidateWhenOnChange = true;
/**
 * 是否在OnFocus时对输入框时进行验证
 * @type Boolean
 */
var isValidateWhenOnFocus = true;
/**
 * 是否一次性将所有错误都显示出来 true :显示所有 false:只显示一个错误
 */
var validateIsDisplayAllError = true;
var validateSpanNameOfErrorMsg = 'validate_spanname_of_error_msg'; // 提示信息所属span元素的name属性值
/**
 * 一些css class变量
 */
var classNameOfValidateErrorMsg = "validate_error_message"; // 提示信息的样式
var classNameOfValidateErrorInput = "validate_error_input"; // 输入有误时,给输入框的样式
var classNameOfValidateRequiredStar = "validate_required_star"; // 必须输入项后面紧跟着一个星号的样式
var Class = {
	create : function() {
		return function() {
			this.initialize.apply(this, arguments);
		}
	}
};
Object.extend = function(destination, source) {
	for ( var property in source) {
		destination[property] = source[property];
	}
	return destination;
}

// ----------------- static method start -------------------------//
/**
 * @param name标签的name属性值
 * @param tagName标签的名字
 *            根据tagName和name属性获取对象 获取不到返回null,否则返回数组
 */
function getByNameAndTagName(name, tagName) {
	var s = document.getElementsByTagName(tagName);
	if (!s) {
		return null;
	}
	var j = 0;
	var ret = [];
	for ( var i = 0; i < s.length; i++) {
		if (s[i].name == name) {
			ret[j++] = s[i];
		}
	}
	return j == 0 ? null : ret;
}
/**
 * 
 * @param {} oTarget 
 * @param {} sEventType such as "click"
 * @param {} fnHandler
 */
function talent_Util_addEventHandler(oTarget, sEventType, fnHandler) {
    if (oTarget.addEventListener) {   
        oTarget.addEventListener(sEventType, fnHandler, false);   
    } else if (oTarget.attachEvent) {   
        oTarget.attachEvent("on" + sEventType, fnHandler);   
    } else {   
        oTarget["on" + sEventType] = fnHandler;   
    }
}
var talent_Util_addEvent = function(element) {
	if (validateErrorMsgDisplayStyle == 'alert') {
		return;
	}
	var fnHandler = function(element) {
		this.handler = function() {
			if (validateErrorMsgDisplayStyle == 'alert') {
				return;
			}
			validateElement(element);
		}
	};
	if (isValidateWhenOnKeyUp) {
		talent_Util_addEventHandler(element, 'keyup',
				new fnHandler(element).handler);
	}
	if (isValidateWhenOnChange) {
		talent_Util_addEventHandler(element, 'change',
				new fnHandler(element).handler);
	}
	if (isValidateWhenOnFocus) {
		talent_Util_addEventHandler(element, 'focus',
				new fnHandler(element).handler);
	}
};
/**
 * validate all
 */
function validate() {
	return validatorFactory.validate();
}
/**
 * validate form eg:validateForm('formname1', 'formname2', ... );
 */
function validateForm() {
	return validatorFactory.validateForm(arguments);
}
/**
 * validate form eg:validateElement(element1, element2, ... );
 */
function validateElement() {
	return validatorFactory.validateElement(arguments);
}
/**
 * cancel validate
 */
function cancelValidate() {
	validatorFactory.removeAll();
}
// --------------------------- 依赖于具体的js框架实现的跨浏览器的代码
/**
 * 将htmlElement插入到srcElement元素后面
 * 
 * @param srcElement
 * @param htmlElement
 */
function _insertAfter_(srcElement, htmlElement) {
	_insertHtml_('afterend', srcElement, htmlElement);
}

//代码摘自：http://royzhou1985.iteye.com/blog/380757
function _insertHtml_(where, el, html) {
	where = where.toLowerCase();
	if (el.insertAdjacentHTML) {
		switch (where) {
			case "beforebegin" :
				el.insertAdjacentHTML('BeforeBegin', html);
				return el.previousSibling;
			case "afterbegin" :
				el.insertAdjacentHTML('AfterBegin', html);
				return el.firstChild;
			case "beforeend" :
				el.insertAdjacentHTML('BeforeEnd', html);
				return el.lastChild;
			case "afterend" :
				el.insertAdjacentHTML('AfterEnd', html);
				return el.nextSibling;
		}
		throw 'Illegal insertion point -> "' + where + '"';
	} else {
		var range = el.ownerDocument.createRange();
		var frag;
		switch (where) {
			case "beforebegin" :
				range.setStartBefore(el);
				frag = range.createContextualFragment(html);
				el.parentNode.insertBefore(frag, el);
				return el.previousSibling;
			case "afterbegin" :
				if (el.firstChild) {
					range.setStartBefore(el.firstChild);
					frag = range.createContextualFragment(html);
					el.insertBefore(frag, el.firstChild);
					return el.firstChild;
				} else {
					el.innerHTML = html;
					return el.firstChild;
				}
			case "beforeend" :
				if (el.lastChild) {
					range.setStartAfter(el.lastChild);
					frag = range.createContextualFragment(html);
					el.appendChild(frag);
					return el.lastChild;
				} else {
					el.innerHTML = html;
					return el.lastChild;
				}
			case "afterend" :
				range.setStartAfter(el);
				frag = range.createContextualFragment(html);
				el.parentNode.insertBefore(frag, el.nextSibling);
				return el.nextSibling;
		}
		throw 'Illegal insertion point -> "' + where + '"';
	}
} 
/**
 * 为element添加className样式
 * 
 * @param element
 *            被操作的元素
 * @param className
 *            样式名
 * @return
 */
function _addClassName_(target, _className) {
	tClassName = target.className;
    tClassName = " " + tClassName + " ";
    if (tClassName.indexOf(" " + _className + " ") == -1) {
    	target.className = tClassName + _className;
    }
}
/**
 * 为element删除className样式
 * 
 * @param element
 *            被操作的元素
 * @param className
 *            样式名
 * @return
 */
function _removeClassName_(target, name) {
	var oClass = target.className;
	var reg = "/\\b"+name+"\\b/g";
	target.className = oClass ? oClass.replace(eval(reg),'') : '';
}
/**
 * 返回element后面的的第index个元素
 * 
 * @param element
 *            被操作的元素
 * @param index
 *            从0开始
 * @return
 */
function _next_(element, index) {
	var ret = element;
	for (var i = 0; i <= index; i++){
		ret = ret.nextSibling;
	}
	return ret;
}
/**
 * 返回element前面的的第index个元素
 * 
 * @param element
 *            被操作的元素
 * @param index
 *            从0开始
 * @return
 */
function _previous_(element, index) {
	var ret = element;
	for (var i = 0; i <= index; i++){
		ret = ret.previousSibling;
	}
	return ret;
}
/**
 * 删除某一个元素
 * 
 * @param element
 * @return
 */
function _remove_(element) {
	element.parentNode.removeChild(element);
}

/**
 * 相当于string的trim
 * @param str
 * @return
 */
function _trim_(str, mode) {
	
	if (!str){
		return "";
	}
	if (mode) {
		if (mode == "l"){
			return str.replace(/(^\s*)/g, ""); 
		} else if (mode == "r"){
			return str.replace(/(\s*$)/g, ""); 
		}
	}
	return str.replace(/(^\s*)|(\s*$)/g, "");

}
var Processor = Class.create();
Processor.prototype =
{
	initialize:function()
	{},
	process:function()
	{}
};
var InvalidProcessor = Class.create();
InvalidProcessor.prototype = Object.extend(new Processor(), 
{
	initialize:function(element, field, validator)
	{
		this.invalidInitialize(element, field, validator);
	},
	invalidInitialize:function(element, field, validator)
	{
		this.element = element;
		this.field = field;
		this.validator = validator;
	},
	process:function()
	{
		this.defaultProcess();
	},
	defaultProcess:function()
	{
		if (this.element.style.display == 'none')//对于不可见的元素,不处理
        {
            return;
        }
        try
	    {
	        //this.element.select(true);
	    }
	    catch (e)
	    {}
	    try
	    {
	        //this.element.focus(true);
	    } 
	    catch (e)
	    {}
	}
});
var TextInvalidProcessor = Class.create();
TextInvalidProcessor.prototype = Object.extend(new InvalidProcessor(), 
{
	initialize:function(element, field, validator)
	{
		this.invalidInitialize(element, field, validator);
	},
	process:function()
	{
		this.defaultProcess();
		var s = "<span>" + this.validator.getMessage(this.field.label) + "</span>";
		_insertAfter_(this.element, s);
        _next_(this.element, 0).name = validateSpanNameOfErrorMsg;
        _addClassName_(_next_(this.element, 0), classNameOfValidateErrorMsg);
        _addClassName_(this.element, classNameOfValidateErrorInput);
	}
});
var AlertInvalidProcessor = Class.create();
AlertInvalidProcessor.prototype = Object.extend(new InvalidProcessor(), 
{
	initialize:function(element, field, validator)
	{
		this.invalidInitialize(element, field, validator);
	},
	process:function()
	{
		this.defaultProcess();
		_addClassName_(this.element, classNameOfValidateErrorInput);
		
		var s = "<span></span>";
		_insertAfter_(this.element, s);
        _next_(this.element, 0).name = validateSpanNameOfErrorMsg;
		
        alert(this.validator.getMessage(this.field.label));
	}
});
var InvalidProcessorFactory = Class.create();
InvalidProcessorFactory.prototype =
{
	initialize:function()
	{},
	create:function(element, field, validator)
	{
		if (validateErrorMsgDisplayStyle == 'alert')
		{
			return new AlertInvalidProcessor(element, field, validator);
		}
		else
		{
			return new TextInvalidProcessor(element, field, validator);
		}
	}
};
/**
 * @author Tanyaowu
 * @version 1.0
 * @date 2008-07-25
 */
var BaseValidator = Class.create();
BaseValidator.prototype = {
	initialize : function() {
		this.baseInitialize();
	},
	baseInitialize : function() {
		this.fieldArray = [];
		this.message = "";
		this.messageParams = [];
		this.isInFactory = false;// 本验证器是否已经在验证器工厂中了.false:不在工厂中;true:已在工厂中.
	},
	/**
	 * 子类实现这个方法,用于验证串
	 * 
	 * @param: str 需要被验证的串
	 * @return: true:验证通过; false:验证未通过
	 */
	validate : function(str) {
		return true;
	},
	/**
	 * 当添加后做些事情,子类视情况实现该函数,如Required验证器,需要在字段后面加上红色的星号
	 */
	doAfterAdd : function() {
		return;
	},
	/**
	 * 当移除后做些事情,子类视情况实现该函数,如Required验证器,需要去掉后面的红星号
	 */
	doAfterRemove : function() {
		this.clearMessage();
		return;
	},
	validateAll : function() {
		return this.validateByFilter(new DefaultFilter(null));
	},
	validateByFilter : function(filter) {
		var ret = true;
		for (var i = 0; i < this.fieldArray.length; i++) {
			var elements;
			if (this.fieldArray[i].name != null) {
				elements = document.getElementsByName(this.fieldArray[i].name);
			} else if (this.fieldArray[i].id != null) {
				elements = []
				elements.push(document.getElementById(this.fieldArray[i].id));
			}

			if (elements) {
				for (var j = 0; j < elements.length; j++) {
					/** 不需要验证或者验证通过则继续下一个元素的处理 */
					if ((!filter.filter(elements[j]))
							|| (this.validate(elements[j].value))) {
						continue;
					} else {
						this.processInvalid(elements[j], this.fieldArray[i]);
						ret = false;
						if (!validateIsDisplayAllError) {
							return false;
						}
					}
				}
			}
		}
		return ret;
	},
	/**
	 * 只验证formNames指定的form
	 * 
	 * @param formName
	 *            表单名字
	 */
	validateForm : function(formNames) {
		return this.validateByFilter(new FormFilter(formNames));
	},
	/**
	 * 移除字段 用法:xx.remove("name1", "name2", "name3"...);
	 */
	remove : function() {
		for (var i = 0; i < arguments.length; i++) {
			for (var j = 0; j < this.fieldArray.length; j++) {
				if (this.fieldArray[j].name == arguments[i]) {
					this.fieldArray[j].name = null;
				}
			}
		}
		var temp = [];
		for (var i = 0; i < this.fieldArray.length; i++) {
			if (this.fieldArray[i].id != null || this.fieldArray[i].name != null ) {
				temp.push(this.fieldArray[i]);
			}
		}
		this.fieldArray = temp;
		this.doAfterRemove();
		return this;
	},
	/**
	 * 移除字段 用法:xx.remove("id1", "id2", "id3"...);
	 */
	removeId : function() {
		for (var i = 0; i < arguments.length; i++) {
			for (var j = 0; j < this.fieldArray.length; j++) {
				if (this.fieldArray[j].id == arguments[i]) {
					this.fieldArray[j].id = null;
				}
			}
		}
		var temp = [];
		for (var i = 0; i < this.fieldArray.length; i++) {
			if (this.fieldArray[i].id != null || this.fieldArray[i].name != null ) {
				temp.push(this.fieldArray[i]);
			}
		}
		
		this.fieldArray = temp;
		this.doAfterRemove();
		return this;
	},
	/**
	 * 移除所有字段 用法:xxValidator.removeAll();
	 */
	removeAll : function() {
		this.fieldArray = [];
	},
	/**
	 * 将要验证的字段加到验证器中 用法:xx.add("name1", "name2", "name3"...);
	 */
	add : function() {
		var startIndex = this.fieldArray.length;
		for (var i = 0; i < arguments.length; i++) {
			if (this.checkUnique(arguments[i])) {
				var name;
				if (typeof arguments[i] == 'string') {
					this.fieldArray[i + startIndex] = new Field("",
							arguments[i]);
					name = arguments[i];
				} else {
					this.fieldArray[i + startIndex] = arguments[i];
					name = arguments[i].name;
				}

				var es = document.getElementsByName(name);
				if (es) {
					for (var j = 0; j < es.length; j++) {
						talent_Util_addEvent(es[j]);
					}
				}
			}
		}
		this.doAfterAdd();

		if (!this.isInFactory)// 必要时添加验证器到工厂中
		{
			validatorFactory.add(this);
			this.isInFactory = true;
		}
		return this;
	},
	/**
	 * 将要验证的字段加到验证器中 用法:xx.addId("id1", "id2", "id3"...);
	 */
	addId : function() {
		var startIndex = this.fieldArray.length;
		for (var i = 0; i < arguments.length; i++) {
			var id;
			if (typeof arguments[i] == 'string') {
				id = arguments[i];
			} else {
				id = arguments[i].id;
			}

			var theObj = document.getElementById(id);
			var theName = theObj.name;
			if (this.checkUnique(theName) && this.checkUniqueForId(id)) {
				if (typeof arguments[i] == 'string') {
					this.fieldArray[i + startIndex] = new Field("", null,
							arguments[i]);
				} else {
					this.fieldArray[i + startIndex] = arguments[i];
				}

				talent_Util_addEvent(theObj);
			}
		}
		this.doAfterAdd();

		if (!this.isInFactory)// 必要时添加验证器到工厂中
		{
			validatorFactory.add(this);
			this.isInFactory = true;
		}
		return this;

	},
	/**
	 * 检查字段的唯一性
	 * 
	 * @return true: 表示已注册的字段中不存在相同name的,此时可以往验证器中加此name的字段; false:与true相反
	 */
	checkUnique : function(nameOrField) {
		if (nameOrField == null) {
			return true;
		}
		for (var i = 0; i < this.fieldArray.length; i++) {
			var _name = nameOrField;
			if (typeof nameOrField != 'string') {
				_name = nameOrField.name;

			}
			if (this.fieldArray[i].name == _name) {
				return false;
			}
		}
		return true;
	},
	checkUniqueForId : function(id) {
		for (var i = 0; i < this.fieldArray.length; i++) {
			if (this.fieldArray[i].id == id) {
				return false;
			}
		}
		return true;
	},
	/**
	 * 处理没有验证通过的对象,例如对这个对象进行选中,将焦点转到该对象,修改该对象的样式等
	 */
	processInvalid : function(element, field) {
		var invalidProcessor = new InvalidProcessorFactory().create(element,
				field, this);
		invalidProcessor.process();
	},
	/**
	 * 获取提示给用户的信息
	 * 
	 * @param label
	 */
	getMessage : function(label) {
		var retMessage = this.message.replace("{0}", label);
		for (var i = 1; i <= this.messageParams.length; i++) {
			var paraIndex = "{" + i + "}"; // {n}
			retMessage = retMessage.replace(paraIndex,
					this.messageParams[i - 1]);
		}
		return retMessage;
	},
	/**
	 * 清空页面上的提示信息
	 */
	clearMessage : function() {
		var spans = getByNameAndTagName(validateSpanNameOfErrorMsg, "span");
		if (spans == null) {
			return;
		}
		for (var i = 0; i < spans.length; i++) {
			try{
			_removeClassName_(_previous_(spans[i], 0), classNameOfValidateErrorInput);
			_removeClassName_(_previous_(spans[i], 1), classNameOfValidateErrorInput);
			_removeClassName_(_previous_(spans[i], 2), classNameOfValidateErrorInput);
			_removeClassName_(_previous_(spans[i], 3), classNameOfValidateErrorInput);
			}catch(e){
			
			}
			
			_remove_(spans[i]);
		}
	}
};
var Field = Class.create();
Field.prototype = {
	initialize : function(label, name, id) {
		this.label = label;
		this.name = name;
		if (arguments.length == 3) {
			this.id = id;
			this.name = null;
		} else {
			this.id = null;
		}
	},
	/**
	 * 参数为验证器
	 */
	add : function() {
		if (arguments) {
			for (var i = 0; i < arguments.length; i++) {
				arguments[i].add(this);
			}
		}
	},
	/**
	 * 参数为验证器
	 */
	remove : function() {
		if (arguments) {
			for (var i = 0; i < arguments.length; i++) {
				arguments[i].remove(this);
			}
		}
	}
};
var DefaultFilter = Class.create();
DefaultFilter.prototype = 
{
	initialize:function(params)
	{
		this.defaultInitialize(params);
	},
	defaultInitialize:function(params)
	{
		this.params = params;
	},
	/**
	 * @return true:表示需要验证,false:表示被过滤了,不需要验证.
	 */
	filter:function(element)
	{
		return true;//默认都需要验证
	}
};
var FormFilter = Class.create();
FormFilter.prototype = Object.extend(new DefaultFilter(), 
{
	initialize:function(params)
	{
		this.defaultInitialize(params);
	},
	filter:function(element)
	{
		try 
		{
			for (var i = 0; i < this.params.length; i++)
			{
				if (element.form.name == this.params[i])
				{
					return true;
				}
			}
			return false;
		}
		catch (e)
		{
			return false;
		}
	}
});
var ElementFilter = Class.create();
ElementFilter.prototype = Object.extend(new DefaultFilter(), 
{
	initialize:function(params)
	{
		this.defaultInitialize(params);
	},
	filter:function(element)
	{
		try 
		{
			for (var i = 0; i < this.params.length; i++)
			{
				if (element == this.params[i])
				{
					return true;
				}
			}
			return false;
		}
		catch (e)
		{
			return false;
		}
	}
});
var RegexValidator = Class.create();
RegexValidator.prototype = Object.extend(new BaseValidator(), {
	initialize:function()
	{
		this.regexInitialize();
	},
	regexInitialize:function()
	{
		this.baseInitialize();
		this.message = validateI18nMsgRegex;
	},
	set:function(regex, message)
	{
		this.regex = regex;
		this.messageParams[0] = message;
		return this;
	},
	validate:function(str)
	{
		return this.regex.test(str);
	}
});
var RequiredValidator = Class.create();
RequiredValidator.prototype = Object.extend(new BaseValidator(), {
			initialize : function() {
				this.requiredInitialize();
			},
			requiredInitialize : function() {
				this.baseInitialize();
				this.message = validateI18nMsgRequired;
				this.spanNameOfStar = "validatespanNameOfStar";
				this.starElement = "<span>*</span>";
			},
			validate : function(str) {
				if (str != null) {
					return (_trim_(str) != "");
				}
			},
			/**
			 * 在字段后面加上星号
			 */
			doAfterAdd : function() {
				this.clearStar();// 先清空星号
				this.addStar(); // 再加星号
				return;
			},
			/**
			 * 当注销后做些事情,子类视情况实现该函数,如Required验证器,需要去掉后面的红星号
			 */
			doAfterRemove : function() {
				this.clearStar(); // 先清空星号
				this.addStar(); // 再加星号
				this.clearMessage(); // 清空错误消息
				return;
			},
			/**
			 * 添加星号
			 */
			addStar : function() {
				for (var i = 0; i < this.fieldArray.length; i++) {
					var objs = [];
					if (this.fieldArray[i].name != null) {
						objs = document.getElementsByName(this.fieldArray[i].name);

					} else if (this.fieldArray[i].id != null) {
						objs.push(document.getElementById(this.fieldArray[i].id));
					}

					for (var j = 0; j < objs.length; j++) {
						_insertAfter_(objs[j], this.starElement);
						_next_(objs[j], 0).name = this.spanNameOfStar;
						_addClassName_(_next_(objs[j], 0), classNameOfValidateRequiredStar);
					}
				}
			},
			/**
			 * 清空星号
			 */
			clearStar : function() {
				var spans = getByNameAndTagName(this.spanNameOfStar, "span");
				if (spans == null) {
					return;
				}

				for (var i = 0; i < spans.length; i++) {
					_removeClassName_(spans[i], classNameOfValidateRequiredStar);
					spans[i].innerHTML = "";
				}
			}
		});
var EmailValidator = Class.create();
EmailValidator.prototype = Object.extend(new BaseValidator(), {
    initialize:function()
    {
        this.emailInitialize();
    },
    emailInitialize:function()
    {
        this.baseInitialize();
        this.message = validateI18nMsgEmail;
    },
    /**
     * 说明:邮箱的验证代码是直接摘自validation-framework.js,非本人所写
     */
    validate:function(emailStr)
    {
       if (emailStr == null || emailStr == "")
       {
          return true;//不验证为空的串
       }
       var emailPat=/^(.+)@(.+)$/;
       var specialChars="\\(\\)<>@,;:\\\\\\\"\\.\\[\\]";
       var validChars="\[^\\s" + specialChars + "\]";
       var quotedUser="(\"[^\"]*\")";
       var ipDomainPat=/^(\d{1,3})[.](\d{1,3})[.](\d{1,3})[.](\d{1,3})$/;
       var atom=validChars + '+';
       var word="(" + atom + "|" + quotedUser + ")";
       var userPat=new RegExp("^" + word + "(\\." + word + ")*$");
       var domainPat=new RegExp("^" + atom + "(\\." + atom + ")*$");
       var matchArray=emailStr.match(emailPat);
       if (matchArray == null) {
           return false;
       }
       var user=matchArray[1];
       var domain=matchArray[2];
       if (user.match(userPat) == null) {
           return false;
       }
       var IPArray = domain.match(ipDomainPat);
       if (IPArray != null) {
           for (var i = 1; i <= 4; i++) {
              if (IPArray[i] > 255) {
                 return false;
              }
           }
           return true;
       }
       var domainArray=domain.match(domainPat);
       if (domainArray == null) {
           return false;
       }
       var atomPat=new RegExp(atom,"g");
       var domArr=domain.match(atomPat);
       var len=domArr.length;
       if ((domArr[domArr.length-1].length < 2) ||
           (domArr[domArr.length-1].length > 3)) {
           return false;
       }
       if (len < 2) {
           return false;
       }
       return true;
    }
});
var DatetimeValidator = Class.create();
DatetimeValidator.prototype = Object.extend(new BaseValidator(), {

    initialize:function()
    {
        this.datetimeInitialize();
    },
    datetimeInitialize:function()
    {
        this.baseInitialize();
        this.message = validateI18nMsgDatetime;
    },
    set:function(pattern)
    {
    	this.pattern = pattern;
    	this.messageParams[0] = pattern;
    	return this;
    },
    /**
     * 说明:日期的验证代码是直接摘自validation-framework.js,略作修改,非本人所写
     */
    validate:function(value)
    {
        if (value == null || value == "")
        {
           return true;//不验证为空的串
        }
        
        var datePattern = this.pattern;//params[0];
        var MONTH = "mm";
        var DAY = "dd";
        var YEAR = "yyyy";
        var orderMonth = datePattern.indexOf(MONTH);
        var orderDay = datePattern.indexOf(DAY);
        var orderYear = datePattern.indexOf(YEAR);
        var bValid = true;
        var dateRegexp = null;
        
        if ((orderDay < orderYear && orderDay > orderMonth)) {
            var iDelim1 = orderMonth + MONTH.length;
               var iDelim2 = orderDay + DAY.length;
               var delim1 = datePattern.substring(iDelim1, iDelim1 + 1);
               var delim2 = datePattern.substring(iDelim2, iDelim2 + 1);
               if (iDelim1 == orderDay && iDelim2 == orderYear) {
                dateRegexp = new RegExp("^(\\d{2})(\\d{2})(\\d{4})$");
               } else if (iDelim1 == orderDay) {
                dateRegexp = new RegExp("^(\\d{2})(\\d{2})[" + delim2 + "](\\d{4})$");
               } else if (iDelim2 == orderYear) {
                dateRegexp = new RegExp("^(\\d{2})[" + delim1 + "](\\d{2})(\\d{4})$");
               } else {
                dateRegexp = new RegExp("^(\\d{2})[" + delim1 + "](\\d{2})[" + delim2 + "](\\d{4})$");
               }
        
               var matched = dateRegexp.exec(value);
               if(matched != null) {
                if (!this.isValidDate(matched[2], matched[1], matched[3])) {
                       bValid =  false;
                }
               } else {
                   bValid =  false;
               }
           } else if ((orderMonth < orderYear && orderMonth > orderDay)) { 
            var iDelim1 = orderDay + DAY.length;
               var iDelim2 = orderMonth + MONTH.length;
               var delim1 = datePattern.substring(iDelim1, iDelim1 + 1);
               var delim2 = datePattern.substring(iDelim2, iDelim2 + 1);
               if (iDelim1 == orderMonth && iDelim2 == orderYear) {
                dateRegexp = new RegExp("^(\\d{2})(\\d{2})(\\d{4})$");
               } else if (iDelim1 == orderMonth) {
                dateRegexp = new RegExp("^(\\d{2})(\\d{2})[" + delim2 + "](\\d{4})$");
               } else if (iDelim2 == orderYear) {
                dateRegexp = new RegExp("^(\\d{2})[" + delim1 + "](\\d{2})(\\d{4})$");
               } else {
                dateRegexp = new RegExp("^(\\d{2})[" + delim1 + "](\\d{2})[" + delim2 + "](\\d{4})$");
               }
               var matched = dateRegexp.exec(value);
            if(matched != null) {
                if (!this.isValidDate(matched[1], matched[2], matched[3])) {
                    bValid = false;
                   }
               } else {
                bValid = false;
               }
           } else if ((orderMonth > orderYear && orderMonth < orderDay)) {
            var iDelim1 = orderYear + YEAR.length;
               var iDelim2 = orderMonth + MONTH.length;
               var delim1 = datePattern.substring(iDelim1, iDelim1 + 1);
        
               var delim2 = datePattern.substring(iDelim2, iDelim2 + 1);
               if (iDelim1 == orderMonth && iDelim2 == orderDay) {
                dateRegexp = new RegExp("^(\\d{4})(\\d{2})(\\d{2})$");
               } else if (iDelim1 == orderMonth) {
                dateRegexp = new RegExp("^(\\d{4})(\\d{2})[" + delim2 + "](\\d{2})$");
               } else if (iDelim2 == orderDay) {
                dateRegexp = new RegExp("^(\\d{4})[" + delim1 + "](\\d{2})(\\d{2})$");
               } else {
                dateRegexp = new RegExp("^(\\d{4})[" + delim1 + "](\\d{2})[" + delim2 + "](\\d{2})$");
               }
            var matched = dateRegexp.exec(value);
               if(matched != null) {
                if (!this.isValidDate(matched[3], matched[2], matched[1])) {
                       bValid =  false;
                   }
               } else {
                   bValid =  false;
               }
           } else {
               bValid =  false;
           }
        return bValid;
    },
    isValidDate:function(day, month, year)
    {
		if (month < 1 || month > 12) 
		{
			return false;
		}
		if (day < 1 || day > 31)
		{
			return false;
		}
		if ((month == 4 || month == 6 || month == 9 || month == 11) &&(day == 31))
		{
			return false;
		}
		if (month == 2) 
		{
			var leap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
			if (day>29 || (day == 29 && !leap))
			{
				return false;
			} 
	    }
		return true;
	}
});
var NumValidator = Class.create();
NumValidator.prototype = Object.extend(new BaseValidator(), {
	initialize:function()
	{
		this.baseInitialize();
		this.message = validateI18nMsgNum;
	},
	validate:function(str)
	{
		return this.validateNum(str);
	},
	validateNum:function(str)
	{
		if (str == null || str == "")
		{
			return true;//不验证为空的串
		}
		try 
		{
			var test = (eval('str >= 0 || str <= 0'));
			return test;
		}
		catch (e)
		{
			return false;
		}
		return true;
	}
});
var IntValidator = Class.create();
IntValidator.prototype = Object.extend(new NumValidator(), {
	initialize:function()
	{
		this.baseInitialize();
		this.message = validateI18nMsgInt;
	},
	validate:function(str)
	{
		return this.validateInt(str);
	},
	validateInt:function(str)
	{
		if (str == null || str == "")
		{
			return true;//不验证为空的串
		}
		try 
		{
			if (this.validateNum(str))
			{
				var test = (str % 10) + " ";
				if (test.indexOf(".") == -1)
				{
					return true;
				}
				else 
				{
					return false;
				}
			}
			else
			{
				return false;
			}
		}
		catch (e)
		{
			return false;
		}
	}
});
var NumRangeValidator = Class.create();
NumRangeValidator.prototype = Object.extend(new NumValidator(), {
	initialize:function()
	{
		this.baseInitialize();
		this.message = validateI18nMsgNumRange;
	},
	/**
	 * 设置最小值,"--"表示无穷小
	 */
	setMin:function(min)
	{
		this.min = min;
		if (min == '--')//无穷小
		{
			if (this.max == "++")
			{
				this.message = validateI18nMsgNumRangeNum;
			}
			else
			{
				this.message = validateI18nMsgNumRangeMin;
				this.messageParams[0] = this.max;
			}
			
		}else
		{
			this.messageParams[0] = min;
		}
	},
	/**
	 * 设置最大值,"++"表示无穷大
	 */
	setMax:function(max)
	{
		this.max = max;
		if (max == '++')
		{
			if (this.min == "--")
			{
				this.message = validateI18nMsgNumRangeNum;
			}
			else
			{
				this.message = validateI18nMsgNumRangeMax;
				this.messageParams[0] = this.min;
			}
		}
		else
		{
			if (this.min == "--")
			{
				this.messageParams[0] = max;
			}
			else
			{
				this.messageParams[1] = max;
			}
			
		}
	},
	set:function(min, max)
	{
		this.setMin(min);
		this.setMax(max);
		return this;
	},
	validate:function(str)
	{
		if (str == null || str == "")
		{
			return true;//不验证为空的串
		}
		if (!this.validateNum(str))//必须为数字,否则验证不通过
		{
			return false;
		}
		try 
		{
			if (this.max == "++" && this.min == "--")
			{
				return true;
			}
			
			
			if (this.max == "++")
			{
				if (eval(str) < eval(this.min))
				{
					return false;
				}else 
				{
					return true;
				}
			}
			
			if (this.min == "--")
			{
				if (eval(str) > eval(this.max))
				{
					return false;
				}else 
				{
					return true;
				}
			}
			
			if (eval(str) > eval(this.max) || eval(str) < eval(this.min))
			{
				return false;
			}
			return true;
		}
		catch (e)
		{
			return false;
		}
	}
});
var CompareValidator = Class.create();
CompareValidator.prototype = Object.extend(new BaseValidator(), {
	initialize : function() {
		this.compareInitialize();
	},
	compareInitialize : function() {
		this.baseInitialize();

	},
	/**
	 * @param compareType
	 *            比较类型 'n':数字比较; 'v':字符串比较
	 * @param operator
	 *            比较符,可以为'<','<=','==','!=','>','>='
	 * @param fieldOrValue
	 *            被比较的字段或值
	 * @param isShowComparedValue
	 *            是否显示被比较的值 举例: var field1 = new Field("用户名", "loginName"); new
	 *            CompareValidator().set('n','>',field1);//要求添加此验证器的字段必须大于field1的值
	 */
	set : function(compareType, operator, fieldOrValue, isShowComparedValue) {
		this.compareType = compareType;
		this.operator = operator;
		this.comparedField = null;
		this.comparedValue = null;
		this.isShowComparedValue = true;
		this.messageParams[0] = validateOperatorLabelMap[this.operator];
		if (typeof fieldOrValue == "string" || typeof fieldOrValue == 'number') {
			this.comparedValue = fieldOrValue;
			if (typeof fieldOrValue == 'number'){
				this.compareType = 'n';
			}else if (typeof fieldOrValue == "string" ){
				this.compareType = 'v';
			}
		} else {
			this.comparedField = fieldOrValue;
			this.messageParams[1] = fieldOrValue.label;
		}
		if (arguments.length == 4) {
			this.isShowComparedValue = isShowComparedValue;
		}

		if (!this.isShowComparedValue) {
			this.message = validateI18nCompare;
		} else if (compareType == 'n' && this.comparedField) {
			this.message = validateI18nNumCompare;
		} else if (compareType == 'v' && this.comparedField) {
			this.message = validateI18nStringCompare;
		} else if (compareType == 'n' && this.comparedValue) {
			this.message = validateI18nNumValueCompare;
		} else if (compareType == 'v' && this.comparedValue) {
			this.message = validateI18nStringValueCompare;
		} else {
			alert("验证框架使用错误:CompareValidator的比较类型不支持'" + compareType + "'");
		}
		return this;
	},
	validateByFilter : function(filter) {
		var ret = true;
		for (var i = 0; i < this.fieldArray.length; i++) {
			var elements;
			if (this.fieldArray[i].name != null) {
				elements = document.getElementsByName(this.fieldArray[i].name);
			} else if (this.fieldArray[i].id != null) {
				elements = []
				elements.push(document.getElementById(this.fieldArray[i].id));
			}
			if (elements) {
				for (var j = 0; j < elements.length; j++) {
					/** 不需要验证或者验证通过则继续下一个元素的处理 */
					if ((!filter.filter(elements[j]))
							|| (this.validate(elements[j].value, j))) {
						continue;
					} else {
						this.processInvalid(elements[j], this.fieldArray[i]);
						ret = false;
						if (!validateIsDisplayAllError) {
							return false;
						}
					}
				}
			}
		}
		return ret;
	},
	validate : function(str, index) {
		if (str == null || str == "") {
			return true;
		}

		var comparedValue;// = (elements[index]) ? elements[index].value :
		// elements[0].value;//"";//elements[index].value;
		if (this.comparedValue) {
			comparedValue = this.comparedValue;
			if (this.isShowComparedValue) {
				this.messageParams[1] = "<span class='validate_comparevalue'>"
						+ comparedValue + "</span>";
			} else {
				this.messageParams[2] = "";
			}
		} else {
			var elements = document.getElementsByName(this.comparedField.name);
			comparedValue = (elements[index])
					? elements[index].value
					: elements[0].value;// "";//elements[index].value;

			if (this.isShowComparedValue) {
				this.messageParams[2] = "<span class='validate_comparevalue'>"
						+ comparedValue + "</span>";
			} else {
				this.messageParams[2] = "";
			}
		}

		if (comparedValue == null || comparedValue == "") {
			return true;
		}

		var s = null;
		if (this.compareType == "n")// 是数字比较
		{
			var numV = new NumValidator();
			if ((!numV.validate(str)) || (!numV.validate(comparedValue)))// 不是数字则验证不通过
			{
				return false;
			}

			s = str + this.operator + comparedValue;
		} else if (this.compareType == "v")// 是字符串比较
		{
			s = "\"" + str + "\"" + this.operator + "\"" + comparedValue + "\"";
		}
		return eval(s) == true;
	}
});
var IpValidator = Class.create();
IpValidator.prototype = Object.extend(new RegexValidator(), {
	initialize:function()
	{
		this.ipInitialize();
	},
	ipInitialize:function()
	{
		this.baseInitialize();
		this.message = validateI18nMsgIp;
		this.regex = /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/;
	}
});
var ValidatorFactory = Class.create();
ValidatorFactory.prototype = {
	initialize : function() {
		this.validatorArray = [];
	},
	/**
	 * 移除所有验证器
	 */
	removeAll : function() {
		for ( var i = 0; i < this.validatorArray.length; i++) {
			this.validatorArray[i].removeAll();
		}
	},
	/**
	 * 用法:validatorFactory.add(validator1, validator2,validator3... ...
	 * validatorx);
	 */
	add : function() {
		var startIndex = this.validatorArray.length;
		for ( var i = 0; i < arguments.length; i++) {
			this.validatorArray[i + startIndex] = arguments[i];
		}
	},
	validate : function() {
		return this.validateByFilter(new DefaultFilter(null));
	},
	validateByFilter : function(filter) {
		var ret = true;
		var baseValidator = new BaseValidator();
		baseValidator.clearMessage();
		for ( var i = 0; i < this.validatorArray.length; i++) {
			if (!this.validatorArray[i].validateByFilter(filter)) {
				ret = false;
				if (!validateIsDisplayAllError) {
					return false;
				}
			}
		}
		return ret;
	},
	validateForm : function(formNames) {
		return this.validateByFilter(new FormFilter(formNames));
	},
	validateElement : function(element) {
		return this.validateByFilter(new ElementFilter(element));
	}
};
var validatorFactory = new ValidatorFactory();
