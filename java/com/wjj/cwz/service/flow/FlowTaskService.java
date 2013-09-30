package com.wjj.cwz.service.flow;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Lists;
import com.wjj.cwz.core.util.Constants;
import com.wjj.cwz.core.util.SpringUtil;
import com.wjj.cwz.dao.SimpleHibernateDao;
import com.wjj.cwz.dao.flow.FlowTaskDao;
import com.wjj.cwz.entity.FlowProcess;
import com.wjj.cwz.entity.FlowTask;
import com.wjj.cwz.service.CommonService;
import com.wjj.jbpm.entity.JbpmVo;
import com.wjj.jbpm.entity.TaskVo;
import com.wjj.jbpm.service.JbpmTaskService;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-2-10
 * 
 */
@Component
@Transactional
public class FlowTaskService extends CommonService{

	private static Logger logger = LoggerFactory.getLogger(FlowTaskService.class);
	
	@Autowired
	private FlowTaskDao flowTaskDao;
	
	private JbpmTaskService jts;
	
	@Override
	public SimpleHibernateDao getDao() {
		return flowTaskDao;
	}	
	
	private void convertTask(JbpmVo jbpm, List<Object> tasks, TaskVo taskVo, FlowProcess fp){
		FlowTask taskDb = getFlowTask(jbpm.getSessionId(),jbpm.getProcessId(),jbpm.getWorkitemId());
		taskVo = jts.getTaskByWorkItemId(jbpm.getWorkitemId(), jbpm.getProcessId());
		if(null == taskDb){
			taskDb = new FlowTask();
			taskDb.setNodeName(jbpm.getNodeName());
			taskDb.setSessionId(jbpm.getSessionId());
			taskDb.setProcessId(jbpm.getProcessId());
			taskDb.setWorkitemId(jbpm.getWorkitemId());
			taskDb.setRole(jbpm.getGroupId());
			taskDb.setActor(jbpm.getActorId());
			taskDb.setFlowProcessId(fp.getId());
			taskDb.setSignedItcode(jbpm.getSignedItcode());
			taskDb.setIsApply(StringUtils.isNotBlank(jbpm.getIsApply()) ? jbpm.getIsApply() : Constants.APPLY_NO);
			taskDb.setCreateTime(new Date());
			if (StringUtils.isNotBlank(jbpm.getIsApply())) {
				// 工作流申请节点，默认完成时间为当前时间
				taskDb.setCompleteTime(new Date());
			}
		}else{
			taskDb.setActor(jbpm.getActorId());
			// 更新审批完成时间，审批意见
			taskDb.setCompleteTime(new Date());
			taskDb.setOpinion(jbpm.getOpinion());				
		}
		if(null != taskVo) {
			taskDb.setTaskId(taskVo.getTaskId());
			taskDb.setTaskStatus(taskVo.getStatus());
		}else {
			logger.error("++++++++++++++没有找到JBPM TASK,workitemId=" + jbpm.getWorkitemId());
		}
		if (StringUtils.equalsIgnoreCase(Constants.BPM_REJECT,jbpm.getStatus()) || StringUtils.equalsIgnoreCase("Completed",jbpm.getStatus())) {
			taskDb.setTaskStatus(jbpm.getStatus());
		}
		tasks.add(taskDb);
	}
	
	public void mergeJbpmTask(List<JbpmVo> jbpmVos, FlowProcess fp){
		jts = new JbpmTaskService();
		TaskVo taskVo = null;
		List<Object> beans = Lists.newArrayList();
		beans.add(fp);
		for(JbpmVo jbpm : jbpmVos) {
			convertTask(jbpm, beans, taskVo, fp);	
		}	
		saveBean(beans);
		
	}
	
	public FlowTask getFlowTask(Integer sessionId,Long processId,Long workItemId){
		String hql = "from FlowTask where sessionId=? and processId=? and workitemId = ?";
		return (FlowTask)getDao().findUnique(hql, sessionId,processId,workItemId);
	}
	
	public FlowTask getWaitTask(Long flowProcessId, String actor){
		String hql = "from FlowTask where flowProcessId=? and actor=? and taskStatus in('Ready','Reserved')";
		return (FlowTask)getDao().findUnique(hql, flowProcessId,actor);
	}
	
	public FlowTask getMainProcessId(Integer sessionId){
		String hql = "from FlowTask where sessionId = ? and isApply = 'Yes' ";
		return (FlowTask)getDao().findUnique(hql, sessionId);
	}
}
