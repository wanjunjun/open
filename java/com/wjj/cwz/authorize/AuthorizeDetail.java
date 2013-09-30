package com.wjj.cwz.authorize;

import org.springframework.security.core.userdetails.UserDetails;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-4-29
 * 
 */
public interface AuthorizeDetail extends UserDetails{
	public Long getId();
	public String getUsername();
}
