package com.wjj.cwz.web.flow;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wjj.cwz.core.frame.Page;
import com.wjj.cwz.core.util.Constants;
import com.wjj.cwz.core.util.JsonUtils;
import com.wjj.cwz.entity.Flow;
import com.wjj.cwz.entity.User;
import com.wjj.cwz.service.flow.FlowService;
import com.wjj.cwz.web.BaseAction;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-5-7
 * 
 */
@Controller
public class FlowAction extends BaseAction{

	@Autowired
	private FlowService flowService;
	
	@RequestMapping(value="/flow/getPage")
	@ResponseBody
	public Object getPage(HttpServletRequest request){
		Page<Flow> page = new Page<Flow>();
		pageHandle(request, page);
		page = flowService.getPage(page, null);
		return JsonUtils.getPageGrid(page);
	}
	
	@RequestMapping(value="/flow/crud")
	@ResponseBody
	public String crud(Flow entity, String oper){
		if (StringUtils.equals(oper, Constants.DEL_OPER)){
			String[] ids = StringUtils.split(entity.getIds(), Constants.DEFAULT_SPLIT);
			for (String id : ids) {
				flowService.delete(Long.parseLong(id));
			}
		}else{
			flowService.merge(entity);
		}
		return Constants.AJAX_SUCCESS;
	}
}
