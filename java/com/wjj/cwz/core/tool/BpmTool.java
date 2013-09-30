package com.wjj.cwz.core.tool;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.ObjectOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.Socket;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.wjj.cwz.core.util.Constants;
import com.wjj.cwz.core.util.Date2StringUtils;

import com.google.common.collect.Lists;

public class BpmTool {
	private static Logger logger = LoggerFactory.getLogger(BpmTool.class);

	private static final BpmTool instance = new BpmTool();

	private BpmTool() {
	}

	public static BpmTool getInstance() {
		return instance;
	}

	public void startup() {
		String startFile = (String) BpmConfigManager.getInstance()
				.getPropertiesConfig().get("jbpm.start");
		String serverPort = (String) BpmConfigManager.getInstance()
				.getPropertiesConfig().get("jbpm.server.port");
		String msg = null;
		try {
			String line = checkPort(serverPort);
			if (line == null) {
				Runtime.getRuntime().exec(startFile);
				msg = "服务启动成功";
				logger.debug("bpm server start...");
			} else {
				msg = "服务已经启动或端口" + serverPort + "已占用，请检查";
				// restart server
				logger.debug("bpm server restart...");
				shutdown();
				Thread.sleep(500);// 设置半秒的延时，确保服务关闭成功
				Runtime.getRuntime().exec(startFile);
			}
		} catch (Exception e) {
			msg = "服务启动错误";
			logger.error(msg, e);
		}
	}

	public void shutdown() {
		String serverPort = (String) BpmConfigManager.getInstance()
				.getPropertiesConfig().get("jbpm.server.port");
		String serverIp = (String) BpmConfigManager.getInstance()
				.getPropertiesConfig().get("jbpm.server.ip");
		String msg = null;
		try {
			String line = checkPort(serverPort);
			if (line == null) {
				msg = "服务未启动";
			} else {
				Socket socket = new Socket(serverIp, 9000);
				ObjectOutputStream outStream = new ObjectOutputStream(
						socket.getOutputStream());
				outStream.writeObject("shutdown");
				outStream.flush();
				outStream.close();
				socket.close();
				msg = "服务关闭成功";
			}
		} catch (Exception e) {
			msg = "服务关闭错误";
			logger.error(msg, e);
		}
	}

	private String checkPort(String port) throws Exception {
		if (port == null)
			return "none";
		Process check = Runtime.getRuntime().exec(
				"cmd /c netstat -ano|findstr " + port);
		InputStream in = check.getInputStream();
		BufferedReader br = new BufferedReader(new InputStreamReader(in));

		String line = br.readLine();
		br.close();
		in.close();
		return line;
	}

	// 文件上传通用的方法 , 文件组名称 "attachments"
	public List<String> uploadFile(HttpServletRequest request,
			String fileTagNames) throws Exception {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		List<MultipartFile> files = multipartRequest.getFiles(fileTagNames);
		if (files == null)
			return null;
		List<String> fileNames = Lists.newArrayList();
		String dateStr = Date2StringUtils.date2String(new Date(),
				"yyyy_MM_dd_HH.mm.ss");
		for (MultipartFile file : files) {
			if (StringUtils.isNotBlank(file.getOriginalFilename())) {
				// if (file.getSize() > 0) {
				String upload_path = (String) BpmConfigManager.getInstance()
						.getXmlConfig().get(Constants.FLOW_UPLOAD);
				File sfile = new File(upload_path + dateStr + "_"
						+ file.getOriginalFilename());
				if (sfile.exists())
					sfile.delete();
				sfile.createNewFile();
				FileCopyUtils.copy(file.getBytes(), sfile);
				fileNames.add(dateStr + "_" + file.getOriginalFilename());
				// }
			}
		}
		return fileNames;
	}
	
	
	// 
	/**
	 * 获取图片上传路径
	 * add by peter in 2013.09.29
	 */
	public String getPicPath() {
		String path = BpmTool.class.getResource("/").getPath().toString();

		path = path.substring(1, path.lastIndexOf("WEB-INF"));

		path = path.replaceAll("%20", " ") + "uploadFolder/";
		
		return path;
	}

	// 图片文件上传通用的方法 , 文件组名称 "attachments"
	public List<String> uploadPicture(HttpServletRequest request,
			String fileTagNames) throws Exception {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		
		//MultipartFile  filessssFile=multipartRequest.getFile("file[0]");
		List<MultipartFile> files = multipartRequest.getFiles(fileTagNames);
		
		if (files == null)
			return null;
		
		List<String> fileNames = Lists.newArrayList();
		String dateStr = Date2StringUtils.date2String(new Date(),
				"yyyy_MM_dd_HH.mm.ss");
		for (MultipartFile file : files) {
			if (StringUtils.isNotBlank(file.getOriginalFilename())) {
				// 取当前编译路径，取webapp主目录下的uploadFolder文档路径
				String path2 = BpmTool.class.getResource("/").getPath()
						.toString();
				
				path2 = path2.substring(1, path2.lastIndexOf("WEB-INF"));
				
				path2 = path2.replaceAll("%20", " ") + "uploadFolder/";
				
				
				
				File sfile = new File(path2 + dateStr + "_"
						+ file.getOriginalFilename());
				System.out.println(sfile.getPath());
				
				if (sfile.exists())
					sfile.delete();
				sfile.createNewFile();
				FileCopyUtils.copy(file.getBytes(), sfile);
				fileNames.add(dateStr + "_" + file.getOriginalFilename());
			}
		}
		return fileNames;
	}

	// 更新表单通用方法
	public void updateForm(HttpServletRequest request, String fieldNames,
			Object form) throws Exception {
		String fields = request.getParameter(fieldNames);
		String[] fieldArr = fields.split(",");
		String v = null;
		for (String field : fieldArr) {
			v = request.getParameter(field);
			setValue(form, field, v);
		}
	}

	public Object setValue(Object target, String properties, String value)
			throws Exception {
		String methodName = "set" + Character.toUpperCase(properties.charAt(0))
				+ properties.substring(1);
		Field field = target.getClass().getDeclaredField(properties);
		Method m = target.getClass().getDeclaredMethod(methodName,
				field.getType());
		Object vv = value;
		if (field.getType().equals(Long.class)) {
			vv = Long.parseLong(value);
		} else if (field.getType().equals(Integer.class)) {
			vv = Integer.parseInt(value);
		}
		Object v = m.invoke(target, vv);
		return v;
	}
}
