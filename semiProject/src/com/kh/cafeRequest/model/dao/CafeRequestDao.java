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
import com.kh.cafeRequest.model.vo.CafeRequest;
import com.kh.cafeRequest.model.vo.CafeRequestAttachment;
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

	//카페등록 요청 메소드
	public int insertCafeRequest(Connection conn, CafeRequest cafeRe) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertCafeRequest");
		
		try {
			pstmt = conn.prepareStatement(sql);
//			REQUEST_WRITER,CAFE_NAME,OPERATION_TIME,ADDRESS,CONTENT
			pstmt.setInt(1,cafeRe.getRequestWriter());
			pstmt.setString(2, cafeRe.getCafeName());
			pstmt.setString(3, cafeRe.getOperationTime());
			pstmt.setString(4, cafeRe.getAddress());
			pstmt.setString(5, cafeRe.getContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	//카페 등록 요청 첨부파일 등록 메소드
	public int insertCafeAttachment(Connection conn, CafeRequestAttachment atRe) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertCafeAttachment");
		
		
		try {
			pstmt=conn.prepareStatement(sql);
//			FILE_NO,REQUEST_NO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH
			pstmt.setString(1, atRe.getOriginName());
			pstmt.setString(2, atRe.getChangeName());
			pstmt.setString(3, atRe.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
}
