package com.wjj.cwz.web.advance;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wjj.cwz.core.frame.Page;
import com.wjj.cwz.core.util.Constants;
import com.wjj.cwz.core.util.JsonUtils;
import com.wjj.cwz.entity.Advance;
import com.wjj.cwz.service.advance.AdvanceService;
import com.wjj.cwz.web.BaseAction;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-2-11
 * 
 */
@Controller
public class AdvanceAction extends BaseAction{

	@Autowired
	private AdvanceService advanceService;
	
	@RequestMapping(value="/advance/getPage")
	@ResponseBody
	public Object getPage(Integer page, Integer rows){
		Page<Advance> pageBean = new Page<Advance>();
		pageBean.setPageNo(page);
		pageBean.setPageSize(rows);
		pageBean = advanceService.getPage(pageBean, null);
		return JsonUtils.getPageGrid(pageBean);
	}
	
	@RequestMapping(value="/advance/crud")
	@ResponseBody
	public String crud(Advance bean, String oper){
		if(StringUtils.equals(oper, Constants.DEL_OPER)){
			String[] ids = StringUtils.split(bean.getIds(), Constants.DEFAULT_SPLIT);
			for(String id : ids){
				advanceService.delete(Long.parseLong(id));
			}			
		}else{
			advanceService.merge(bean);
		}
		return Constants.AJAX_SUCCESS;
	}
}
