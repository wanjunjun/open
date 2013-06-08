package com.wjj.cwz.web.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.wjj.cwz.authorize.Authenticate;
import com.wjj.cwz.authorize.AuthorizeDetailImpl;
import com.wjj.cwz.core.frame.Page;
import com.wjj.cwz.core.util.Constants;
import com.wjj.cwz.core.util.JsonUtils;
import com.wjj.cwz.core.util.SpringSecurityUtils;
import com.wjj.cwz.entity.Module;
import com.wjj.cwz.entity.User;
import com.wjj.cwz.service.license.LicenseService;
import com.wjj.cwz.service.user.UserService;
import com.wjj.cwz.web.BaseAction;
import com.wjj.jbpm.service.JbpmUserService;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-2-10
 * 
 */
@Controller
public class UserAction extends BaseAction{
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private Authenticate authenticate;
	
	@Autowired
	private LicenseService licenseService;
	
	@RequestMapping(value="/index")
	public String index(){
		return "main";
	}
	
	@RequestMapping(value="/user/login")
	public String login(HttpServletRequest request){
		logger.debug("Login in .......");
		String theme = request.getParameter("theme");
		theme = "null".equals(theme)?null:theme;
		
		AuthorizeDetailImpl user = SpringSecurityUtils.getCurrentUser();
		request.getSession().setAttribute("user", user);
		
		//module role
		List<Module> modules = userService.getUserModules(user.getId());
		request.getSession().setAttribute("modules", modules);
		logger.debug("get modules of user["+user.getUsername()+"] module size:"+modules.size());
		if(StringUtils.isNotBlank(theme))
			return "main_"+theme;
		return "main";
	}
	
	@RequestMapping(value = "/user/authenticate")
	public String authenticate(HttpServletRequest request){
		String j_username = request.getParameter("j_username");
		String j_password = request.getParameter("j_password");
		String theme = request.getParameter("theme");
		Boolean is = false;
		User user = userService.authorizeUser(j_username, j_password);
		is = user != null;
		if(is){
			SpringSecurityUtils.saveUserDetailsToContext(authenticate.save(j_username), request);
			return "redirect:/user/login.do?theme="+theme;
		}
		return "redirect:/login.jsp";
	}
	
	
	@RequestMapping(value="/user/getPage")
	@ResponseBody
	public Object getPage(HttpServletRequest request, User user){
		Page<User> page = new Page<User>();
		pageHandle(request, page);
		
		Map<String, Object> values = Maps.newHashMap();
		values.put("id", user.getId());
		values.put("userName", user.getUserName());
		values.put("userCode", user.getUserCode());
		page = userService.getPage(page, values);
		return JsonUtils.getPageGrid(page);
	}
	
	@RequestMapping(value="/user/crud")
	@ResponseBody
	public String crud(User entity, String oper){
		if (StringUtils.equals(oper, Constants.DEL_OPER)){
			String[] ids = StringUtils.split(entity.getIds(), Constants.DEFAULT_SPLIT);
			for (String id : ids) {
				userService.delete(Long.parseLong(id));
			}
		}else{
			if(entity.getId() == null){
				new JbpmUserService().addUser(entity.getUserCode());
			}
			userService.merge(entity);
		}
		return Constants.AJAX_SUCCESS;
	}
	
	@RequestMapping(value="/login/getLicense")
	@ResponseBody
	public Object getLicense(HttpServletRequest request){
		Long license = licenseService.getLicense();
		return license;
	}
}
