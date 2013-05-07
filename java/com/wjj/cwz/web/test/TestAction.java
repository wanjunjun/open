package com.wjj.cwz.web.test;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
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
		Map<String, List<JbpmVo>> jbpmMap = testFlowService.apply("peter");
		System.out.println(jbpmMap);
		
		return "test success";
	}
}
