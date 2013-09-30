package com.wjj.cwz.web.business;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wjj.cwz.core.util.Constants;
import com.wjj.cwz.entity.Depo;
import com.wjj.cwz.service.business.DepoService;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-5-9
 * 
 */
@Controller
public class DepoAction {

	@Autowired
	private DepoService depoService;
	
	@RequestMapping(value="/depo/getTree")
	public String getTree(Model model){
		model.addAttribute("treeData", depoService.getDepoTree());
		return "base/tree/treeData";
	}
	
	@RequestMapping(value="/depo/crud")
	@ResponseBody
	public String crud(Depo depo,String oper){
		if(StringUtils.equals(oper, Constants.DEL_OPER)){
			String[] ids = StringUtils.split(depo.getIds(), Constants.DEFAULT_SPLIT);
			for(String id : ids){
				depoService.delete(Long.parseLong(id));
			}			
		}else{
			depoService.merge(depo);
		}
		return Constants.AJAX_SUCCESS;
	}
}
