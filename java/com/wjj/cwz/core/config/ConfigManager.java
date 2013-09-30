package com.wjj.cwz.core.config;

import java.net.URL;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.collect.Maps;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create Oct 19, 2011
 * 
 */
public class ConfigManager {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	//xmlConfig保存XML配置文件里面的配置信息
	private static final Map<String,Object> xmlConfig = new HashMap<String,Object>();
	//propertiesConfig保存properties配置文件里面的配置信息
	private static Properties propertiesConfig = new Properties();
	//cache保存一些不经常变动的数据，如部门树的信息
	private static Map<String,Object> cache = new HashMap<String,Object>();
	
	private static final ConfigManager instance = new ConfigManager();	

	private ConfigManager(){		
		loadXmlConfig();
		loadPropertiesConfig();
	}
	
	public static ConfigManager getInstance(){
		return instance;
	}
	
	private void loadXmlConfig(){
		Element root = getDocument().getRootElement();
		List<Element> list = root.selectNodes("/bpmConfig/uploadPath");	
		for(Element ele : list){
			String path = ele.getText();
			xmlConfig.put(Constants.FLOW_UPLOAD, path);
		}
		List<Element> maps = root.selectNodes("/bpmConfig/maps/map");
		for(Element ele : maps){
			xmlConfig.put(ele.attributeValue("key"), ele.attributeValue("value"));
		}
	}	
	
	private Document getDocument(){
		Document document = null;		
		URL fileUrl = null;
		try {
			SAXReader reader = new SAXReader();
			reader.setEncoding("UTF-8");
			fileUrl = getFileUrl("conf/bpm-config.xml");
			document = reader.read(fileUrl);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("读取配置文件发生错误，文件："+fileUrl, e);
		}
		return document;
	}
	
	private void loadPropertiesConfig(){
		URL fileUrl = null;
		try {
			fileUrl = getFileUrl("conf/config.properties");
			propertiesConfig.load(fileUrl.openStream());
			//if(propertiesConfig.get("wait"))
		} catch (Exception e) {
			logger.error("读取配置文件发生错误，文件："+fileUrl, e);
		}
		String status_code = (String)propertiesConfig.get("status.code");
		if(status_code == null)return;
		String[] codes = status_code.split(",");
		String status = null;
		List<String> statusArr = null;
		for(String temp : codes){
			status = (String)propertiesConfig.get(temp.trim());
			if(status == null)continue;
			statusArr = Arrays.asList(status.split(","));
			propertiesConfig.put(temp.trim(), statusArr);
		}
		
	}
	
	private URL getFileUrl(String fileName)throws Exception{
		URL fileUrl = null;		
		try {			
			fileUrl = new URL(ConfigManager.class.getClassLoader().getResource(""),fileName);			
		} catch (Exception e) {			
			logger.error("加载BPM配置文件发生错误，文件:"+fileName, e);
		}
		return fileUrl;
	}
	
	public Map<String,Object> getXmlConfig(){
		return xmlConfig;
	}
	
	public Properties getPropertiesConfig(){
		return propertiesConfig;
	}

	public static Map<String, Object> getCache() {
		return cache;
	}
}
