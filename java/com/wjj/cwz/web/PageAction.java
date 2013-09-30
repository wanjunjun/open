package com.wjj.cwz.web;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create Apr 20, 2012
 * 
 */
@Controller
public class PageAction {

	@RequestMapping(value="/page")
	public String page(HttpServletRequest request, String page, Model model){
		Enumeration<String> pns = request.getParameterNames();
		String pn = null;
		while(pns.hasMoreElements()){
			pn = pns.nextElement();
			model.addAttribute(pn, request.getParameter(pn));
		}
		return page;
	}	
}
