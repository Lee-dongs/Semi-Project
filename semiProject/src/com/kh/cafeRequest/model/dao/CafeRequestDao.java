package com.kh.cafeRequest.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.board.model.dao.BoardDao;
import com.kh.cafeRequest.model.vo.Cafe;
import com.kh.common.JDBCTemplate;

public class CafeRequestDao {
	private Properties prop =new Properties();
	
	public CafeRequestDao() {
		String filePath = BoardDao.class.getResource("/sql/cafeRequest/CafeRequest-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//ajax 카페주소 확인 메소드
	public Cafe findCafeAddress(Connection conn, String cafeAddress) {
		PreparedStatement pstmt = null;
		ResultSet rset = null; 
		Cafe cafe = null;
		String sql = prop.getProperty("findCafeAddress");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cafeAddress);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				 cafe = new Cafe();
				 cafe.setCafeName(rset.getString("CAFE_NAME"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return cafe;
	}
}
