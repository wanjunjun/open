package com.wjj.jbpm;

import java.util.Map;

import com.google.common.collect.Maps;

/** 
*
* @author "Jack Q"
* @version 
* @create 2011-11-9 下午02:19:43 
* 
*/

public class JbpmCache {
	
	public static Map<String,Object> cache = Maps.newHashMap();
	
	public static void addCache(String key ,Object value){
		cache.put(key, value);
	}
	
	public static Object getCache(String key){
		return cache.get(key);
	}
	
	public static void remove(String key){
		cache.remove(key);
	}
	
	public static void clearAll(){
		cache.clear();
	}
	
	public static boolean contains(Object key){
		return cache.containsKey(key);
	}
}
