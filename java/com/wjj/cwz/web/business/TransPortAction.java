package com.wjj.cwz.web.business;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wjj.cwz.authorize.AuthorizeDetailImpl;
import com.wjj.cwz.core.util.SpringSecurityUtils;
import com.wjj.cwz.service.business.TransPortService;
import com.wjj.cwz.web.BaseAction;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-5-7
 * 
 */
@Controller
public class TransPortAction extends BaseAction{
	
	@Autowired
	private TransPortService transPortService;
	
	@RequestMapping(value="/business/transport/applyFlow")
	public String applyFlow(){
		AuthorizeDetailImpl user = SpringSecurityUtils.getCurrentUser();
		return "redirect:/page.do?page=business/success";
	}
}
