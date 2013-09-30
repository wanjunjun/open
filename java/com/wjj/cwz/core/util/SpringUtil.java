package com.wjj.cwz.core.util;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create Jul 20, 2012
 * 
 */
public class SpringUtil {
	private ApplicationContext context;
	private static final SpringUtil instance = new SpringUtil();
	
	private SpringUtil(){
		String[] configLocations = {"/spring/applicationContext.xml"};
		context = new ClassPathXmlApplicationContext(configLocations);
	}
	
	public static SpringUtil getInstance(){
		return instance;
	}
	
	public Object getBean(String id){
		return context.getBean(id);
	}
}
