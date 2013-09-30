package com.wjj.cwz.service.user;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
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
	
	
	/**
	 * 检查是否有重复的会员名
	 * @param userCode
	 * @return
	 */
	public User CheckDupUser(String userCode){
		String hql = "from User u where u.userCode = ?";
		return findUnique(hql, userCode);
	}
	
	public List<Map> queryMap(){
		String sql = "select user_code, user_name from c_user u";
		return sqlQueryMap(sql, null);
	}
	
	//---------------hibernate cache test-------------
	
	public void testHibernateList(){
		Session session = getSession();
		List<User> list = session.createQuery("from User where id <> 1").list();
		for(User u : list){
			System.out.println(u.getUserName());
		}
		System.out.println("------list query over-------");
//		User u = (User)session.get(User.class, 1L);
		User u = findUniqueBy("userCode", "cwz");
		System.out.println(u.getUserName());
		System.out.println("------second query start-------");
		User u2 = findUniqueBy("userCode", "wanjunjun");
		System.out.println(u2.getUserName());
	}
	
	public void testHibernateIterator(){
		Session session = getSession();
		Iterator<User> list = session.createQuery("from User").iterate();
		for(Iterator<User> it = list; it.hasNext();){
			User u = it.next();
			System.out.println(u.getUserName());
		}
	}
	
	//如果使用iterate进行查询  
    //因为list操作已经将对象加载到了session的一级缓存，所以  
    //再使用iterate操作的时候，它先会发出查询id列表的查询语句  
    //再根据id到缓存中获取相关的数据  
    //只有再缓存中找不到相关数据的情况下，才会再次发出sql进行查询  
	public void testHibernateIteratorCache(){
		testHibernateList();
		testHibernateIterator();
	}
	
	//再次发出发出sql  
    //在默认情况下，list每次都会向数据库发出查询对象数据的sql，  
    //除非配置了查询缓存，所以下面的list()操作，虽然在session已经有了  
    //对象缓存数据，但list()并不理会这个中缓存，而再次发出查询语句进行查询
	public void testHibernateListCache(){
		testHibernateList();
		testHibernateList();
	}
	
	//查询缓存测试
	public void testSearchCache(){
		Session session = getSession();
		Query query = session.createQuery("from User where id <> 1");
		query.setCacheable(true);
		List<User> list = query.list();
		for(User u : list){
			System.out.println(u.getUserName());
		}
//		List<User> list2 = query.list();
//		for(User u : list2){
//			System.out.println(u.getUserName());
//		}
	}
	
	public void testSearchCache2(){
		List<User> list = getAll();
		
		List<User> c1 = cacheQuery("from User where userCode = ?", "wanjunjun");
		System.out.println("----"+c1.size());
		List<User> c2 = cacheQuery("from User where userCode = ?", "wanjunjun");
		System.out.println("----"+c2.size());
	}
}
