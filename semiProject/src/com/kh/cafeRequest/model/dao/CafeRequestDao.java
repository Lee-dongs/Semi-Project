package com.kh.cafeRequest.model.dao;

import java.sql.Statement;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.cafeRequest.model.vo.Cafe;
import com.kh.cafeRequest.model.vo.CafeAttachment;
import com.kh.cafeRequest.model.vo.CafeMenu;
import com.kh.cafeRequest.model.vo.CafeRequest;
import com.kh.cafeRequest.model.vo.CafeRequestAttachment;
import com.kh.common.JDBCTemplate;

public class CafeRequestDao {
	private Properties prop =new Properties();
	
	public CafeRequestDao() {
		String filePath = CafeRequestDao.class.getResource("/sql/cafeRequest/CafeRequest-mapper.xml").getPath();
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
			pstmt.setInt(1,Integer.parseInt(cafeRe.getRequestWriter()));
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
	public int insertCafeRequestAttachment(Connection conn, CafeRequestAttachment atRe) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertCafeRequestAttachment");
		
		
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

	public ArrayList<CafeRequest> selectCafeRequest(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<CafeRequest> cList = new ArrayList<>();
		String sql = prop.getProperty("selectCafeRequest");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				cList.add(new CafeRequest(rset.getInt("REQUEST_NO"),
						                 rset.getString("USER_NAME"),
						                 rset.getString("CAFE_NAME"),
						                 rset.getString("OPERATION_TIME"),
						                 rset.getString("ADDRESS"),
						                 rset.getString("CONTENT"),
						                 rset.getDate("CREATE_DATE")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		
		return cList;
	}

	public CafeRequestAttachment selectCafeRequestAttachment(Connection conn, int requestNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCafeRequestAttachment");
		CafeRequestAttachment cAt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, requestNo);
			rset = pstmt.executeQuery();
				if(rset.next()) {
					cAt = new CafeRequestAttachment(rset.getString("CHANGE_NAME"),
													rset.getString("FILE_PATH"));
				}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return cAt;
	}
	
	//첨부파일이 있는 리쿼스트의 번호 불러오기
	public ArrayList<CafeRequestAttachment> selectRequestAttachmentNo(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRequestAttachmentNo");
		ArrayList<CafeRequestAttachment> aList = new ArrayList<>();
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			while(rset.next()) {
				aList.add(new CafeRequestAttachment(rset.getInt("REQUEST_NO")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return aList;
	}
	
	//첨부파일 삭제
	public int delectCafeRequestAttachment(Connection conn, ArrayList<Integer> attachNos) {
		PreparedStatement pstmt = null;
		int result = 1;
		String sql = prop.getProperty("delectCafeRequestAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			for(int i=0; i<attachNos.size(); i++) {
				pstmt.setInt(1, attachNos.get(i));
				result *= pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int delectCafeRequest(Connection conn, ArrayList<Integer> requestNos) {
		PreparedStatement pstmt = null;
		int result = 1;
		String sql = prop.getProperty("delectCafeRequest");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			for(int i=0; i<requestNos.size(); i++) {
				pstmt.setInt(1, requestNos.get(i));
				result *= pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	//리쿼스트에 답변달기
	public int replyCafeRequest(Connection conn, ArrayList<Integer> requestNos, String content, int writerNo) {
		PreparedStatement pstmt = null;
		int result = 1;
		String sql = prop.getProperty("replyCafeRequest");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			for(int i=0; i<requestNos.size();i++) {
				pstmt.setInt(1, requestNos.get(i));
				pstmt.setInt(2, writerNo);
				pstmt.setString(3, content);
				result *= pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	//카페 등록 메소드
	public int insertCafe(Connection conn, Cafe c) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertCafe");
		
		try {
			pstmt = conn.prepareStatement(sql);
//			LOCATION_CODE, CAFE_NAME, OPERATION_TIME, OFF_DAY, PHONE, ADDRESS
			pstmt.setString(1,c.getLocationCode());
			pstmt.setString(2,c.getCafeName());
			pstmt.setString(3, c.getOperationTime());
			pstmt.setString(4,c.getOffDay());
			pstmt.setString(5,c.getPhone());
			pstmt.setString(6,c.getAddress());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	//카페 메뉴 등록 메소드
	public int insertCafeMenu(Connection conn, ArrayList<CafeMenu> cmList) {
		PreparedStatement pstmt = null;
		int result = 1;
		String sql = prop.getProperty("insertCafeMenu");
		
		try {
			pstmt = conn.prepareStatement(sql);
			for(CafeMenu cm:cmList) {
				pstmt.setString(1, cm.getMenuName());
				pstmt.setInt(2, cm.getCafePrice());
				result *= pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	//카페 첨부파일 등록 메소드
	public int insertCafeAttachment(Connection conn, ArrayList<CafeAttachment> acList) {
		PreparedStatement pstmt = null;
		int result = 1;
		String sql = prop.getProperty("insertCafeAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			for(CafeAttachment ca:acList) {
				if(ca!=null) {
//				TYPE,ORIGIN_NAME,CHANGE_NAME,FILE_PATH
					pstmt.setInt(1,ca.getType());
					pstmt.setString(2, ca.getOriginName());
					pstmt.setString(3, ca.getChangeName());
					pstmt.setString(4, ca.getFilePath());
					result *= pstmt.executeUpdate();
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	//지역코드 찾는 메소드
	public String findCafeLocationCode(Connection conn, String location) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findCafeLocationCode");
		String locationCode = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, location);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				locationCode = rset.getString("LOCATION_CODE");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return locationCode;
	}

	
}
