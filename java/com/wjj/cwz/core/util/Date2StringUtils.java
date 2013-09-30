package com.wjj.cwz.core.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;

public class Date2StringUtils {

	public final static String pattern_def ="yyyy-MM-dd";
	public final static String pattern_con ="yyyyMMdd";
	
	private final static String hour_zero=" 00:00:00";
	private final static String hour_end =" 23:59:59";
	
	public static SimpleDateFormat getDateFormat(String str) {
		return new java.text.SimpleDateFormat(str);
	}
	
	public static String date2String(Date date , String pattern){
		if(null == date){
			return null;
		}
		if(StringUtils.isBlank(pattern)){
			pattern = pattern_def;
		}
		return getDateFormat(pattern).format(date);
	}
	
	/**
	 * 当天 开始 结束 时间。
	 * 如 Thu Jun 07 00:00:00 CST 2012  当天的开始时间
	 *    Thu Jun 07 23:59:59 CST 2012  当天的结束时间
	 * @param today  Zero代表开始，End代表结束
	 * @return
	 */
	public static Date getToday(EnumPool.Today today){
		String date_str = date2String(new Date(),null);
		if(today == EnumPool.Today.Zero){
			date_str += hour_zero;
		}else {
			date_str += hour_end;
		}
		
		try {
			return DateUtils.parseDate(date_str, new String[]{"yyyy-MM-dd hh:mm:ss"});
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return null;
	}


	/**
	 * 获取当前月的最后一天   
	 * @param date
	 * @return
	 */
	public static Date lastDayOfMonth(Date date) { 
		Calendar cal = Calendar.getInstance(); 
		cal.setTime(date); 
		cal.set(Calendar.DAY_OF_MONTH, 1); 
		cal.roll(Calendar.DAY_OF_MONTH, -1);
		return cal.getTime();
		} 

	
}
