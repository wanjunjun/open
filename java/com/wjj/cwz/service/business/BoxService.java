package com.wjj.cwz.service.business;

import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.wjj.cwz.core.frame.Page;
import com.wjj.cwz.dao.SimpleHibernateDao;
import com.wjj.cwz.dao.business.BoxDao;
import com.wjj.cwz.entity.Box;
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
public class BoxService extends CommonService{

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private BoxDao boxDao;
	
	@Override
	public SimpleHibernateDao getDao() {
		return boxDao;
	}
	
	public Page<Box> getPage(Page<Box> page, Map<String, Object> values){
		StringBuilder sb = new StringBuilder();
		sb.append("from Box b where 1=1 ");
		if(StringUtils.isNotBlank((String)values.get("boxId"))){
			sb.append("and b.boxId like concat('%',:boxId,'%') ");
		}
		return getPage(sb.toString(), page, values);
	}
}
