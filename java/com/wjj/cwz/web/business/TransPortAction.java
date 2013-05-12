package com.wjj.cwz.web.business;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.common.collect.Maps;
import com.wjj.cwz.authorize.AuthorizeDetailImpl;
import com.wjj.cwz.core.util.SpringSecurityUtils;
import com.wjj.cwz.entity.FlowProcess;
import com.wjj.cwz.entity.TransPort;
import com.wjj.cwz.service.business.TransPortService;
import com.wjj.cwz.service.flow.FlowTaskService;
import com.wjj.cwz.vo.TransPortVo;
import com.wjj.cwz.web.BaseAction;
/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-5-7
 * 
 */
@Controller
public class TransPortAction extends BaseAction{
	
	@Autowired
	private TransPortService transPortService;
	
	@Autowired
	private FlowTaskService flowTaskService;
	
	@RequestMapping(value="/business/transport/applyFlow")
	public String applyFlow(FlowProcess fp, TransPortVo tpv, TransPort tp){
		AuthorizeDetailImpl user = SpringSecurityUtils.getCurrentUser();			
						
		transPortService.setFormData(tpv, tp);
		transPortService.saveFlow(fp, tpv, tp);

		Map<String, Object> variables = Maps.newHashMap();
		variables.put("node1", user.getUsername());
		variables.put("node2", "cwz");	
		transPortService.applyFlow(user.getUsername(), fp, variables);
		return "redirect:/page.do?page=business/success";
	}
}
