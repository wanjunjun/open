package com.wjj.cwz.core.tag;

import java.io.IOException;
import java.io.Writer;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.google.common.collect.Lists;
import com.wjj.cwz.entity.Dictionary;
import com.wjj.cwz.service.core.DictionaryService;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create Dec 14, 2011
 * 
 */
public class DictionaryTag extends TagSupport{

	private String dtype;
	private String name;//构造下拉框的NAME属性
	private String selected;
	private String style;
	public int doStartTag() throws JspException{
		Writer out = pageContext.getOut();
		StringBuffer dom = new StringBuffer();
		dom.append("<select name=\"").append(name).append("\"");
		if(style != null){
			dom.append(" style=\"").append(style).append("\" ");
		}
		dom.append(">");
		List<Dictionary> dicts = Lists.newArrayList();
		if(dtype != null){
			ServletContext servletContext = pageContext.getServletContext();
			WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(servletContext);
			DictionaryService dictionaryService = (DictionaryService)wac.getBean("dictionaryService");
			dicts = dictionaryService.findByType(dtype);
		}
		dom.append("<option value=\"\"></option>");
		for(Dictionary dict : dicts){
			if(!StringUtils.isBlank(selected) && selected.equals(dict.getValue())){
				dom.append("<option value=\"").append(dict.getValue()).append("\" selected=\"selected\">");
			}else{
				dom.append("<option value=\"").append(dict.getValue()).append("\">");
			}			
			dom.append(dict.getLabel());
			dom.append("</option>");
		}
		dom.append("</select>");
		try {
			out.write(dom.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return SKIP_BODY;
	}

	public void setDtype(String dtype) {
		this.dtype = dtype;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setSelected(String selected) {
		this.selected = selected;
	}
	
	public void setStyle(String style) {
		this.style = style;
	}
}
