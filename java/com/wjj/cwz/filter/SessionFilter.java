package com.wjj.cwz.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create Nov 8, 2012
 * 
 */
public class SessionFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) throws IOException, ServletException {		
		HttpServletRequest httpServletRequest = (HttpServletRequest)request;
		String servletPath = httpServletRequest.getServletPath();
		if(servletPath.equals("/index.jsp")||servletPath.equals("/access.jsp") || servletPath.indexOf("login") != -1 || servletPath.indexOf("authenticate") != -1){
			filterChain.doFilter(request, response);
			return;
		}
		Object user = httpServletRequest.getSession().getAttribute("user");
		if(user == null){
			request.getRequestDispatcher("/login.jsp").forward(request,response);
		}else{
			//user module role check
//			String moduleId = httpServletRequest.getParameter("moduleId");
//			if(StringUtils.isNotBlank(moduleId)){
//				ModuleFunction current_module = new ModuleFunction();
//				current_module.setId(Long.parseLong(moduleId));
//				List<ModuleFunction> moduleFunctions = (List<ModuleFunction>)httpServletRequest.getSession().getAttribute("moduleFunctions");
//				if(moduleFunctions == null || !moduleFunctions.contains(current_module)){
//					request.getRequestDispatcher("/noPermission.jsp").forward(request,response);
//				}
//			}			
			filterChain.doFilter(request, response);
		}
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
