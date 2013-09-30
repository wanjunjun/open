package com.wjj.cwz.core.db;


import javax.sql.DataSource;

import org.apache.commons.configuration.Configuration;
import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.PropertiesConfiguration;

import com.mysql.jdbc.jdbc2.optional.MysqlConnectionPoolDataSource;
import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

/** 
*
* @author "Jack Q"
* @version 
* @create 2012-6-15 下午08:37:42 
* 
*/

public class DbUtil {

	private static Configuration config;
	private static MysqlConnectionPoolDataSource ds;

	static {
		try {
			config = new PropertiesConfiguration("spring/application.properties");
			ds = new MysqlConnectionPoolDataSource();
			ds.setServerName("tasksDB");
			ds.setURL(config.getString("dbutils.url"));
			ds.setUser(config.getString("dbutils.username"));
			ds.setPassword(config.getString("dbutils.password"));
			ds.setCharacterEncoding("utf8");
			ds.setMaxReconnects(30);
		} catch (ConfigurationException e) {

			e.printStackTrace();
		}
	}

	public static DataSource getDs() {
		return ds;
	}
}
