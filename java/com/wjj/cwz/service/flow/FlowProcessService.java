package com.wjj.cwz.service.flow;

import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.wjj.cwz.core.config.FlowForm;
import com.wjj.cwz.core.frame.Page;
import com.wjj.cwz.core.util.SpringUtil;
import com.wjj.cwz.dao.SimpleHibernateDao;
import com.wjj.cwz.dao.flow.FlowProcessDao;
import com.wjj.cwz.dao.flow.FlowTaskDao;
import com.wjj.cwz.entity.FlowProcess;
import com.wjj.cwz.entity.FlowTask;
import com.wjj.cwz.service.CommonService;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-2-10
 * 
 */
@Component
@Transactional
public class FlowProcessService extends CommonService{

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private FlowProcessDao flowProcessDao;
	
	@Autowired
	private FlowTaskDao flowTaskDao;
	
	@Override
	public SimpleHibernateDao getDao() {
		return flowProcessDao;
	}
	
	//待办流程查询
	public Page<FlowProcess> getDraft(Page<FlowProcess> page, Map<String, Object> map){
		StringBuilder hql = new StringBuilder();
		hql.append("from FlowProcess fp where fp.formState = 'draft' and fp.user.id = :userId");
		return getPage(hql.toString(), page, map);
	}
	
	//待办流程查询
	public Page<FlowProcess> getWait(Page<FlowProcess> page, Map<String, Object> map){
		StringBuilder hql = new StringBuilder();
		hql.append("from FlowProcess fp where exists (");
		hql.append(" select flowProcessId from FlowTask ft");
		hql.append(" where ft.flowProcessId = fp.id and ft.taskStatus in ('Ready','Reserved') and ft.actor = :actor");
		hql.append(")");
		return getPage(hql.toString(), page, map);
	}
	
	//待办流程查询
	public Page<FlowProcess> getApproved(Page<FlowProcess> page, Map<String, Object> map){
		StringBuilder hql = new StringBuilder();
		hql.append("from FlowProcess fp where fp.id in (");
		hql.append(" select distinct flowProcessId from FlowTask ft");
		hql.append(" where ft.taskStatus = 'Completed' and ft.actor = :actor");
		hql.append(")");
		return getPage(hql.toString(), page, map);
	}
	
	public Object getFlowFormData(FlowProcess fp){
		Object formData = null;
		String serviceBeanId = FlowForm.getEnumByCode(fp.getFlowForm()).getService();
		Object service = SpringUtil.getInstance().getBean(serviceBeanId);
		try {
			Method method = service.getClass().getDeclaredMethod("getFormData", Long.class);
			formData = method.invoke(service, fp.getId());
		} catch (Exception e) {
			logger.error("get method getFormData error!", e);
		} 
		return formData;
	}
	
	public List<FlowTask> getProcess(Long flowProcessId){
		String hql = "from FlowTask ft where ft.flowProcessId = ? order by ft.taskId";
		return getList(hql, flowProcessId);
	}
}
