package com.wjj.cwz.service.logisIn;



import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.wjj.cwz.core.frame.Page;
import com.wjj.cwz.dao.SimpleHibernateDao;
import com.wjj.cwz.dao.logisIn.LogisInDao;
import com.wjj.cwz.dao.user.UserDao;
import com.wjj.cwz.entity.LogisIn;
import com.wjj.cwz.entity.User;
import com.wjj.cwz.service.CommonService;
import com.wjj.cwz.service.user.UserService;

/**
 * 
 * @author "peter" 2013.09.26
 */
@Component
@Transactional
public class LogisInService extends CommonService {

	private static Logger logger = LoggerFactory.getLogger(LogisInService.class);
	
	@Resource
	private LogisInDao logisDao;
	
	@Resource
	private UserDao  userDao;
	
	@Override
	public SimpleHibernateDao getDao() {
		// TODO Auto-generated method stub
		return logisDao;
	}
	
	/**
	 * 根据ID号获取物流入驻记录
	 * @param id
	 * @return
	 */
	public  LogisIn getLogisInDetail(String id){
	    
		LogisIn logisIn = logisDao.get(Long.parseLong(id));	
		
		return logisIn;
	}
	
	
	public void flowLogisIn(String id,String ftype){
		LogisIn logisIn = getLogisInDetail(id);
		logisIn.getUser().setLogisIn(ftype);
		
		DateFormat df = new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			logisIn.setCheckTime(df.parse(df.format(new Date())));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		merge(logisIn);
	}
	
	
	public void saveLogisIn(LogisIn entity) {
		
		entity.setUser(userDao.get(entity.getUser().getId()));
		
		//System.out.println(new Date("YYYY-MM-DD hh24:mi:ss"));
		DateFormat df = new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			entity.setCreateTime(df.parse(df.format(new Date())));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		merge(entity);		
		
	}
	
	
	public Page<LogisIn> getPage(Page<LogisIn> page, Map<String, Object> values){
		StringBuilder sb = new StringBuilder();
		sb.append("from LogisIn u where 1=1 and u.checkTime=null ");
		if(StringUtils.isNotBlank((String)values.get("buslice"))){
			sb.append("and u.buslice like concat('%',:buslice,'%') ");
		}
		if(StringUtils.isNotBlank((String)values.get("roadTranPer"))){
			sb.append("and u.roadTranPer = :roadTranPer ");
		}
		if(StringUtils.isNotBlank((String)values.get("orgCode"))){
			sb.append("and u.orgCode like concat('%',:orgCode,'%') ");
		}
		if(StringUtils.isNotBlank((String)values.get("taxCode"))){
			sb.append("and u.taxCode = :taxCode ");
		}
		
		return getPage(sb.toString(), page, values);
	}
	
	
	

}
