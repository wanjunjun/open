package com.wjj.jbpm.service;

import java.text.DecimalFormat;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.transaction.TransactionManager;

import org.drools.KnowledgeBase;
import org.drools.persistence.jpa.JPAKnowledgeService;
import org.drools.runtime.StatefulKnowledgeSession;
import org.drools.runtime.process.NodeInstance;
import org.drools.runtime.process.ProcessInstance;
import org.drools.runtime.rule.QueryResults;
import org.jbpm.process.core.context.variable.VariableScope;
import org.jbpm.process.instance.context.variable.VariableScopeInstance;
import org.jbpm.workflow.instance.WorkflowProcessInstance;
import org.jbpm.workflow.instance.node.HumanTaskNodeInstance;
import org.jbpm.workflow.instance.node.SubProcessNodeInstance;

import bitronix.tm.TransactionManagerServices;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.wjj.cwz.core.util.Constants;
import com.wjj.jbpm.CommanWSHumanTaskHandler;
import com.wjj.jbpm.JbpmCache;
import com.wjj.jbpm.JbpmEnvironment;
import com.wjj.jbpm.entity.JbpmVo;
import com.wjj.jbpm.entity.TaskVo;


public abstract class BaseJbpmService extends JbpmEnvironment {
	
	@Override
	protected abstract String[] getProcessPaths();
	
	protected abstract String getBPMN();
	//从缓存中得到流程图解析后的对象，避免每次审批都去解析流程图
	private KnowledgeBase getKnowledgeBase(){
		KnowledgeBase kbase = null;
		Object kbase_cache = JbpmCache.getCache(getBPMN());
		if(kbase_cache == null){
			kbase = createKnowledgeBase();
			JbpmCache.addCache(getBPMN(), kbase);
		}else{
			kbase = (KnowledgeBase)kbase_cache;
		}		
		return kbase;
	}

	//流程申请
	public List<JbpmVo> apply(String itcode, String uuid) {
		StatefulKnowledgeSession ksession = null;
		try {	
			sleepRandom();
			
			
			KnowledgeBase kbase = getKnowledgeBase();
			ksession = JPAKnowledgeService.newStatefulKnowledgeSession(kbase, null, getEnv());

			CommanWSHumanTaskHandler humanTaskHandler = new CommanWSHumanTaskHandler(ksession);
			humanTaskHandler.setClient(taskClientWrapper.getTaskClient());
			humanTaskHandler.setSessionId(ksession.getId());
			ksession.getWorkItemManager().registerWorkItemHandler("Human Task", humanTaskHandler);
			humanTaskHandler.connect();			
			getParams().put("uuid", uuid); //生产uuid，标示唯一
			getParams().put("sessionId", ksession.getId());
			ProcessInstance process = ksession.createProcessInstance(getBPMN(), getParams());
			long processInstanceId = process.getId();
			ksession.insert(process);
			ksession.startProcessInstance(processInstanceId);

			try {
				Thread.sleep(1500);
			} catch (InterruptedException e1) {
				logger.error("flow apply error", e1);
			}
			
			JbpmTaskService jbpmTaskService = new JbpmTaskService();
			TaskVo taskVo = jbpmTaskService.getApplyTask(itcode, processInstanceId);
			if(taskVo == null){
				logger.error("---------查询申请流程TASK出错--------");
				return null;
			}
			taskClientWrapper.start(taskVo.getTaskId(), itcode);
			taskClientWrapper.complete(taskVo.getTaskId(), itcode, null);
			
			List<JbpmVo> jbpms = humanTaskHandler.jbpms;
			for(JbpmVo jbpmVo : jbpms){
				jbpmVo.setIsApply(Constants.APPLY_YES);
				break;
			}	
			return humanTaskHandler.jbpms;

		} finally {
			if (null != ksession) {
				ksession.dispose();
			}
			destroy();
		}
	}
	
