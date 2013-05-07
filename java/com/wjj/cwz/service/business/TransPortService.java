package com.wjj.cwz.service.business;

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
import com.wjj.cwz.service.CommonJbpmService;
import com.wjj.cwz.service.flow.FlowTaskService;
import com.wjj.jbpm.entity.JbpmVo;
import com.wjj.jbpm.service.BaseJbpmService;
import com.wjj.jbpm.service.business.TransPortJbpmService;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create May 7, 2013
 * 
 */
@Component
@Transactional
public class TransPortService extends CommonJbpmService{

	@Autowired
	private TransPortDao transPortDao;
	
	@Autowired
	private FlowTaskService flowTaskService;

	@Override
	public SimpleHibernateDao getDao() {
		return transPortDao;
	}
	
	public BaseJbpmService getJbpmService(){
		return new TransPortJbpmService();
	}		
}
