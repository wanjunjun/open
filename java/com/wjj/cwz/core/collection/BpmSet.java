package com.wjj.cwz.core.collection;

import java.lang.reflect.Method;
import java.util.LinkedHashSet;

import org.apache.commons.lang.StringUtils;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create Mar 18, 2013
 * 
 */
public class BpmSet<E> extends LinkedHashSet<E>{
	private Class<E> classFactory;

	public BpmSet(){
		super();
	}
	
	public BpmSet(int initialCapacity, Class<E> classFactory){
		super(initialCapacity);
		this.classFactory = classFactory;
	}
	
	public void append(Integer index, Object p, String mn){
		int ss = size();
		if(index >= ss){
			E item = null;
			for(int i = ss; i <= index; i++){
				try {
					if(classFactory == null){
						throw new RuntimeException("BpmSet classFactory can not be null....");
					}
					item = classFactory.newInstance();
					if(p != null && StringUtils.isNotBlank(mn)){
						//关联实体的外键关系
						Method setFK = item.getClass().getDeclaredMethod(mn, p.getClass());
						setFK.invoke(item, p);
					}					
					add(item);
				} catch (Exception e) {					
					throw new RuntimeException("BpmSet add item error with reflect method....", e);
				}
			}
		}
	}
}
