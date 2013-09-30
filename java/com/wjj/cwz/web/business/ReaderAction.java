package com.wjj.cwz.web.business;

import java.util.List;
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
import com.wjj.cwz.entity.Reader;
import com.wjj.cwz.service.business.ReaderService;
import com.wjj.cwz.web.BaseAction;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-5-9
 * 
 */
@Controller
public class ReaderAction extends BaseAction{

	@Autowired
	private ReaderService readerService;
	
	@RequestMapping(value="/reader/getPage")
	@ResponseBody
	public Object getPage(HttpServletRequest request, Reader reader){
		Page<Reader> page = new Page<Reader>();
		pageHandle(request, page);
		
		Map<String, Object> values = Maps.newHashMap();
//		values.put("id", reader.getId());
//		values.put("readerId", reader.getReaderId());
		variableHandle(values, reader);
		page = readerService.getPage(page, values);
		return JsonUtils.getPageGrid(page);
	}
	
	@RequestMapping(value="/reader/crud")
	@ResponseBody
	public String crud(Reader entity, String oper){
		if (StringUtils.equals(oper, Constants.DEL_OPER)){
			String[] ids = StringUtils.split(entity.getIds(), Constants.DEFAULT_SPLIT);
			for (String id : ids) {
				readerService.delete(Long.parseLong(id));
			}
		}else{
			readerService.merge(entity);
		}
		return Constants.AJAX_SUCCESS;
	}
	
	@RequestMapping(value="/reader/getByReaderId")
	@ResponseBody
	public Object getByReaderId(String readerId){
		Reader reader = readerService.findUniqueBy("readerId", readerId);
		return reader;
	}
	
	@RequestMapping(value="/reader/searchReader")
	@ResponseBody
	public Object searchReader(HttpServletRequest request){
		String pageNo = request.getParameter("page");
		String rows = request.getParameter("rows");
		
		Map<String, Object> values = Maps.newHashMap();
		values.put("readerIp", request.getParameter("readerIp"));
		values.put("depoName", request.getParameter("depoName"));
		values.put("s_date", request.getParameter("s_date"));
		values.put("e_date", request.getParameter("e_date"));
		values.put("pageNo", Integer.parseInt(pageNo));
		values.put("startNo", (Integer.parseInt(pageNo)-1)*Integer.parseInt(rows));
		values.put("pageSize", Integer.parseInt(rows));
		Map<String , Object> result = readerService.searchReader(values);		
		return result;
	}
}
