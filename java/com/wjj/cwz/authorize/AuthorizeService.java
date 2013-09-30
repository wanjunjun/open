package com.wjj.cwz.authorize;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.wjj.cwz.entity.User;
import com.wjj.cwz.service.user.UserService;

public class AuthorizeService implements UserDetailsService{

	@Autowired
	private UserService userService;	

	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {		
		/**/
		AuthorizeDetailImpl authorizeUser = new AuthorizeDetailImpl();
		
		authorizeUser.setUserCode(username);
		User user = userService.findUniqueBy("userCode", username);
		authorizeUser.setUsername(user.getUserName());
		authorizeUser.setId(user.getId());
		authorizeUser.setPassword(user.getPasword());
		//Role 
		return authorizeUser;
		
	}

}
