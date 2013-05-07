package com.wjj.cwz.service.flow;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.wjj.cwz.core.frame.Page;
import com.wjj.cwz.dao.SimpleHibernateDao;
import com.wjj.cwz.dao.flow.FlowDao;
import com.wjj.cwz.entity.Flow;
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
public class FlowService extends CommonService{

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private FlowDao flowDao;
	
	@Override
	public SimpleHibernateDao getDao() {
		return flowDao;
	}	
	
	public Page<Flow> getPage(Page<Flow> page, Map<String, Object> values){
		StringBuilder hql = new StringBuilder();
		hql.append("from Flow f where 1=1 ");
		return getPage(hql.toString(), page, values);
	}
}
