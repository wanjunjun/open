package com.wjj.cwz.web;

import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;

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
	private Logger logger = LoggerFactory.getLogger(getClass());

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
	
	public void variableHandle(Map<String, Object> variables, Object entity){
		PropertyDescriptor[] pds = BeanUtils.getPropertyDescriptors(entity.getClass());
		Object v = null;
		for(PropertyDescriptor pd : pds){
			try {
				v = pd.getReadMethod().invoke(entity);
				if(v != null){
					variables.put(pd.getName(), v);
				}
			} catch (Exception e) {
				logger.error("查询属性值错误"+pd.getName(), e);
			}			
		}
	}
}
