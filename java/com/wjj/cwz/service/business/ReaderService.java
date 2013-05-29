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
import com.wjj.cwz.dao.business.ReaderDao;
import com.wjj.cwz.entity.Reader;
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
public class ReaderService extends CommonService{

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private ReaderDao readerDao;
	
	@Override
	public SimpleHibernateDao getDao() {
		return readerDao;
	}
	
	public Page<Reader> getPage(Page<Reader> page, Map<String, Object> values){
		StringBuilder sb = new StringBuilder();
		sb.append("from Reader b where 1=1 ");
		if(StringUtils.isNotBlank((String)values.get("readerId"))){
			sb.append("and b.readerId like concat('%',:readerId,'%') ");
		}
		if(StringUtils.isNotBlank((String)values.get("type"))){
			sb.append("and b.type = :type ");
		}
		if(StringUtils.isNotBlank((String)values.get("description"))){
			sb.append("and b.description like concat('%',:description,'%') ");
		}
		return getPage(sb.toString(), page, values);
	}
}
