package com.wjj.cwz.servlet;

import java.io.IOException;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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
