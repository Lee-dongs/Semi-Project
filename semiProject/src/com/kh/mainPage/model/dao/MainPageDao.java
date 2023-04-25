package com.kh.mainPage.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.mainPage.model.vo.Cafe;
import com.kh.mainPage.model.vo.CafeAttachment;
import com.kh.mainPage.model.vo.CafeReply;

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

	public ArrayList<CafeAttachment> selectAttachmentList(Connection conn, ArrayList<Cafe> list) {
		ArrayList<CafeAttachment> cfatList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachmentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			for(int i=0; i<list.size(); i++) {
				pstmt.setInt(1, list.get(i).getCafeNo());
				rset = pstmt.executeQuery();
				if(rset.next()) {
					cfatList.add(new CafeAttachment(rset.getInt(1),
													rset.getString(2)));	
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		

		return cfatList;
	}

	public Cafe selectCafeInfo(Connection conn, String address) {
		Cafe cafe = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCafeInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, address);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				if(rset.getString(4).equals("N")) {
					cafe = new Cafe(rset.getInt(1),
							rset.getString(2),
							rset.getString(3),
							"없음",
							rset.getString(5),
							rset.getString(6),
							rset.getInt(7));
				}else {
					cafe = new Cafe(rset.getInt(1),
							rset.getString(2),
							rset.getString(3),
							rset.getString(4),
							rset.getString(5),
							rset.getString(6),
							rset.getInt(7));
				}			
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

	public Cafe countScore(Connection conn, Cafe cafe) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("countScore");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cafe.getCafeNo());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				cafe.setScoreCount(rset.getInt(1));
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

	public LinkedHashMap<String, Integer> selectMenu(Connection conn, int cafeNo) {
		LinkedHashMap<String, Integer> map = new LinkedHashMap<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMenu");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cafeNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				map.put(rset.getString(1), rset.getInt(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return map;
	}

	public ArrayList<CafeAttachment> selectDetailAtList(Connection conn, int cafeNo) {
		ArrayList<CafeAttachment> detailAtList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDetailAtList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cafeNo);
			pstmt.setInt(2, 2);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				detailAtList.add(new CafeAttachment(rset.getInt(1),
													rset.getString(2)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
				
		return detailAtList;
	}

	public ArrayList<CafeReply> selectReplyList(Connection conn, int cafeNo) {
		ArrayList<CafeReply> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cafeNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new CafeReply(rset.getInt(1),
									   rset.getString(2),
									   rset.getString(3),
									   rset.getString(4),
									   rset.getDate(5)));
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

	public int insertScore(Connection conn, int cafeNo, int userNo, ArrayList<Integer> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertScore");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cafeNo);
			pstmt.setInt(2, userNo);
			pstmt.setInt(3, list.get(0));
			pstmt.setInt(4, list.get(1));
			pstmt.setInt(5, list.get(2));
			pstmt.setInt(6, list.get(3));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int insertReview(Connection conn, int cafeNo, int userNo, String content) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cafeNo);
			pstmt.setInt(2, userNo);
			pstmt.setString(3, content);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int insertReport(Connection conn, String userId, String category, String content, String reportWriter) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, category);
			pstmt.setString(3, content);
			pstmt.setString(4, reportWriter);
			
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
