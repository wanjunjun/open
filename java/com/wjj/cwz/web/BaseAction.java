package com.wjj.cwz.web;

import javax.servlet.http.HttpServletRequest;

import com.wjj.cwz.core.frame.Page;

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
}