	//流程审批
	public List<JbpmVo> approve(String itcode, String userId, JbpmVo jbpm, String oper) {
		sleepRandom();
		
		if(jbpm.getTaskId() == null){
			logger.error("--------task id can not be null-------,workitem id="+jbpm.getWorkitemId());
			return Lists.newArrayList();
		}
		StatefulKnowledgeSession ksession = null;
		try {
			KnowledgeBase kbase = getKnowledgeBase();
			ksession = JPAKnowledgeService.loadStatefulKnowledgeSession(jbpm.getSessionId(), kbase, null, getEnv());
			CommanWSHumanTaskHandler humanTaskHandler = new CommanWSHumanTaskHandler(ksession);
			humanTaskHandler.setClient(taskClientWrapper.getTaskClient());
			humanTaskHandler.setSessionId(ksession.getId());
			ksession.getWorkItemManager().registerWorkItemHandler("Human Task", humanTaskHandler);
			humanTaskHandler.connect();
									
			if(!itcode.equals(userId)){
				taskClientWrapper.delegate(jbpm.getTaskId(), userId, itcode);
			}
			taskClientWrapper.start(jbpm.getTaskId(), itcode);
			if("stop".equals(oper)){
				taskClientWrapper.stop(jbpm.getTaskId(), itcode);
			}else{
				taskClientWrapper.complete(jbpm.getTaskId(), itcode, null);
			}
			return humanTaskHandler.jbpms;
		}finally {
			if (null != ksession) {
				ksession.dispose();
			}
			destroy();
		}

	}
	
	public List<JbpmVo> sign(String itcode, String userId, JbpmVo jbpm) {
		sleepRandom();
		
		if(jbpm.getTaskId() == null){
			logger.error("--------task id can not be null-------,workitem id="+jbpm.getWorkitemId());
			return Lists.newArrayList();
		}
		StatefulKnowledgeSession ksession = null;
		try {
			KnowledgeBase kbase = getKnowledgeBase();
			ksession = JPAKnowledgeService.loadStatefulKnowledgeSession(jbpm.getSessionId(), kbase, null, getEnv());
			CommanWSHumanTaskHandler humanTaskHandler = new CommanWSHumanTaskHandler(ksession);
			humanTaskHandler.setClient(taskClientWrapper.getTaskClient());
			humanTaskHandler.setSessionId(ksession.getId());
			ksession.getWorkItemManager().registerWorkItemHandler("Human Task", humanTaskHandler);
			humanTaskHandler.connect();
			// sign	
			
			if(!itcode.equals(userId)){
				taskClientWrapper.delegate(jbpm.getTaskId(), userId, itcode);
			}
			taskClientWrapper.start(jbpm.getTaskId(), itcode);
			taskClientWrapper.skip(jbpm.getTaskId(), itcode);
			
			List<JbpmVo> jbpmVos = humanTaskHandler.jbpms;
			for (JbpmVo jbpmVo : jbpmVos) {
				jbpmVo.setSignedItcode(itcode);
			}

			return jbpmVos;
		} finally {
			if (null != ksession) {
				ksession.dispose();
			}
			destroy();
		}
	}
	
