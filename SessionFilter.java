package com.wjj.cwz.filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

import com.google.common.collect.Lists;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create Nov 8, 2012
 * 
 */
public class SessionFilter implements Filter {
	
	private List<String> exclusions = null; 
	private String UFS = null;

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) throws IOException, ServletException {		
		HttpServletRequest httpServletRequest = (HttpServletRequest)request;
		String servletPath = httpServletRequest.getServletPath();
//		if(servletPath.equals("/index.jsp")||servletPath.equals("/access.jsp") || servletPath.indexOf("login") != -1 || servletPath.indexOf("authenticate") != -1){
//			filterChain.doFilter(request, response);
//			return;
//		}
		String active = request.getParameter("active");
		if(StringUtils.isNotBlank(active))request.setAttribute("active", active);		
		if(isExclude(httpServletRequest)){			
			filterChain.doFilter(request, response);			
			return;
		}
		Object user = httpServletRequest.getSession().getAttribute("user");
		if(user == null){
			String targetURL = httpServletRequest.getServletPath();
			String queryString = httpServletRequest.getQueryString();
			if(StringUtils.isNotBlank(queryString)){
				targetURL += "?"+queryString;
			}
			request.setAttribute("targetURL", targetURL);
			request.getRequestDispatcher("/login.jsp").forward(request,response);
		}else{
			
			filterChain.doFilter(request, response);
		}
		
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		String exclusion = config.getInitParameter("exclusion");
		UFS = config.getInitParameter("unFileterString");
		UFS = UFS==null?"@!":UFS;
		if(StringUtils.isNotBlank(exclusion)){
			String[] exclusionArray = exclusion.split(",");
			exclusions = Arrays.asList(exclusionArray);
		}
	}

	private boolean isExclude(HttpServletRequest request){
		String servletPath = request.getServletPath();
		String queryString = request.getQueryString();
		boolean checked = false;
		for(String exc: exclusions){
			checked = servletPath.indexOf(exc) != -1;
			if(checked)break;			
		}
		if(queryString!=null){
			if(!checked)checked = queryString.indexOf(UFS) != -1;
		}
		
		return checked;
	}
}
