package com.kh.mainPage.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.mainPage.model.vo.Cafe;

public class MainPageDao {
	
	private Properties prop = new Properties();
	
	public MainPageDao() {
		String filePath = MainPageDao.class.getResource("/sql/mainPage/MainPage-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//카페 리스트 조회(번호, 이름, 주소 조회)
	public ArrayList<Cafe> selectCafeList(Connection conn, String location) {
		ArrayList<Cafe> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCafeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, location);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Cafe(rset.getInt(1),
								  rset.getString(2),
								  rset.getString(3)));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Cafe> selectCafeScore(Connection conn, ArrayList<Cafe> list) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCafeScore");
		
		try {
			pstmt = conn.prepareStatement(sql);
			for(int i=0; i<list.size(); i++) {
				pstmt.setInt(1, list.get(i).getCafeNo());
				rset = pstmt.executeQuery();
				if(rset.next()) {
					list.get(i).setScore(rset.getDouble("SCORE"));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Cafe> countReply(Connection conn, ArrayList<Cafe> list) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			for(int i=0; i<list.size(); i++) {
				pstmt.setInt(1, list.get(i).getCafeNo());
				rset = pstmt.executeQuery();
				if(rset.next()) {
					list.get(i).setReplyCount(rset.getInt(1));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

}
