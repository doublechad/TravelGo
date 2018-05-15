package org.iii.www.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class JDBCsupportMe {
	private static Connection dataBase;
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		Properties prop =new Properties();
		prop.setProperty("user", "root");
		prop.setProperty("password", "root");
		dataBase = DriverManager.getConnection("jdbc:mysql://127.0.0.1/fsit04", prop);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	public static Connection getConnection() {
		return dataBase;
	}
	
}
