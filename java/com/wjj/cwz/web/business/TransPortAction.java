package com.wjj.cwz.web.business;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.wjj.cwz.authorize.AuthorizeDetailImpl;
import com.wjj.cwz.core.frame.Page;
import com.wjj.cwz.core.util.JsonUtils;
import com.wjj.cwz.core.util.SpringSecurityUtils;
import com.wjj.cwz.entity.Depo;
import com.wjj.cwz.entity.FlowProcess;
import com.wjj.cwz.entity.Reader;
import com.wjj.cwz.entity.TransPort;
import com.wjj.cwz.entity.TransPortDetail;
import com.wjj.cwz.service.business.DepoService;
import com.wjj.cwz.service.business.TransPortService;
import com.wjj.cwz.vo.CommonVo;
import com.wjj.cwz.vo.TransPortVo;
import com.wjj.cwz.web.BaseAction;
/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-5-7
 * 
 */
@Controller
public class TransPortAction extends BaseAction{
	
	@Autowired
	private TransPortService transPortService;
	@Autowired
	private DepoService depoService;
	
	//保存草稿
	private void saveFormData(FlowProcess fp, TransPortVo tpv, TransPort tp){
		transPortService.setFormData(tpv, tp);
		transPortService.saveFlow(fp, tpv, tp);
	}
	
	@RequestMapping(value="/business/transport/saveFlow")
	public String saveFlow(FlowProcess fp, TransPortVo tpv, TransPort tp){	
		transPortService.removeItem(fp.getId());
		saveFormData(fp, tpv, tp);		
		return "redirect:/page.do?page=business/success";
	}
	
	@RequestMapping(value="/business/transport/submitDraft")
	public String submitDraft(FlowProcess fp, TransPortVo tpv, TransPort tp){
		transPortService.removeItem(fp.getId());
		fp.setFormState("applyed");
		saveFormData(fp, tpv, tp);
		flowHandle(fp);
		return "redirect:/page.do?page=business/success";
	}
	
	//流程提交处理
	private void flowHandle(FlowProcess fp){
		AuthorizeDetailImpl user = SpringSecurityUtils.getCurrentUser();	
		TransPort tp = transPortService.getFormData(fp.getId());
		Depo depo = depoService.get(tp.getDepo().getId());
		Map<String, Object> variables = Maps.newHashMap();
		variables.put("node1", user.getUserCode());
		variables.put("node2", depo.getAdminCode());
		variables.put("agree", false);
		transPortService.applyFlow(user.getUserCode(), fp, variables);
	}
		
	@RequestMapping(value="/business/transport/applyFlow")
	public String applyFlow(FlowProcess fp, TransPortVo tpv, TransPort tp){							
		saveFormData(fp, tpv, tp);			
		flowHandle(fp);
		return "redirect:/page.do?page=business/success";
	}
	
	@RequestMapping(value="/business/transport/approveFlow")
	public String approveFlow(HttpServletRequest request, FlowProcess fp, CommonVo cv, String opinion){
		AuthorizeDetailImpl user = SpringSecurityUtils.getCurrentUser();	
		Map<String, Object> variables = null;
		String oper = request.getParameter("oper");
		if(StringUtils.isNotBlank(oper)){
			variables = Maps.newHashMap();
			variables.put("agree", oper.equals("pass"));
		}
		transPortService.approveFlow(user.getUserCode(), fp, opinion, variables, "approve");
		transPortService.updateFormData(fp, cv);
		return "redirect:/page.do?page=business/success";
	}
	
	@RequestMapping(value="/transport/getDetailPage")
	@ResponseBody
	public Object getDetailPage(HttpServletRequest request){
		Page<TransPortDetail> page = new Page<TransPortDetail>();
		pageHandle(request, page);
		
		Map<String, Object> values = Maps.newHashMap();
		values.put("boxId", request.getParameter("boxId"));
		values.put("driver", request.getParameter("driver"));
		values.put("carNo", request.getParameter("carNo"));
		
		page = transPortService.getPage(page, values);
		return JsonUtils.getPageGrid(page);
	}
	
	@RequestMapping(value="/transport/exportDetail")
	public Object exportDetail(HttpServletRequest request, HttpServletResponse response)throws Exception{
		Map<String, Object> values = Maps.newHashMap();
		values.put("boxId", request.getParameter("boxId"));
		values.put("driver", request.getParameter("driver"));
		values.put("carNo", request.getParameter("carNo"));
		
		transPortService.exportDetail(values, response);
		return null;
	}
}
