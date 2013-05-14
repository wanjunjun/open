package com.wjj.cwz.core.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create May 2, 2013
 * 流程表单对应SERVICE处理类的关系
 */
public enum FlowForm {
	TRANSPORT("transport", "transPortService");
	
	private static Logger logger = LoggerFactory.getLogger(FlowForm.class);
	
	private String code;
	private String service;
	FlowForm(String code, String service){
		this.code = code;
		this.service = service;
	}
	
	public String getCode(){
		return this.code;
	}
		
	public String getService() {
		return this.service;
	}
		
	public static FlowForm getEnumByCode(String code){
		for(FlowForm ff : FlowForm.values()){
			if(ff.getCode().equals(code)){
				return ff;
			}
		}
		return null;
	}
	
	public static FlowForm getEnumByService(String service){
		for(FlowForm ff : FlowForm.values()){
			if(ff.getService().equals(service)){
				return ff;
			}
		}
		return null;
	}
	
	public boolean equals(String code){		
		return this.getCode().equals(code);
	}
	
	public static void main(String[] args){
		FlowForm ff = FlowForm.getEnumByService("transPortService");
		System.out.println(ff);
		System.out.println(ff.getClass().getSimpleName());
	}
}
