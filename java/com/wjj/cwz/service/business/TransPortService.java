package com.wjj.cwz.service.business;

import static java.util.Locale.ENGLISH;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import com.wjj.cwz.dao.SimpleHibernateDao;
import com.wjj.cwz.dao.business.TransPortDao;
import com.wjj.cwz.entity.FlowProcess;
import com.wjj.cwz.entity.TransPort;
import com.wjj.cwz.entity.TransPortDetail;
import com.wjj.cwz.service.CommonJbpmService;
import com.wjj.cwz.service.flow.FlowProcessService;
import com.wjj.cwz.service.flow.FlowTaskService;
import com.wjj.cwz.vo.CommonVo;
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
	
	@Override
	public String getServiceBeanId() {
		String cn = getClass().getSimpleName();
		return cn.substring(0, 1).toLowerCase(ENGLISH) + cn.substring(1);
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
		fp.setFlowForm(getFlowForm().getCode());
		tp.setFlowProcess(fp);
		flowProcessService.merge(fp);
		merge(tp);
	}
		
	public TransPort getFormData(Long flowProcessid){
		TransPort tp = null;
		String hql = "from TransPort tp where tp.flowProcess.id = ?";
		List<TransPort> list = getDao().find(hql, flowProcessid);
		if(list.size() == 0){
			return null;
		}
		tp = list.get(0);
		if(tp.getDetails().size() == 0){
			tp.setDetails(tp.getDetails());
		}
		return tp;
	}
	
	public void removeItem(Long flowProcessid){
		if(flowProcessid == null)return;
		TransPort tp = getFormData(flowProcessid);
		Set<TransPortDetail> items = tp.getDetails();
		List<TransPortDetail> removes = Lists.newArrayList();
		for(TransPortDetail item : items){
			removes.add(item);
		}
		for(TransPortDetail item : removes){
			items.remove(item);
			delete(item);
		}		
	}
	
	public void updateFormData(FlowProcess fp, CommonVo cv){
		TransPort tp = getFormData(fp.getId());
		List<String> arrives = cv.getItems();
		Set<TransPortDetail> items = tp.getDetails();
		int i = 0;
		for(TransPortDetail item : items){
			item.setIsArrived(arrives.get(i));
			i++;
		}
		merge(tp);
	}	
}
