package com.wjj.cwz.service.advance;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.wjj.cwz.core.frame.Page;
import com.wjj.cwz.dao.advance.AdvanceDao;
import com.wjj.cwz.entity.Advance;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-2-11
 * 
 */
@Component
@Transactional
public class AdvanceService {

	private static Logger logger = LoggerFactory.getLogger(AdvanceService.class);
	
	@Autowired
	private AdvanceDao advanceDao;
	
	public void merge(Advance bean){
		advanceDao.save(bean);
	}
	
	public void delete(Long id){
		advanceDao.delete(id);
	}
	
	public Page<Advance> getPage(Page<Advance> page, Map<String, Object> hqlMap){
		StringBuilder hql = new StringBuilder();
		hql.append("from Advance where 1=1");
		return advanceDao.findPage(page, hql.toString(), hqlMap);
	}
}
