package com.wjj.cwz.service.business;

import static java.util.Locale.ENGLISH;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.wjj.cwz.core.frame.Page;
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
		fp.setCompleteTime(new Date());
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
	
	public Page<TransPort> getPage(Page<TransPort> page, Map<String, Object> map){
		StringBuilder hql = new StringBuilder();
		hql.append("from TransPort tp where 1=1 ");
		if(StringUtils.isNotBlank((String)map.get("driver"))){
			hql.append(" and tp.dirver like concat('%',:driver,'%')");
		}
		if(StringUtils.isNotBlank((String)map.get("carNo"))){
			hql.append(" and tp.carNo like concat('%',:carNo,'%')");
		}
		if(StringUtils.isNotBlank((String)map.get("depo"))){
			hql.append(" and tp.depo.name like concat('%',:depo,'%')");
		}
		return getPage(hql.toString(), page, map);
	}
}
