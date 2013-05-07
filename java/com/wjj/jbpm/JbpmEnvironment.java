package com.wjj.jbpm;

import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.transaction.SystemException;

import org.apache.commons.lang.StringUtils;
import org.drools.KnowledgeBase;
import org.drools.KnowledgeBaseFactory;
import org.drools.SystemEventListenerFactory;
import org.drools.base.MapGlobalResolver;
import org.drools.builder.KnowledgeBuilder;
import org.drools.builder.KnowledgeBuilderFactory;
import org.drools.builder.ResourceType;
import org.drools.compiler.ProcessBuilderFactory;
import org.drools.io.ResourceFactory;
import org.drools.runtime.Environment;
import org.drools.runtime.EnvironmentName;
import org.drools.runtime.KnowledgeSessionConfiguration;
import org.drools.runtime.process.ProcessRuntimeFactory;
import org.jbpm.process.builder.ProcessBuilderFactoryServiceImpl;
import org.jbpm.process.instance.ProcessRuntimeFactoryServiceImpl;
import org.jbpm.task.query.TaskSummary;
import org.jbpm.task.service.TaskClient;
import org.jbpm.task.service.mina.MinaTaskClientConnector;
import org.jbpm.task.service.mina.MinaTaskClientHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import bitronix.tm.BitronixTransactionManager;
import bitronix.tm.TransactionManagerServices;

import com.wjj.cwz.core.config.ConfigManager;



/** 
*
* @author "Jack Q"
* @version 
* @create 2011-11-1 上午09:53:34 
* 
*/

public abstract class JbpmEnvironment {
	
	private final static String IP_ADDRESS = "127.0.0.1";
	private final static int IP_PORT = 9123;
	
	
	
	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	private Map<String,Object> params;// 流程变量初始化

	private Environment env;

	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("org.jbpm.persistence.jpa");

	protected TaskClientWrapper taskClientWrapper;
	

	static {
		ProcessBuilderFactory.setProcessBuilderFactoryService(new ProcessBuilderFactoryServiceImpl());
		ProcessRuntimeFactory.setProcessRuntimeFactoryService(new ProcessRuntimeFactoryServiceImpl());
	}

	protected abstract String[] getProcessPaths();

	//	protected abstract EntityManagerFactory getEmf();

	public JbpmEnvironment() {

		if (null == taskClientWrapper) {
			String name = "client_"+ UUID.randomUUID().toString().replaceAll("-", "");
			TaskClient taskClient = new TaskClient(new MinaTaskClientConnector(name,
					new MinaTaskClientHandler(SystemEventListenerFactory.getSystemEventListener())));
			taskClientWrapper = new TaskClientWrapper(taskClient);
			String port = ConfigManager.getInstance().getPropertiesConfig().getProperty("jbpm.port");
			if(StringUtils.isBlank(port))port="9123";
			taskClientWrapper.connect(IP_ADDRESS, Integer.parseInt(port));
		}
	}

	protected Environment getEnv() {
//		emf = (EntityManagerFactory) JbpmCache.getCache("org.jbpm.persistence.jpa.cch");
//		if(emf == null){
//			emf = Persistence.createEntityManagerFactory("org.jbpm.persistence.jpa");
//			JbpmCache.addCache("org.jbpm.persistence.jpa.cch", emf);
//		}
		
		env = KnowledgeBaseFactory.newEnvironment();
		env.set(EnvironmentName.ENTITY_MANAGER_FACTORY, emf);
		env.set(EnvironmentName.GLOBALS, new MapGlobalResolver());
		BitronixTransactionManager userTransactionManager = TransactionManagerServices.getTransactionManager();
		try {
			userTransactionManager.setTransactionTimeout(90);
		} catch (SystemException e) {
			logger.error("BitronixTransaction set timeout error!");
		}
//		Configuration conf = TransactionManagerServices.getConfiguration();
//		conf.setServerId("jvm-1");
//		conf.setDefaultTransactionTimeout(120);
		env.set(EnvironmentName.TRANSACTION_MANAGER, userTransactionManager);
		JbpmCache.addCache("jbpm.env.cache", env);
		
		return env;
	}

	protected KnowledgeSessionConfiguration initConf() {
		Properties properties = new Properties();
		properties.put("drools.processInstanceManagerFactory",
				"org.jbpm.persistence.processinstance.JPAProcessInstanceManagerFactory");
		properties.put("drools.processSignalManagerFactory",
				"org.jbpm.persistence.processinstance.JPASignalManagerFactory");
		return KnowledgeBaseFactory.newKnowledgeSessionConfiguration(properties);
	}

	protected KnowledgeBase createKnowledgeBase() {
		KnowledgeBuilder kbuilder = KnowledgeBuilderFactory.newKnowledgeBuilder();
		for (String path : this.getProcessPaths()) {
			if (path.endsWith("bpmn")) {
				kbuilder.add(ResourceFactory.newClassPathResource(path), ResourceType.BPMN2);
			} else if (path.endsWith("drl")) {
				kbuilder.add(ResourceFactory.newClassPathResource(path), ResourceType.DRL);
			}
		}
		KnowledgeBase kbase = kbuilder.newKnowledgeBase();
		return kbase;
	}

	//通过processId查找task
	protected TaskSummary getTaskByProcessId(Long processId, List<TaskSummary> tasks) {
		TaskSummary task = null;
		for (TaskSummary taskTemp : tasks) {
			if (processId == taskTemp.getProcessInstanceId()) {
				task = taskTemp;
				break;
			}
		}
		return task;
	}
	
	public Map<String, Object> getParams() {
		return params;
	}

	public void setParams(Map<String, Object> params) {
		this.params = params;
	}

	public void destroy() {	
		try {

			if(null != taskClientWrapper){
				taskClientWrapper.disconnect();
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
