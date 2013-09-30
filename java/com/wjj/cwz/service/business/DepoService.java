package com.wjj.cwz.service.business;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.wjj.cwz.core.frame.TreeHandle;
import com.wjj.cwz.dao.SimpleHibernateDao;
import com.wjj.cwz.dao.business.DepoDao;
import com.wjj.cwz.entity.Depo;
import com.wjj.cwz.entity.Depo;
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
public class DepoService extends CommonService{

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private DepoDao depoDao;
	
	@Override
	public SimpleHibernateDao getDao() {
		return depoDao;
	}
	
	public String getDepoTree(){
		String tree = null;
		List<Depo> roots = getChilds(null);
		String[] attributes = {"id","text","value","code","province","city","address","adminCode","adminName"};
		try {
			tree = TreeHandle.getInstance().buildTree("0", "仓库", roots, attributes, this, "getChilds", "true");
		} catch (Exception e) {
			logger.error("生成仓库树发生错误", e);
		}
		return tree;
	}
	
	public List<Depo> getChilds(Long parentId){
		StringBuilder hql = new StringBuilder();
		if(parentId == null){
			hql.append("from Depo d where d.parent.id is null");
			return getList(hql.toString());
		}else{
			hql.append("from Depo d where d.parent.id = ?");
			return getList(hql.toString(), parentId);
		}		
		
	}
}
