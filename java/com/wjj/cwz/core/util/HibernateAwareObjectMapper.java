package com.wjj.cwz.core.util;

import java.text.SimpleDateFormat;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.SerializationConfig.Feature;
/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-2-9
 * 
 */
public class HibernateAwareObjectMapper extends ObjectMapper{

	public HibernateAwareObjectMapper() {
		setSerializerFactory(new HibernateAwareSerializerFactory());
		configure(Feature.FAIL_ON_EMPTY_BEANS, false);
//		configure(Feature.WRITE_DATES_AS_TIMESTAMPS,false);
		getSerializationConfig().setDateFormat(new SimpleDateFormat("yyyy-MM-dd") );
	}

	public void setPrettyPrint(boolean prettyPrint) {
		configure(Feature.INDENT_OUTPUT, prettyPrint);
	}
}
