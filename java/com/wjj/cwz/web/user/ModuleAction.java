package com.wjj.cwz.web.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.wjj.cwz.authorize.AuthorizeDetailImpl;
import com.wjj.cwz.core.frame.Page;
import com.wjj.cwz.core.util.Constants;
import com.wjj.cwz.core.util.JsonUtils;
import com.wjj.cwz.core.util.SpringSecurityUtils;
import com.wjj.cwz.entity.Module;
import com.wjj.cwz.service.user.ModuleService;
import com.wjj.cwz.web.BaseAction;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-4-28
 * 
 */
@Controller
public class ModuleAction extends BaseAction{
	
	@Autowired
	private ModuleService moduleService;

	@RequestMapping(value="/module/getPage")
	@ResponseBody
	public Object getPage(HttpServletRequest request, Module module){
		Page<Module> page = new Page<Module>();
		pageHandle(request, page);
		
		Map<String, Object> values = Maps.newHashMap();
		values.put("isParent", request.getParameter("isParent"));
		values.put("isChild", request.getParameter("isChild"));
		values.put("id", module.getId());
		values.put("name", module.getName());
		page = moduleService.getPage(page, values);
		return JsonUtils.getPageGrid(page);
	}
	
	@RequestMapping(value="/module/crud")
	@ResponseBody
	public String crud(Module entity, String oper){
		if (StringUtils.equals(oper, Constants.DEL_OPER)){
			String[] ids = StringUtils.split(entity.getIds(), Constants.DEFAULT_SPLIT);
			for (String id : ids) {
				moduleService.delete(Long.parseLong(id));
			}
		}else{
			moduleService.merge(entity);
		}
		return Constants.AJAX_SUCCESS;
	}
	
	@RequestMapping(value="/module/indexChild")
	public String indexChild(Long parentId, Model model){
		model.addAttribute("moduleId", parentId);
		return "base/module/indexChild";
	}
		
	@RequestMapping(value="/module/getModuleFZ")
	public String getModuleFZ(HttpServletRequest request,Long roleId,Module module,Model model){
		Page<Module> pageBean = new Page<Module>();
		pageBean.setPageNo(1);
		pageBean.setPageSize(1);
		List<Map<String,Object>> list = moduleService.getModuleFZ();
		model.addAttribute("list", list);
		model.addAttribute("size",list.size());
		return "base/module/moduleFZ";
	}
	
	@RequestMapping(value="/module/getChildren")
	public String getChildren(Long parentId, Model model){
		AuthorizeDetailImpl user = SpringSecurityUtils.getCurrentUser();
		List<Module> children = moduleService.getUserModuleChilds(parentId, user.getId());
		model.addAttribute("children", children);
		model.addAttribute("size", children.size());
		return "base/module/children";
	}
}
