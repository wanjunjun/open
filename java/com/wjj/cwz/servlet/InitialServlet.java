package com.wjj.cwz.servlet;

import java.io.IOException;
import java.util.Date;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wjj.cwz.core.util.SpringUtil;
import com.wjj.cwz.entity.License;
import com.wjj.cwz.service.license.LicenseService;

/** 
*
* @author "Jack Q"
* @version 
* @create 2011-11-9 下午01:49:07 
* 
*/

public class InitialServlet extends HttpServlet {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Override
	public void init() throws ServletException {
		super.init();
		//初始化bean
//		SpringContextUtils.getInstance().initContext();
//		SpringContextUtils.getInstance().setWorkItemHandlerManager();
		LicenseService licenseService = (LicenseService)SpringUtil.getInstance().getBean("licenseService");
		License license = licenseService.findUniqueBy("code", "system");
		if(license == null || license.getDate() == null || license.getDate().getTime() < new Date().getTime()-86400000){
			logger.error("license 超出使用期限.........");
			System.exit(0);
		}
		EntityManagerFactory emf =  Persistence.createEntityManagerFactory("org.jbpm.persistence.jpa");
//		JbpmCache.addCache("org.jbpm.persistence.jpa", emf);
		
//		EntityManagerFactory emfTask =  Persistence.createEntityManagerFactory("org.jbpm.persistence.user");
//		JbpmCache.addCache("org.jbpm.persistence.user", emfTask);
		
//		BpmTool.getInstance().startup();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest reqquest, HttpServletResponse response) throws ServletException,
			IOException {
		response.sendError(1001, "POST Method Not Allowed Here");
	}

}