	//可修改流程变量
	public List<JbpmVo> approve(String itcode, String userId, JbpmVo jbpm, String oper, Map<String, Object> variables) {
		sleepRandom();
		
		if(jbpm.getTaskId() == null){
			logger.error("--------task id can not be null-------,workitem id="+jbpm.getWorkitemId());
			return Lists.newArrayList();
		}
		StatefulKnowledgeSession ksession = null;
		try {

			KnowledgeBase kbase = getKnowledgeBase();
			ksession = JPAKnowledgeService.loadStatefulKnowledgeSession(jbpm.getSessionId(), kbase, null, getEnv());
			CommanWSHumanTaskHandler humanTaskHandler = new CommanWSHumanTaskHandler(ksession);
			humanTaskHandler.setClient(taskClientWrapper.getTaskClient());
			humanTaskHandler.setSessionId(ksession.getId());
			ksession.getWorkItemManager().registerWorkItemHandler("Human Task", humanTaskHandler);
			humanTaskHandler.connect();

			if(variables != null){
                TransactionManager transactionManager = TransactionManagerServices.getTransactionManager();
                transactionManager.begin();
				Long processInstanceId = (Long)variables.get("mainProcessId");
				WorkflowProcessInstance wpi = (WorkflowProcessInstance)ksession.getProcessInstance(processInstanceId);
				
				for(Map.Entry<String, Object> entry :variables.entrySet()){
					wpi.setVariable(entry.getKey(), entry.getValue());
				}
				VariableScopeInstance vsi = (VariableScopeInstance)wpi.getContextInstance(VariableScope.VARIABLE_SCOPE);
				System.out.println(vsi.getVariables());
                transactionManager.commit();
			}		

			if(!itcode.equals(userId)){
				taskClientWrapper.delegate(jbpm.getTaskId(), userId, itcode);
			}
			taskClientWrapper.start(jbpm.getTaskId(), itcode);
			if("stop".equals(oper)){
				taskClientWrapper.stop(jbpm.getTaskId(), itcode);
			}else{
				taskClientWrapper.complete(jbpm.getTaskId(), itcode, null);
			}		
			
			return humanTaskHandler.jbpms;
		}catch(Exception e){
			logger.error("jbpm approve err",e);
			return null;
		} finally {
			if (null != ksession) {
				ksession.dispose();
			}
			destroy();
		}

	}
	
	//修改流程审批人
	public void modifyVariable(String itcode, JbpmVo jbpm, String oper, Map<String, Object> variables)throws Exception {
		sleepRandom();
		
		if(jbpm.getTaskId() == null){
			logger.error("--------task id can not be null-------,workitem id="+jbpm.getWorkitemId());
			return;
		}
		StatefulKnowledgeSession ksession = null;
		try {

			KnowledgeBase kbase = getKnowledgeBase();
			ksession = JPAKnowledgeService.loadStatefulKnowledgeSession(jbpm.getSessionId(), kbase, null, getEnv());
			CommanWSHumanTaskHandler humanTaskHandler = new CommanWSHumanTaskHandler(ksession);
			humanTaskHandler.setClient(taskClientWrapper.getTaskClient());
			humanTaskHandler.setSessionId(ksession.getId());
			ksession.getWorkItemManager().registerWorkItemHandler("Human Task", humanTaskHandler);
			humanTaskHandler.connect();

			if(variables != null){
                TransactionManager transactionManager = TransactionManagerServices.getTransactionManager();
                transactionManager.begin();
				Long processInstanceId = (Long)variables.get("mainProcessId");
				WorkflowProcessInstance wpi = (WorkflowProcessInstance)ksession.getProcessInstance(processInstanceId);
				String actor = (String)variables.get("actor");
				processVariableHandle(ksession, wpi, itcode, actor);
				taskClientWrapper.delegate(jbpm.getTaskId(), itcode, actor);
                transactionManager.commit();
			}

		}catch(Exception e){
			logger.error("jbpm approve err",e);
			throw e;
		} finally {
			if (null != ksession) {
				ksession.dispose();
			}
			destroy();
		}

	}
	
	private void processVariableHandle(StatefulKnowledgeSession ksession, WorkflowProcessInstance process, String itcode, String actor){
		if(itcode == null || actor == null)return;
		Collection<NodeInstance>  nodes = process.getNodeInstances();
		HumanTaskNodeInstance userTask = null;
		SubProcessNodeInstance subProcessNode = null;
		WorkflowProcessInstance subProcess = null;
		String variable = null;
		for(NodeInstance node : nodes){
			if(node instanceof HumanTaskNodeInstance){
				userTask = (HumanTaskNodeInstance)node;
				variable = (String)userTask.getHumanTaskNode().getWork().getParameters().get("ActorId");
				variable = variable.substring(variable.indexOf("{")+1,variable.indexOf("}"));
				if(itcode.equals(process.getVariable(variable))){
					process.setVariable(variable, actor);
				}
			}else if(node instanceof SubProcessNodeInstance){
				subProcessNode = (SubProcessNodeInstance)node;						
				subProcess = (WorkflowProcessInstance)ksession.getProcessInstance(subProcessNode.getProcessInstanceId());
				processVariableHandle(ksession, subProcess, itcode, actor);
			}			
		}
	}
	
