package com.wjj.cwz.service.flow;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.wjj.cwz.core.frame.Page;
import com.wjj.cwz.dao.SimpleHibernateDao;
import com.wjj.cwz.dao.flow.FlowProcessDao;
import com.wjj.cwz.entity.FlowProcess;
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

	private static Logger logger = LoggerFactory.getLogger(FlowProcessService.class);
	
	@Autowired
	private FlowProcessDao flowProcessDao;
	
	@Override
	public SimpleHibernateDao getDao() {
		return flowProcessDao;
	}	
	
	//待办流程查询
	public Page<FlowProcess> getWait(Page<FlowProcess> page, Map<String, Object> map){
		StringBuilder hql = new StringBuilder();
		hql.append("from FlowProcess fp where fp.id in (");
		hql.append(" select flowProcessId from FlowTask ft");
		hql.append(" where ft.taskStatus in('Ready','Reserved') and ft.actor = :actor");
		hql.append(")");
		return getPage(hql.toString(), page, map);
	}
}
