package com.wjj.cwz.web.user;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.wjj.cwz.core.frame.Page;
import com.wjj.cwz.core.util.Constants;
import com.wjj.cwz.core.util.JsonUtils;
import com.wjj.cwz.entity.Role;
import com.wjj.cwz.entity.User;
import com.wjj.cwz.service.user.RoleService;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-4-28
 * 
 */
@Controller
public class RoleAction {
	@Autowired
	private RoleService roleService;
	
	
	@RequestMapping(value="/role/getTree")
	public String getTree(Model model){
		model.addAttribute("roleTree", roleService.getRoleTree());
		return "base/role/tree";
	}
	
	@RequestMapping(value="/role/crud")
	@ResponseBody
	public String crud(Role role,String oper){
		if(StringUtils.equals(oper, Constants.DEL_OPER)){
			String[] ids = StringUtils.split(role.getIds(), Constants.DEFAULT_SPLIT);
			for(String id : ids){
				roleService.delete(Long.parseLong(id));
			}			
		}else{
			roleService.merge(role);
		}
		return Constants.AJAX_SUCCESS;
	}
	
	//查询角色关联的用户
	@RequestMapping(value="/role/getRoleLink")
	@ResponseBody
	public Map<String,Object> getRoleLink(HttpServletRequest request,Long roleId,String type,Model model){
		Page<Object> pageBean = new Page<Object>();
		//int pageNo=Integer.parseInt(request.getParameter("page"));
		int pageSize=Integer.parseInt(request.getParameter("rows"));
		pageBean.setPageNo(1);
		pageBean.setPageSize(pageSize);
		List<Object> totallinks = roleService.getWithLink(roleId);
		pageBean.setResult(totallinks);
		pageBean.setTotalCount(totallinks.size());
				
		return JsonUtils.getPageGrid(pageBean);
	}
	
	//角色关联用户或用户组方法
	@RequestMapping(value="/role/addRoleLink")
	@ResponseBody
	public String addRoleLink(Long id, String linkIds){
		roleService.addRoleLink(id, linkIds);
		return Constants.AJAX_SUCCESS;
	}	
	
	@RequestMapping(value="/role/delRoleLink")
	@ResponseBody
	public String delRoleLink(Long id, String linkIds){
		roleService.delRoleLink(id, linkIds);
		return Constants.AJAX_SUCCESS;
	}
	
	@RequestMapping(value="/role/authority")
	public String authority(Long id, Model model){
		model.addAttribute("roleId", id);	
		model.addAttribute("roles", roleService.getRoleModules(id));
		return "base/role/role_module";
	}
	
	@RequestMapping(value="/role/setRoleModule")
	@ResponseBody
	public String setRoleModule(Long roleId, String moduleIds){
		if("".equals(moduleIds.trim())){
			roleService.clearRoleModules(roleId);			
		}
		roleService.setRoleModules(roleId, moduleIds);					
		return Constants.AJAX_SUCCESS;
	}
}
