package com.wjj.cwz.service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.wjj.cwz.core.config.FlowForm;
import com.wjj.cwz.dao.SimpleHibernateDao;
import com.wjj.cwz.dao.business.TransPortDao;
import com.wjj.cwz.entity.FlowProcess;
import com.wjj.cwz.entity.FlowTask;
import com.wjj.cwz.service.flow.FlowProcessService;
import com.wjj.cwz.service.flow.FlowTaskService;
import com.wjj.jbpm.entity.JbpmVo;
import com.wjj.jbpm.service.BaseJbpmService;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create May 7, 2013
 * 
 */
@Component
@Transactional
public abstract class CommonJbpmService extends CommonService{
	private Logger logger = LoggerFactory.getLogger(CommonJbpmService.class);

	@Autowired
	private TransPortDao transPortDao;
	
	@Autowired
	private FlowProcessService flowProcessService;
	
	@Autowired
	private FlowTaskService flowTaskService;

	@Override
	public SimpleHibernateDao getDao() {
		return transPortDao;
	}
	
	public abstract BaseJbpmService getJbpmService();
	
	public abstract String getServiceBeanId();
	
	//表单及对应的SERVICE类关系
	public FlowForm getFlowForm(){
		return FlowForm.getEnumByService(getServiceBeanId());
	}
	
	public void applyFlow(String applyUser, FlowProcess fp, Map<String, Object> variables){
		BaseJbpmService jbpmService = getJbpmService();
		jbpmService.setParams(variables);
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		List<JbpmVo> jbpmVos = jbpmService.apply(applyUser, uuid);		

		fp.setCreateTime(new Date());
		fp.setUuid(uuid);
		flowTaskService.mergeJbpmTask(jbpmVos, fp);
	}
	
	public void approveFlow(String approveUser, FlowProcess fp, String opinion, Map<String, Object> variables, String oper){
		fp = flowProcessService.get(fp.getId());
		FlowTask waitTask = getWaitTask(fp.getId(), approveUser);
		BaseJbpmService jbpmService = getJbpmService();
		JbpmVo jbpmVo = createJbpmVo(waitTask, opinion, approveUser);
		if(variables != null){
			variables.put("mainProcessId", flowTaskService.getMainProcessId(jbpmVo.getSessionId()).getProcessId());
		}
		List<JbpmVo> jbpmVos = jbpmService.approve(approveUser, approveUser, jbpmVo, oper, variables);	
		jbpmVos.add(jbpmVo);
		flowTaskService.mergeJbpmTask(jbpmVos, fp);
	}
	
	public FlowTask getWaitTask(Long flowProcessId, String actor){
		return flowTaskService.getWaitTask(flowProcessId, actor);
	}
	
	public JbpmVo createJbpmVo(FlowTask waitTask, String opinion, String approveUser){
		JbpmVo jbpmVo = new JbpmVo();
		BeanUtils.copyProperties(waitTask, jbpmVo);
		jbpmVo.setOpinion(opinion);
		jbpmVo.setActorId(approveUser);
		return jbpmVo;
	}
}
