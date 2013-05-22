package com.wjj.jbpm.service;


import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;

import com.wjj.cwz.core.db.DbUtil;

public class JbpmUserService {

	public void addUser(String userCode) {

		try {
			ResultSetHandler<Object[]> h = new ResultSetHandler<Object[]>() {
				public Object[] handle(ResultSet rs) throws SQLException {
					if (!rs.next()) {
						return null;
					}

					ResultSetMetaData meta = rs.getMetaData();
					int cols = meta.getColumnCount();
					Object[] result = new Object[cols];

					for (int i = 0; i < cols; i++) {
						result[i] = rs.getObject(i + 1);
					}

					return result;
				}
			};
			QueryRunner run = new QueryRunner(DbUtil.getDs());
			Object[] result = run.query("SELECT * FROM organizationalentity WHERE id=?", h, userCode);

			if (null == result || result.length == 0) {
				String sql = "insert into organizationalentity (id,DTYPE) values (?,'User')";
				String params[] = { userCode };
				run.update(sql, params);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

	}

    public static void main(String[] args) {
        new JbpmUserService().addUser("wjj");
    }
}
