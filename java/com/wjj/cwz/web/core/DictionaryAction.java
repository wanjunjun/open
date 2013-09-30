package com.wjj.cwz.web.core;

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
import com.wjj.cwz.entity.Dictionary;
import com.wjj.cwz.service.core.DictionaryService;
import com.wjj.cwz.web.BaseAction;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-5-9
 * 
 */
@Controller
public class DictionaryAction extends BaseAction{

	@Autowired
	private DictionaryService dictionaryService;
	
	@RequestMapping(value="/dict/getPage")
	@ResponseBody
	public Object getPage(HttpServletRequest request, Dictionary dict){
		Page<Dictionary> page = new Page<Dictionary>();
		pageHandle(request, page);
		
		Map<String, Object> values = Maps.newHashMap();
//		values.put("id", dict.getId());
//		values.put("readerId", dict.getDictionaryId());
		variableHandle(values, dict);
		page = dictionaryService.getPage(page, values);
		return JsonUtils.getPageGrid(page);
	}
	
	@RequestMapping(value="/dict/crud")
	@ResponseBody
	public String crud(Dictionary entity, String oper){
		if (StringUtils.equals(oper, Constants.DEL_OPER)){
			String[] ids = StringUtils.split(entity.getIds(), Constants.DEFAULT_SPLIT);
			for (String id : ids) {
				dictionaryService.delete(Long.parseLong(id));
			}
		}else{
			dictionaryService.merge(entity);
		}
		return Constants.AJAX_SUCCESS;
	}
	
}
