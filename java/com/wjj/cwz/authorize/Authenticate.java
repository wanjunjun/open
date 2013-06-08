package com.wjj.cwz.authorize;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.wjj.cwz.entity.User;
import com.wjj.cwz.service.user.UserService;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create Jun 8, 2013
 * 
 */
@Component
@Transactional
public class Authenticate {

	@Autowired
	private UserService userService;
	
	public UserDetails save(String userCode){
		AuthorizeDetailImpl authorizeUser = new AuthorizeDetailImpl();
		
		authorizeUser.setUserCode(userCode);
		User user = userService.findUniqueBy("userCode", userCode);
		authorizeUser.setUsername(user.getUserName());
		authorizeUser.setId(user.getId());
		authorizeUser.setPassword(user.getPasword());
		//Role 
		return authorizeUser;
	}
}
