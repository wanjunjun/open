package com.wjj.cwz.core.util;

import java.util.Map;

import com.google.common.collect.Maps;
import com.wjj.cwz.core.frame.Page;


public class JsonUtils {
	
	public final static String PAGE_NO = "page"; //第几页
	public final static String TOTAL_PAGE = "total"; //总共多少页
	public final static String TOTAL_COUNT = "records"; //有多少记录
	public final static String JSON_ARRAY = "rows"; //json数组

	public static <T> Map<String , Object>  getPageGrid(Page<T> page){
		Map<String , Object> jsonMap = Maps.newHashMap();
		jsonMap.put(PAGE_NO, page.getPageNo());
		jsonMap.put(TOTAL_PAGE, page.getTotalPages());
		jsonMap.put(TOTAL_COUNT, page.getTotalCount());
		jsonMap.put(JSON_ARRAY, page.getResult());
		return jsonMap;
		
	}
}
