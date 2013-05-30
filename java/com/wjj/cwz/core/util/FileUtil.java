package com.wjj.cwz.core.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.util.Enumeration;
import java.util.List;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.apache.tools.zip.ZipEntry;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.collect.Lists;
import com.wjj.cwz.core.config.ConfigManager;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create Nov 23, 2012
 * 
 */
public class FileUtil {
	private static Logger logger = LoggerFactory.getLogger(FileUtil.class);
	
	/** 
     * 压缩文件 
     *  
     * @param srcfile File[] 需要压缩的文件列表 
     * @param zipfile File 压缩后的文件 
     */  
    public static void zipFiles(List<File> srcfile, File zipfile) {  
        byte[] buf = new byte[1024];  
        try {  
            // Create the ZIP file        	
            ZipOutputStream oout = new ZipOutputStream(new FileOutputStream(zipfile));
            org.apache.tools.zip.ZipOutputStream out = new org.apache.tools.zip.ZipOutputStream(new FileOutputStream(zipfile));
            out.setEncoding("gbk");
            // Compress the files  
            for (int i = 0; i < srcfile.size(); i++) {  
                File file = srcfile.get(i);  
                FileInputStream in = new FileInputStream(file);  
                // Add ZIP entry to output stream.  
                out.putNextEntry(new ZipEntry(file.getName()));  
                // Transfer bytes from the file to the ZIP file  
                int len;  
                while ((len = in.read(buf)) > 0) {  
                    out.write(buf, 0, len);  
                }  
                // Complete the entry  
                out.closeEntry();  
                in.close();  
            }  
            // Complete the ZIP file  
            out.close();  
        } catch (IOException e) {  
        	logger.error("ZipUtil zipFiles exception:"+e);  
        }  
    }
    
    /** 
     * 解压缩 
     *  
     * @param zipfile File 需要解压缩的文件 
     * @param descDir String 解压后的目标目录 
     */  
    public static void unZipFiles(File zipfile, String descDir) {  
        try {  
            // Open the ZIP file  
            ZipFile zf = new ZipFile(zipfile);  
            for (Enumeration entries = zf.entries(); entries.hasMoreElements();) {  
                // Get the entry name  
                ZipEntry entry = ((ZipEntry) entries.nextElement());  
                String zipEntryName = entry.getName();  
                InputStream in = zf.getInputStream(entry);  
                // System.out.println(zipEntryName);  
                OutputStream out = new FileOutputStream(descDir + zipEntryName);  
                byte[] buf1 = new byte[1024];  
                int len;  
                while ((len = in.read(buf1)) > 0) {  
                    out.write(buf1, 0, len);  
                }  
                // Close the file and stream  
                in.close();  
                out.close();  
            }  
        } catch (IOException e) {  
            logger.error("ZipUtil unZipFiles exception:"+e);  
        }  
    }
    
    public static String getReadMethod(String property){
    	return "get"+Character.toUpperCase(property.charAt(0)) + property.substring(1);
    }
    
    public static Object getValue(Object bean, String readMethod)throws Exception{
    	Method method = bean.getClass().getMethod(readMethod);
    	Object v = method.invoke(bean);
    	return v;
    }
    
    public static void writeExcel(String title, OutputStream os,Object list,String[] headers,String[] columns)throws Exception{
    	WritableWorkbook wwb = Workbook.createWorkbook(os);
    	WritableSheet ws  = wwb.createSheet(title, 0);
    	//add header
    	Label label = null;
		String content = null;
		int i=0;
		for(String header:headers){ //表头
			content = header;
			label = new Label(i,0,content);
			ws.addCell(label);
			i++;
		}
//		JSONObject jo;
		//add column
		List<Object> beans = (List<Object>) list;
		int row = 1;	
		String column = null;
		Object value = null, bean = null, pb = null;
		int point = 0;
		for(int k = 0; k < beans.size(); k++){ //行
			bean = beans.get(k);
			for(int j = 0; j < columns.length ; j++){ //列
				column = columns[j];
				point = column.indexOf(".");
				if(point > 0){
					pb = getValue(bean, getReadMethod(column.substring(0, point)));
					bean = pb;
					column = column.substring(point+1);
					point = 0;
				}
				String methodName = getReadMethod(column); 
				Method method = bean.getClass().getMethod(methodName);			
				value = method.invoke(bean);
				if(null != value){
					content = value.toString();
				}
				label = new Label(j,row,content);
				content="";
				ws.addCell(label);
				bean = beans.get(k);
			}				
			row++;
		}
		wwb.write();
		wwb.close();
		os.close();
    }
    
    public static void download(HttpServletResponse response, String fileName)throws Exception{
    	response.setContentType("multipart/form-data");
		response.setHeader("Content-Disposition", String.format("attachment; filename=\"%s\"", fileName));
		
		try {
			String upload_path = (String)ConfigManager.getInstance().getXmlConfig().get(Constants.FLOW_UPLOAD);
			File file=new File(upload_path+fileName); 
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
    }
    
    public static void main(String[] args){
    	List<File> src_files = Lists.newArrayList();
    	src_files.add(new File("e:/1.xlsx"));
    	src_files.add(new File("e:/2.xlsx"));
    	src_files.add(new File("e:/测试1.xlsx"));
    	
    	File zip = new File("e:/test.zip");
    	FileUtil.zipFiles(src_files, zip);
    }
}
