package com.wjj.cwz.service.business;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.wjj.cwz.dao.SimpleHibernateDao;
import com.wjj.cwz.dao.business.TransPortDao;
import com.wjj.cwz.service.CommonService;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create May 7, 2013
 * 
 */
@Component
@Transactional
public class TransPortService extends CommonService{

	@Autowired
	private TransPortDao transPortDao;

	@Override
	public SimpleHibernateDao getDao() {
		return transPortDao;
	}
}
