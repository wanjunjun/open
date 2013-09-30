package com.wjj.cwz.service.user;

import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Lists;
import com.wjj.cwz.core.frame.TreeHandle;
import com.wjj.cwz.core.util.Constants;
import com.wjj.cwz.dao.SimpleHibernateDao;
import com.wjj.cwz.dao.user.RoleDao;
import com.wjj.cwz.entity.Module;
import com.wjj.cwz.entity.Role;
import com.wjj.cwz.entity.RoleModule;
import com.wjj.cwz.entity.User;
import com.wjj.cwz.entity.UserRole;
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
public class RoleService extends CommonService{

	private static Logger logger = LoggerFactory.getLogger(RoleService.class);
	
	@Autowired
	private RoleDao roleDao;
		
	@Override
	public SimpleHibernateDao getDao() {
		return roleDao;
	}
	
	public String getRoleTree(){
		String tree = null;
		List<Role> roots = getChilds(null);
		String[] attributes = {"id","text","value","roleSecurity","description"};
		try {
			tree = TreeHandle.getInstance().buildTree("0", "角色", roots, attributes, this, "getChilds", "true");
		} catch (Exception e) {
			logger.error("生成角色树发生错误", e);
		}
		return tree;
	}
	
	public List<Role> getChilds(Long parentId){
		StringBuilder hql = new StringBuilder();
		if(parentId == null){
			hql.append("from Role r where r.parent.id is null");
			return getList(hql.toString());
		}else{
			hql.append("from Role r where r.parent.id = ?");
			return getList(hql.toString(), parentId);
		}		
		
	}
	
	public List<UserRole> getUserRoles(Long userId, Long roleId){
		StringBuilder hql = new StringBuilder();
		hql.append("from UserRole ur where ur.user.id = ? and ur.role.id = ?");
		return getList(hql.toString(), userId, roleId);
	}
	
	public void deleteUserRoles(Long userId, Long roleId){
		StringBuilder hql = new StringBuilder();
		hql.append("delete from UserRole ur where ur.user.id = ? and ur.role.id = ?");
		batchDelete(hql.toString(), userId, roleId);
	}
	
	public List<Object> getWithLink(Long id) {
		List<Object> links = Lists.newArrayList();
		Role r = roleDao.get(id);
		
		Set<UserRole> userRoles = r.getUserRoles();
		if(!userRoles.isEmpty()){
			for(UserRole ur : userRoles){
				links.add(ur.getUser());
			}
		}		
		return links;
	}
	
	//角色关联用户
	public void addRoleLink(Long id, String linkIds){
		Role role = roleDao.get(id);
		String[] linkArr = StringUtils.split(linkIds, Constants.DEFAULT_SPLIT);
		
		User user = null;
		UserRole er = null;
		for(String link : linkArr){
			user = new User();
			er = new UserRole();
			user.setId(Long.parseLong(link));
			er.setUser(user);
			er.setRole(role);
			List<UserRole> olds = getUserRoles(Long.parseLong(link),role.getId());
			if(olds.size()>0){
				continue;
			}
			role.getUserRoles().add(er);
		}	
		roleDao.save(role);
	}
	
	//删除角色关联用户
	public void delRoleLink(Long id, String linkIds){
		String[] linkArr = StringUtils.split(linkIds, Constants.DEFAULT_SPLIT);
		for(String link : linkArr){
			deleteUserRoles(Long.parseLong(link), id);
		}
	}
	
	public List<RoleModule> getRoleModules(Long roleId){
		StringBuilder hql = new StringBuilder();
		hql.append("from RoleModule rm where rm.role.id = ?");
		return getList(hql.toString(), roleId);
	}
	
	public void clearRoleModules(Long roleId) {
		StringBuilder hql = new StringBuilder();
		hql.append("delete from RoleModule rm where rm.role.id = ?");
		batchDelete(hql.toString(), roleId);
	}
	
	public void setRoleModules(Long roleId, String moduleIds) {
		//先清除所有关联的权限
		clearRoleModules(roleId);
		Role role = roleDao.get(roleId);
		String[] moduleIdArr = StringUtils.split(moduleIds, Constants.DEFAULT_SPLIT);
		for (String moduleId : moduleIdArr) {
			Module module = new Module();
			module.setId(Long.parseLong(moduleId));
			RoleModule roleModule = new RoleModule();
			roleModule.setRole(role);
			roleModule.setModule(module);
			role.getRoleModules().add(roleModule);
		}
		merge(role);
	}
}
