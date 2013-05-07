package com.wjj.jbpm.service;
/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-5-5
 * 
 */
public class TestFlowService extends BaseJbpmService{

	@Override
	protected String[] getProcessPaths() {
		return new String[]{"flow/test.bpmn"};
	}

	@Override
	protected String getBPMN() {
		return "wbpm.test";
	}

}
