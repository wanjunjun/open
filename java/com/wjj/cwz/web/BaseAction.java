package com.wjj.cwz.web;

import javax.servlet.http.HttpServletRequest;

import com.wjj.cwz.authorize.AuthorizeDetailImpl;
import com.wjj.cwz.core.frame.Page;
import com.wjj.cwz.core.util.SpringSecurityUtils;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-2-11
 * 
 */
public class BaseAction {

	public <T> void pageHandle(HttpServletRequest request, Page<T> page){
		String pageNo = request.getParameter("page");
		String rows = request.getParameter("rows");
		page.setPageNo(Integer.parseInt(pageNo));
		page.setPageSize(Integer.parseInt(rows));
	}
	
	public AuthorizeDetailImpl getCurrentUser(){
		AuthorizeDetailImpl user = SpringSecurityUtils.getCurrentUser();
		return user;
	}
}
