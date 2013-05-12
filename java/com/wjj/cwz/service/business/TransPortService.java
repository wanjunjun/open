package com.wjj.cwz.service.business;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.wjj.cwz.dao.SimpleHibernateDao;
import com.wjj.cwz.dao.business.TransPortDao;
import com.wjj.cwz.entity.FlowProcess;
import com.wjj.cwz.entity.TransPort;
import com.wjj.cwz.entity.TransPortDetail;
import com.wjj.cwz.service.CommonJbpmService;
import com.wjj.cwz.service.flow.FlowProcessService;
import com.wjj.cwz.service.flow.FlowTaskService;
import com.wjj.cwz.vo.TransPortVo;
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
	@Autowired
	private FlowProcessService flowProcessService;

	@Override
	public SimpleHibernateDao getDao() {
		return transPortDao;
	}
	
	public BaseJbpmService getJbpmService(){
		return new TransPortJbpmService();
	}
	
	public void setFormData(TransPortVo tpv, TransPort tp){
		if(tpv.getItems() != null){
			List<TransPortDetail> items = tpv.getItems();
			for(TransPortDetail item : items){
				item.setTransPort(tp);
				tp.getDetails().add(item);
			}
		}
	}
	
	public void saveFlow(FlowProcess fp, TransPortVo tpv, TransPort tp){
		fp.setCompleteTime(new Date());
		tp.setFlowProcess(fp);
		flowProcessService.merge(fp);
		merge(tp);
	}
}
