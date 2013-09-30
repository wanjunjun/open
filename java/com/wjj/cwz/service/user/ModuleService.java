package com.wjj.cwz.service.user;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Maps;
import com.wjj.cwz.core.frame.Page;
import com.wjj.cwz.dao.SimpleHibernateDao;
import com.wjj.cwz.dao.user.ModuleDao;
import com.wjj.cwz.entity.Module;
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
public class ModuleService extends CommonService{

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private ModuleDao moduleDao;
	
	@Override
	public SimpleHibernateDao getDao() {
		return moduleDao;
	}
	
	public Page<Module> getPage(Page<Module> page, Map<String, Object> values){
		StringBuilder sb = new StringBuilder();
		sb.append("from Module m where 1=1 ");
		if("true".equals(values.get("isParent"))){
			sb.append("and m.parent.id is null ");
		}
		if("true".equals(values.get("isChild"))){
			sb.append("and m.parent.id = :id ");
		}
		if(StringUtils.isNotBlank((String)values.get("name"))){
			sb.append("and m.name = :name ");
		}
		return getPage(sb.toString(), page, values);
	}
	
	public List<Module> getParents(){
		StringBuilder hql = new StringBuilder();
		hql.append("from Module m where m.parent.id is null ");
		return getList(hql.toString());
	}
	
	public List<Module> getChilds(Long parentId){
		StringBuilder hql = new StringBuilder();
		hql.append("from Module m where m.parent.id = ?");
		return getList(hql.toString(), parentId);
	}
	
	public List<Module> getUserModuleChilds(Long parentId, Long userId){
		StringBuilder hql = new StringBuilder();
		hql.append("from Module m inner join fetch m.roleModules rm where (rm.role.id in");
		hql.append("(select ur.role.id from UserRole ur where ur.user.id = ?)");
		hql.append(")");
		hql.append("and m.parent.id = ? ");
		hql.append(" group by m.id");
		return getList(hql.toString(), userId, parentId);
	}
	
	public List<Map<String,Object>> getModuleFZ(){
		List<Module> parents = getParents();
		List<Map<String,Object>> parent_maps = new ArrayList<Map<String,Object>>(); 
		Map<String,Object> map = null;
		for(Module m : parents){
			map = Maps.newHashMap();
			map.put("id", m.getId());
			map.put("name", m.getName());
			map.put("childrens", getChilds(m.getId()));
			parent_maps.add(map);
		}
		return parent_maps;
	}	
	
}
