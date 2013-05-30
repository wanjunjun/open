package com.wjj.cwz.service;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.wjj.cwz.core.frame.Page;
import com.wjj.cwz.dao.SimpleHibernateDao;

@Component
@Transactional
public abstract class CommonService {

	private static Logger logger = LoggerFactory.getLogger(CommonService.class);

	@Autowired
	private SessionFactory sessionFactory;

	public Session openSession() {
		return sessionFactory.openSession();
	}
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public void saveBean(Object bean) {
		Session session = null;
		Transaction tx = null;
		try {
			session = openSession();
			tx = session.getTransaction();
			session.beginTransaction();			
			session.saveOrUpdate(bean);
			tx.commit();
		} catch (HibernateException e) {
			tx.rollback();
			e.printStackTrace();
		} finally {
			closeSession(session);
		}

	}
	
	public void saveBean(List<Object> beans) {
		Session session = null;
		try {
			session = getSession();
			session.beginTransaction();	
			for(Object bean: beans){
				session.saveOrUpdate(bean);
			}			
		} catch (HibernateException e) {
			e.printStackTrace();
		}
	}

	private void closeSession(Session session) {
		if (null != session) {
			session.clear();
			session.close();
		}
	}
	
	protected Object getValue(Object target, String properties)throws Exception{
		String methodName = "get"+Character.toUpperCase(properties.charAt(0)) + properties.substring(1); 	
		Method m = target.getClass().getMethod(methodName);
		Object v = m.invoke(target);
		return v;
	}
	
	public Collection getNewCollection(Collection collection){
		Object bean = null;
		PropertyDescriptor pd = null;		
		for(Iterator it = collection.iterator(); it.hasNext();){
			bean = it.next();			
			try {
				if(pd == null)pd = new PropertyDescriptor("id",bean.getClass());
				pd.getWriteMethod().invoke(bean, new Object[]{null});
			} catch (Exception e) {
				logger.error("get new collection error,"+bean.getClass(), e);
				return null;
			}			
		}
		return collection;
	}
	
	private Query createQuery(Session session, String hql, Map<String, ?> values){
		Query query = session.createQuery(hql);
		if (values != null) {
			query.setProperties(values);
		}
		return query;
	}
	
	private Query createQuery(Session session, String hql, Object... values){
		Query query = session.createQuery(hql);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				query.setParameter(i, values[i]);
			}
		}
		return query;
	}
	//基础crud
	public abstract SimpleHibernateDao getDao();
	
	public <T> void merge(T entity){
		getDao().save(entity);
	}
	
	public <T> T get(Long id){
		return (T)getDao().get(id);
	}
	
	public void delete(Long id){
		getDao().delete(id);
	}
	
	public void delete(Object bean){
		getDao().delete(bean);
	}
	
	/**
	 * 按属性查找唯一对象, 匹配方式为相等.
	 */
	public <T> T findUniqueBy(final String propertyName, final Object value){
		return (T)getDao().findUniqueBy(propertyName, value);
	} 
	
	/**
	 * 按属性查找对象列表, 匹配方式为模糊查询.
	 */
	public <T> List<T> vagueFindBy(final String propertyName, final Object value){
		return getDao().vagueFindBy(propertyName, value);
	}
	
	//集合查询
	public <T> List<T> getList(String hql, Object... values){
		Session session = null;
	
		session = getSession();
		Query query = createQuery(session, hql, values);
		return query.list();				
	}
	
	public <T> List<T> getList(String hql, Map<String, ?> values){
		Session session = null;
		try {
			session = openSession();
			Query query = createQuery(session, hql, values);
			return query.list();
		} finally{
			closeSession(session);
		}		
	}
	
	public Long getCount(String hql, Object... values){
		Session session = getSession();
		Long count = (Long)createQuery(session, hql, values).uniqueResult();
		return count;
	}
	
	//分页查询
	public <T> Page<T> getPage(String hql, Page<T> page, Map<String, ?> values){
		Session session = null;
		try {
			session = openSession();
			Query query = createQuery(session, hql, values);
			long totalCount = countHqlResult(session, hql, values);
			page.setTotalCount(totalCount);
			Assert.isTrue(page.getPageSize() > 0, "Page Size must larger than zero");
			query.setFirstResult(page.getFirst() - 1);
			query.setMaxResults(page.getPageSize());
			List result = query.list();
			page.setResult(result);
			return page;
		} finally{
			closeSession(session);
		}
	}		
	
	private long countHqlResult(final Session session, final String hql, final Map<String, ?> values) {
		String countHql = prepareCountHql(hql);

		try {
			Long count = (Long)createQuery(session, countHql, values).uniqueResult();
			return count;
		} catch (Exception e) {
			throw new RuntimeException("hql can't be auto count, hql is:" + countHql, e);
		}
	}
	
	private String prepareCountHql(String orgHql) {
		String fromHql = orgHql;
		//select子句与order by子句会影响count查询,进行简单的排除.
		fromHql = "from " + StringUtils.substringAfter(fromHql, "from");
		fromHql = StringUtils.substringBefore(fromHql, "order by");

		String countHql = "select count(*) " + fromHql;
		return countHql;
	}
	
	//批量删除
	public void batchDelete(String hql, Object... values){
		Session session = null;
		Transaction tx = null;
		try {
			session = openSession();
			tx = session.beginTransaction();
			Query query = createQuery(session, hql, values);
			query.executeUpdate();
			tx.commit();
		}catch(Exception e){
			logger.error("batch delete error.",e);
			tx.rollback();
		} finally{
			closeSession(session);
		}
	}
	
	public void batchDelete(String hql, Map<String, ?> values){
		Session session = null;
		Transaction tx = null;
		try {
			session = openSession();
			tx = session.beginTransaction();
			Query query = createQuery(session, hql, values);
			query.executeUpdate();
			tx.commit();
		}catch(Exception e){
			logger.error("batch delete error.",e);
			tx.rollback();
		} finally{
			closeSession(session);
		}
	}
}
