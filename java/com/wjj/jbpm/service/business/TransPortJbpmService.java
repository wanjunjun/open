package com.wjj.jbpm.service.business;

import com.wjj.jbpm.service.BaseJbpmService;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-5-7
 * 
 */
public class TransPortJbpmService extends BaseJbpmService{

	@Override
	protected String[] getProcessPaths() {
		return new String[]{"flow/transport.bpmn"};
	}

	@Override
	protected String getBPMN() {
		return "wbpm.transport";
	}

}
