package com.kh.common;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
	
public static Connection getConnection() {
		
		Properties prop = new Properties();
		
		// �씫�뼱�뱾�씠怨좎옄�븯�뒗 driver.properties�뙆�씪�쓽 寃쎈줈瑜� �븣�븘�궡�꽌 ���엯�븯湲�
		String filePath = JDBCTemplate.class.getResource("/sql/driver/driver.properties").getPath();
		// 泥� 踰덉㎏ /�뒗 webcontent�쓽 classes�뙆�씪�쓣 �쓽誘명븿
		
		Connection conn = null;
		
		try {
			prop.load(new FileInputStream(filePath));
			
			
			// 1. jdbc driver�벑濡�
			Class.forName(prop.getProperty("driver")); 
			
			// 2. Connection媛앹껜 �깮�꽦
			conn = DriverManager.getConnection(prop.getProperty("url")
												, prop.getProperty("username")
												, prop.getProperty("password"));
			
			conn.setAutoCommit(false);
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
	}

	//2. �쟾�떖諛쏆� Connection媛앹껜瑜� 媛�吏�怨� commit�빐二쇰뒗 硫붿냼�뱶
	public static void commit(Connection conn) {
		
		try {
			if(conn != null && !conn.isClosed()){
				conn.commit();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 3. �쟾�떖諛쏆� Connection 媛앹껜瑜� 媛�吏�怨� rollback�빐二쇰뒗 硫붿냼�뱶
	public static void rollback(Connection conn) {
		
		try {
			if(conn!= null && !conn.isClosed()) {
				conn.rollback();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 4. �쟾�떖諛쏆� Connection媛앹껜瑜� 諛섎궔�븯�뒗 硫붿냼�뱶
	public static void close(Connection conn) {
		
		try {
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 5. �쟾�떖諛쏆� Statement媛앹껜 諛섎궔�븯�뒗 硫붿냼�뱶
	public static void close(Statement stmt) {
		
		try {
			if (stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 6. �쟾�떖諛쏆� ResultSet 媛앹껜瑜� 諛섎궔�븯�뒗 硫붿냼�뱶
	public static void close(ResultSet rset) {
		
		try {
			if(rset != null && !rset.isClosed()) {
				rset.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
