package com.wjj.cwz.web.logisIn;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.commons.lang.StringUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.wjj.cwz.authorize.Authenticate;
import com.wjj.cwz.core.frame.Page;
import com.wjj.cwz.core.tool.BpmConfigManager;
import com.wjj.cwz.core.tool.BpmTool;
import com.wjj.cwz.core.util.Constants;
import com.wjj.cwz.core.util.JsonUtils;
import com.wjj.cwz.entity.LogisIn;


import com.wjj.cwz.service.logisIn.LogisInService;
import com.wjj.cwz.web.BaseAction;


/**
 * 
 * @author "peter"
 * @version
 * @create 2013-09-26
 * 
 */
@Controller
public class LogisInAction extends BaseAction {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private LogisInService logisInService;

	@Autowired
	private Authenticate authenticate;

	@RequestMapping(value = "/logisIn/crud")
	@ResponseBody
	public String crud(LogisIn entity, String oper) {

		if (StringUtils.equals(oper, Constants.DEL_OPER)) {
			logisInService.delete(entity);
		} else {
			logisInService.merge(entity);
		}
		return Constants.AJAX_SUCCESS;
	}
	
	
	/**
	 * 获取未由本公司审查的物流入驻记录
	 * @param request
	 * @param logisIn
	 * @return
	 */
	@RequestMapping(value = "/logisIn/getPage")
	@ResponseBody
	public Object getUncheckRecord(HttpServletRequest request,LogisIn logisIn) {
     
		Page<LogisIn> page = new Page<LogisIn>();
		pageHandle(request, page);

		Map<String, Object> values = Maps.newHashMap();
		values.put("id", logisIn.getId());
		values.put("buslice", logisIn.getBuslice());
		values.put("roadTranPer", logisIn.getRoadTranPer());
		values.put("orgCode", logisIn.getOrgCode());
		values.put("taxCode", logisIn.getTaxCode());
		page = logisInService.getPage(page, values);
		return JsonUtils.getPageGrid(page);
	}
	
	
	/**
	 * 详细页，在详细页面可以进行下载，浏览对应的图片
	 * @param id   单据ID号
	 * @param model 
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/logisIn/showFlowForm")	
	public String  showFlowForm( String  id, Model model,HttpServletRequest request){
				
		LogisIn logisIn = logisInService.getLogisInDetail(id);
		
		model.addAttribute("logisIn", logisIn);	
		
        return "/base/logisIn/logisIn_CheckMan";
	}
	
	
	
    /**
     * 通过或者驳回入驻申请
     * @param id
     * @param model
     * @param request
     * @return
     */
	@RequestMapping(value="/logisIn/FlowLogisIn")	
	public String  FlowLogisIn( String  id,String ftype,HttpServletRequest request){
				
		
		logisInService.flowLogisIn(id,ftype);
			
        return "/base/logisIn/logisIn_Check";
	}
	
	/**
	 * 下载对应的图片
	 * @param id
	 * @param model
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/logisIn/getDownloadPic")	
	public String  getDownloadPic( String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception{
				
		    String fn = new String(fileName.getBytes("GB2312"), "ISO-8859-1");
			response.setContentType("multipart/form-data");
			response.setHeader("Content-Disposition", String.format("attachment; filename=\"%s\"", fn));
						
			try {
				String upload_path = BpmTool.getInstance().getPicPath();
				File file=new File(upload_path+URLDecoder.decode(fileName, "utf-8")); 
				System.out.println(file.getPath());
				InputStream inputStream=new FileInputStream(file);
				OutputStream os=response.getOutputStream();
				byte[] b=new byte[1024];
				int length; 
				while((length=inputStream.read(b))>0){
					os.write(b,0,length);
				}
				inputStream.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
			return null;
	}
	
	

	/**
	 * 上传附件并提交物流入驻申请记录
	 * @param request
	 * @param entity
	 */
	@RequestMapping(value = "/logisIn/upload")
	//@ResponseBody
	public String  LogisUpload(HttpServletRequest request, LogisIn entity) {

		
		String[] filetag = { "buslicePic1", "roadTranPerPic1", "orgCodePic1",
				"taxCodePic1" };


		for (int i = 0; i < filetag.length; i++) {

			try {

				
				List<String> list_info = BpmTool.getInstance().uploadPicture(
						request, filetag[i].toString());

				if (null != list_info) {
					if (filetag[i].toString().equals("buslicePic1")) { // 营业执照
						System.out.println(list_info.get(0));
						entity.setBuslicePic(list_info.get(0));
					} else if (filetag[i].toString().equals("roadTranPerPic1")) {// 道路运输许可证
						System.out.println(list_info.get(0));
						entity.setRoadTranPerPic(list_info.get(0));
					} else if (filetag[i].toString().equals("orgCodePic1")) {// 组织机构代码证
						System.out.println(list_info.get(0));
						entity.setOrgCodePic(list_info.get(0));
					} else if (filetag[i].toString().equals("taxCodePic1")) {// 税务登记证号码
						System.out.println(list_info.get(0));
						entity.setTaxCodePic(list_info.get(0));
					}
				}

			} catch (Exception e) { // TODO Auto-generated catch block
				logger.error("上传失败", e);
			}
		}
			
		logisInService.saveLogisIn(entity);
		
		return  "/base/logisIn/logisIn_upload";
	
	}
}
