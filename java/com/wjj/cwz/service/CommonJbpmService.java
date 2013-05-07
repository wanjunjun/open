package com.wjj.cwz.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Maps;
import com.wjj.cwz.authorize.AuthorizeDetail;
import com.wjj.cwz.dao.SimpleHibernateDao;
import com.wjj.cwz.dao.business.TransPortDao;
import com.wjj.cwz.entity.Flow;
import com.wjj.cwz.entity.FlowProcess;
import com.wjj.cwz.entity.User;
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

	@Autowired
	private TransPortDao transPortDao;
	
	@Autowired
	private FlowTaskService flowTaskService;

	@Override
	public SimpleHibernateDao getDao() {
		return transPortDao;
	}
	
	public abstract BaseJbpmService getJbpmService();
	
	public void applyFlow(AuthorizeDetail user, Flow flow, Map<String, Object> param){
		BaseJbpmService jbpmService = getJbpmService();
		Map<String, List<JbpmVo>> jbpmMap = jbpmService.apply(user.getUsername());
		String uuid = null;
		List<JbpmVo> jbpmVos = null;
		for (Map.Entry<String, List<JbpmVo>> entry : jbpmMap.entrySet()) {
			uuid = entry.getKey();
			jbpmVos = entry.getValue();
		}
		Map<String, Object> variables = Maps.newHashMap();
		jbpmService.setParams(variables);
		
		FlowProcess fp = new FlowProcess();
		User applyUser = new User();
		applyUser.setId(user.getId());
		fp.setUser(applyUser);
		fp.setFlow(flow);
		fp.setCreateTime(new Date());
		fp.setUuid(uuid);
		flowTaskService.mergeJbpmTask(jbpmVos, fp);
	}
}
