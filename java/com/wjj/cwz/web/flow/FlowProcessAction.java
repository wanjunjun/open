package com.wjj.cwz.web.flow;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.wjj.cwz.core.frame.Page;
import com.wjj.cwz.core.util.JsonUtils;
import com.wjj.cwz.entity.FlowProcess;
import com.wjj.cwz.service.flow.FlowProcessService;
import com.wjj.cwz.web.BaseAction;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create May 13, 2013
 * 
 */
@Controller
public class FlowProcessAction extends BaseAction{

	@Autowired
	private FlowProcessService flowProcessService;
	
	@RequestMapping(value="/flowProcess/getWaitTask")
	@ResponseBody
	public Object getWaitTask(HttpServletRequest request){
		Page<FlowProcess> page = new Page<FlowProcess>();
		pageHandle(request, page);
		Map<String, Object> map = Maps.newHashMap();
		map.put("actor", getCurrentUser().getUsername());
		page = flowProcessService.getWait(page, map);
		return JsonUtils.getPageGrid(page);
	}
	
	@RequestMapping(value="/flowProcess/getApproveTask")
	@ResponseBody
	public Object getApproveTask(HttpServletRequest request){
		Page<FlowProcess> page = new Page<FlowProcess>();
		pageHandle(request, page);
		Map<String, Object> map = Maps.newHashMap();
		map.put("actor", getCurrentUser().getUsername());
		page = flowProcessService.getWait(page, map);
		return JsonUtils.getPageGrid(page);
	}
	
	@RequestMapping(value="/flowProcess/showFlowForm")
	public String showFlowForm(FlowProcess fp, String oper, Model model){
		fp = flowProcessService.get(fp.getId());
		model.addAttribute("flowProcess", fp);
		model.addAttribute("formData", flowProcessService.getFlowFormData(fp));
		return "business/approve/"+oper+"_"+fp.getFlowForm();		
	}
	
	@RequestMapping(value="/flowProcess/showProcess")
	public String showProcess(FlowProcess fp, Model model){		
		model.addAttribute("process", flowProcessService.getProcess(fp.getId()));
		return "flow/showProcess";		
	}
}
