package com.wjj.cwz.service.core;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.wjj.cwz.core.frame.Page;
import com.wjj.cwz.dao.SimpleHibernateDao;
import com.wjj.cwz.dao.core.DictionaryDao;
import com.wjj.cwz.entity.Module;
import com.wjj.cwz.entity.Dictionary;
import com.wjj.cwz.entity.Dictionary;
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
public class DictionaryService extends CommonService{

	private static Logger logger = LoggerFactory.getLogger(DictionaryService.class);
	
	@Autowired
	private DictionaryDao dictionaryDao;
	
	@Override
	public SimpleHibernateDao getDao() {
		return dictionaryDao;
	}
	
	public List<Dictionary> findByType(String type){
		return getList("from Dictionary where dtype=?", type);
	}
	
	public Page<Dictionary> getPage(Page<Dictionary> page, Map<String, Object> values){
		StringBuilder hql = new StringBuilder();
		hql.append("from Dictionary b where 1=1 ");
		if(StringUtils.isNotBlank((String)values.get("dtype"))){
			hql.append("and b.dtype = :dtype ");
		}
		if(StringUtils.isNotBlank((String)values.get("label"))){
			hql.append("and b.label like concat('%',:label,'%') ");
		}
		return getPage(hql.toString(), page, values);
	}
}
