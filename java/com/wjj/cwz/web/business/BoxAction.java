package com.wjj.cwz.web.business;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.wjj.cwz.core.frame.Page;
import com.wjj.cwz.core.util.Constants;
import com.wjj.cwz.core.util.JsonUtils;
import com.wjj.cwz.entity.Box;
import com.wjj.cwz.service.business.BoxService;
import com.wjj.cwz.web.BaseAction;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-5-9
 * 
 */
@Controller
public class BoxAction extends BaseAction{

	@Autowired
	private BoxService boxService;
	
	@RequestMapping(value="/box/getPage")
	@ResponseBody
	public Object getPage(HttpServletRequest request, Box box){
		Page<Box> page = new Page<Box>();
		pageHandle(request, page);
		
		Map<String, Object> values = Maps.newHashMap();
		values.put("id", box.getId());
		values.put("boxId", box.getBoxId());
		page = boxService.getPage(page, values);
		return JsonUtils.getPageGrid(page);
	}
	
	@RequestMapping(value="/box/crud")
	@ResponseBody
	public String crud(Box entity, String oper){
		if (StringUtils.equals(oper, Constants.DEL_OPER)){
			String[] ids = StringUtils.split(entity.getIds(), Constants.DEFAULT_SPLIT);
			for (String id : ids) {
				boxService.delete(Long.parseLong(id));
			}
		}else{
			boxService.merge(entity);
		}
		return Constants.AJAX_SUCCESS;
	}
	
	@RequestMapping(value="/box/getByBoxId")
	@ResponseBody
	public Object getByBoxId(String boxId){
		Box box = boxService.findUniqueBy("boxId", boxId);
		return box;
	}
}
