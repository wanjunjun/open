package com.wjj.cwz.web.test;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.wjj.jbpm.entity.JbpmVo;
import com.wjj.jbpm.service.TestFlowService;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-5-5
 * 
 */
@Controller
public class TestAction {

	@RequestMapping(value="/test")
	@ResponseBody
	public String test(){
		TestFlowService testFlowService = new TestFlowService();
		Map<String, Object> params = Maps.newHashMap();
		params.put("node1", "peter");
		params.put("node2", "cwz");
		testFlowService.setParams(params);
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		List<JbpmVo> jbpmMap = testFlowService.apply("peter" , uuid);
		System.out.println(jbpmMap);
		
		return "test success";
	}
	
	@ResponseBody
	@RequestMapping(value="/test2")
	public Object test(HttpServletRequest request, String page, Model model){
		Map<String, Object> m = Maps.newHashMap();
		m.put("date", new Date());
		return m;
	}
}
