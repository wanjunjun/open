package com.wjj.cwz.service.license;

import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.wjj.cwz.core.frame.Page;
import com.wjj.cwz.dao.SimpleHibernateDao;
import com.wjj.cwz.dao.license.LicenseDao;
import com.wjj.cwz.entity.License;
import com.wjj.cwz.service.CommonService;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-5-9
 * 
 */
@Component
@Transactional
public class LicenseService extends CommonService{

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private LicenseDao licenseDao;
	
	@Override
	public SimpleHibernateDao getDao() {
		return licenseDao;
	}
	
	public Long getLicense(){		
		String hql = "select TO_DAYS(date) - TO_DAYS(now()) from License ";
		return getCount(hql);
	}
}
