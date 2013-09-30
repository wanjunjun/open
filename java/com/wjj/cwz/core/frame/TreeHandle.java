package com.wjj.cwz.core.frame;

import java.lang.reflect.Method;
import java.util.List;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create Jan 9, 2012
 * 
 */
public class TreeHandle {
	
	private static final TreeHandle instance = new TreeHandle();

	private TreeHandle(){}
	
	public static TreeHandle getInstance(){
		return instance;
	}
	/**
	 * 
	 * @param rootId 	生成树根结点的ID
	 * @param rootText	生成树根结点的TEXT
	 * @param nodes		树结点的数据
	 * @param attributes树结点的附加属性
	 * @return
	 */
	public String buildTree(String rootId,String rootText,Object list,String[] attributes,Object dao,String search,String isexpand)throws Exception{
		List<Object> nodes = (List<Object>)list;
		if(rootId == null || rootText == null || nodes == null){
			return null;
		}
		StringBuffer tree = new StringBuffer();
		tree.append("{\"id\":\"").append(rootId).append("\",");
		tree.append("\"text\":\"").append(rootText).append("\",");
		tree.append("\"value\":\"0\",\"isexpand\":true,\"complete\":true,\"showcheck\":true,");
		
		int size = nodes.size();
		if(size > 0){
			tree.append("\"hasChildren\":true,\"ChildNodes\":[");
		}else{
			tree.append("\"hasChildren\":false");
		}
		//build nodes...
		Object node = null;		
		
		for(int i = 0; i < size; i++){
			int level = 0;
			node = nodes.get(i);
			tree.append("\r");
			tree.append("{");
			for(String attr : attributes){
				tree.append("\"").append(attr).append("\":\"").append(String.valueOf(getValue(node,attr))).append("\",");
			}
			tree.append("\"isexpand\":").append(isexpand).append(",\"complete\":true,\"showcheck\":true,");
			Long nodeId = (Long)getValue(node,"id");
			buildNode(nodeId,tree,isexpand,attributes,dao,search);
			tree.append("}");
			if(i < size-1){
				tree.append(",");
			}
		}
		
		if(size > 0){
			tree.append("]");
		}
		tree.append("}");
		return tree.toString();
	}
	
	public Object getValue(Object target, String properties)throws Exception{
		String methodName = "get"+Character.toUpperCase(properties.charAt(0)) + properties.substring(1); 
		Method m = target.getClass().getDeclaredMethod(methodName);
		Object v = m.invoke(target);
		return v;
	}
	
	public Object doSearch(Object target, String search, Object param)throws Exception{		
		Method m = target.getClass().getDeclaredMethod(search, Long.class);
		Object v = m.invoke(target,param);
		return v;
	}
	
	public void buildNode(Long parentId, StringBuffer tree, String isexpand, String[] attributes, Object dao, String search)throws Exception {		
		Object v = doSearch(dao, search, parentId);
		List<Object> nodes = (List<Object>)v;
		int size = nodes.size();
		if(size > 0){
			tree.append("\"hasChildren\":true,\"ChildNodes\":[");
		}else{
			tree.append("\"hasChildren\":false");
		}
		
		Object node = null;			
		for(int i = 0; i < size; i++){
			node = nodes.get(i);
			tree.append("\r");		
			tree.append("{");
			
			for(String attr : attributes){
				tree.append("\"").append(attr).append("\":\"").append(String.valueOf(getValue(node,attr))).append("\",");
			}
			tree.append("\"isexpand\":").append(isexpand).append(",\"complete\":true,\"showcheck\":true,");
			Long nodeId = (Long)getValue(node,"id");
			buildNode(nodeId,tree,isexpand,attributes,dao,search);
			tree.append("}");
			if(i < size-1){
				tree.append(",");
			}
		}
		
		if(size > 0){
			tree.append("]");
		}
	}
}