	//流程审批
	public List<JbpmVo> delay(String itcode, String userId, JbpmVo jbpm, String oper) {
		sleepRandom();
		if(jbpm.getTaskId() == null){
			logger.error("--------task id can not be null-------,workitem id="+jbpm.getWorkitemId());
			return Lists.newArrayList();
		}
		StatefulKnowledgeSession ksession = null;
		try {
			KnowledgeBase kbase = getKnowledgeBase();
			ksession = JPAKnowledgeService.loadStatefulKnowledgeSession(jbpm.getSessionId(), kbase, null, getEnv());
			CommanWSHumanTaskHandler humanTaskHandler = new CommanWSHumanTaskHandler(ksession);
			humanTaskHandler.setClient(taskClientWrapper.getTaskClient());
			humanTaskHandler.setSessionId(ksession.getId());
			ksession.getWorkItemManager().registerWorkItemHandler("Human Task", humanTaskHandler);
			humanTaskHandler.connect();
		
			if("suspend".equals(oper)){
				taskClientWrapper.suspend(jbpm.getTaskId(), itcode);
			}
			else if("resume".equals(oper)){
				taskClientWrapper.resume(jbpm.getTaskId(), itcode);
			}
			return humanTaskHandler.jbpms;
		}finally {
			if (null != ksession) {
				ksession.dispose();
			}
			destroy();
		}

	}

	/**
	 * 获取流程参数的值
	 * @param sessionId
	 * @param name
	 * @param mainProcessId 父流程ID
	 * @return
	 */
	public Object getParamByName(Integer sessionId,Long mainProcessId,String name){
		sleepRandom();
		StatefulKnowledgeSession ksession = null;
		try {
			KnowledgeBase kbase = getKnowledgeBase();
			ksession = JPAKnowledgeService.loadStatefulKnowledgeSession(sessionId, kbase, null, getEnv());
			WorkflowProcessInstance wpi = (WorkflowProcessInstance)ksession.getProcessInstance(mainProcessId);
			return wpi.getVariable(name);		
		}catch (Exception e){
			logger.error("getParamByName occur  error :",e);
			return null;
		} finally {
			if (null != ksession) {
				ksession.dispose();
			}
			destroy();
		}		
	}
	
	
	public List<ProcessInstance> getProcessInstances(Integer sessionId){		
		StatefulKnowledgeSession ksession = null;
		try {
			KnowledgeBase kbase = getKnowledgeBase();
			ksession = JPAKnowledgeService.loadStatefulKnowledgeSession(sessionId, kbase, null, getEnv());
			
			QueryResults rs = ksession.getQueryResults("select si from SessionInfo si where si.id =?", sessionId);
			
			return (List<ProcessInstance>) ksession.getProcessInstances();
		}catch(Exception e){
			
		}
		return null;
		
	}
	
	
	
	private void sleepRandom(){
		Random r = new Random();	
		double temp  = r.nextDouble() * 0.5 + 0.5;
		DecimalFormat df = new DecimalFormat("0.00");
		String rmd = df.format(temp);
		Double sleepTime = new Double(rmd);
		sleepTime *= 1000;
		try {
			Thread.sleep(sleepTime.longValue());
		} catch (InterruptedException e1) {
			e1.printStackTrace();
		}
	}
	
	public void test(){
		System.out.println(123);
	}
}
