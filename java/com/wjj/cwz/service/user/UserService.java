package com.wjj.cwz.service.user;

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
import com.wjj.cwz.dao.user.UserDao;
import com.wjj.cwz.entity.Module;
import com.wjj.cwz.entity.User;
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
public class UserService extends CommonService{

	private static Logger logger = LoggerFactory.getLogger(UserService.class);
	
	@Autowired
	private UserDao userDao;
	
	@Override
	public SimpleHibernateDao getDao() {
		return userDao;
	}
	
	public List<Module> getUserModules(Long userId){
		StringBuilder hql = new StringBuilder();
		hql.append("from Module m inner join fetch m.roleModules rm where (rm.role.id in");
		hql.append(" ( select er.role.id from UserRole er where er.user.id =? )");
		hql.append(")");
		hql.append(" and m.parent.id is null");
		hql.append(" group by m.id order by m.sortNum ");
		return getList(hql.toString(), userId);		
	}
	
	public Page<User> getPage(Page<User> page, Map<String, Object> values){
		StringBuilder sb = new StringBuilder();
		sb.append("from User u where 1=1 ");
		if(StringUtils.isNotBlank((String)values.get("userName"))){
			sb.append("and u.userName like concat('%',:userName,'%') ");
		}
		if(StringUtils.isNotBlank((String)values.get("userCode"))){
			sb.append("and u.userCode = :userCode ");
		}
		return getPage(sb.toString(), page, values);
	}
	
	public User authorizeUser(String userCode, String password){
		String hql = "from User u where u.userCode = ? and u.pasword = ?";
		return findUnique(hql, userCode, password);
	}
}
