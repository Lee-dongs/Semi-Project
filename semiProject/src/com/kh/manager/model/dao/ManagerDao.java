package com.kh.manager.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.pageInfo;
import com.kh.manager.model.vo.Report;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class ManagerDao {
	
private Properties prop = new Properties();
	
	public ManagerDao() {
		
		String filePath = MemberDao.class.getResource("/sql/manager/manager-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 총 신고글 개수 가져오는 메소드
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		ResultSet rset = null;
		Statement stmt = null;
		String sql = prop.getProperty("selectListCount");

		try {
			stmt = conn.createStatement();

			rset = stmt.executeQuery(sql);

			if (rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
	
		return listCount;
	}
	// 한 페이지에 보여줄 신고글
	public ArrayList<Report> selectReport(Connection conn, pageInfo pi) {
		
		ArrayList<Report> list = new ArrayList<>();
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = (startRow + pi.getBoardLimit()) - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Report(rset.getInt("REPORT_NO")
						, rset.getString("USER_ID")
						, rset.getString("CATEGORY")
						, rset.getString("REPORT_CONTENT")
						, rset.getString("REPORT_WRITER")
						));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}
	// 회원 경고 카운트+1 메소드
	public int increaseReport(Connection conn, String userId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	// 신고글 삭제 메소드
	public int updateReport(Connection conn, int reportNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reportNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	// 아이디로 신고글 조회
	public ArrayList<Report> searchReportById(Connection conn, String keyword, pageInfo pi) {
		
		ArrayList<Report> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("searchReportById");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = (startRow + pi.getBoardLimit()) - 1;
			
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Report(rset.getInt("REPORT_NO")
						, rset.getString("USER_ID")
						, rset.getString("CATEGORY")
						, rset.getString("REPORT_CONTENT")
						, rset.getString("REPORT_WRITER")
						));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}
	// 신고사유로 신고글 조회
	public ArrayList<Report> searchReportByContent(Connection conn, String keyword, pageInfo pi) {
		
		ArrayList<Report> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("searchReportByContent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = (startRow + pi.getBoardLimit()) - 1;
			
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Report(rset.getInt("REPORT_NO")
						, rset.getString("USER_ID")
						, rset.getString("CATEGORY")
						, rset.getString("REPORT_CONTENT")
						, rset.getString("REPORT_WRITER")
						));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}
	// 아이디로 검색시 회원 수 카운트
	public int countSearchMemberById(Connection conn, String keyword) {
		
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("countSearchMemberById");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		

		return listCount;
	}
	// 이름으로 검색시 회원 수 카운트
	public int countSearchMemberByName(Connection conn, String keyword) {
		
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("countSearchMemberByName");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
	
		return listCount;
	}
	// 아이디로 검색시 신고글 카운트
	public int countSearchReportById(Connection conn, String keyword) {
		
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("countSearchReportById");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return listCount;
	}
	// 상세내용 검색시 신고글 카운트
	public int countSearchReportByContent(Connection conn, String keyword) {
		
		int listCount = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("countSearchReportByContent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return listCount;
	}

	// 회원관리페이지-한페이지에 보여줄 회원조회
	public ArrayList<Member> selectMember(Connection conn, pageInfo pi) {

		ArrayList<Member> list = new ArrayList<>();

		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectMember");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = (startRow + pi.getBoardLimit()) - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Member(rset.getInt("USER_NO")
								  , rset.getString("USER_ID")
								  , rset.getString("USER_PWD")
								  , rset.getString("USER_NAME")
								  , rset.getString("PHONE")
								  , rset.getString("EMAIL")
								  , rset.getString("ADDRESS")
								  , rset.getString("BIRTH")
								  , rset.getInt("REPORT")
								  , rset.getDate("ENROLL_DATE")
								  , rset.getDate("MODIFY_DATE")
								  , rset.getString("STATUS")
								  , rset.getString("KAKAO")));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return list;
	}

	// 아이디로 회원 검색하는 메소드
	public ArrayList<Member> searchMemberById(Connection conn, String keyword, pageInfo pi) {

		ArrayList<Member> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("searchMemberById");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = (startRow + pi.getBoardLimit()) - 1;

			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Member(rset.getInt("USER_NO")
								  , rset.getString("USER_ID")
								  , rset.getString("USER_PWD")
								  , rset.getString("USER_NAME")
								  , rset.getString("PHONE")
								  , rset.getString("EMAIL")
								  , rset.getString("ADDRESS")
								  , rset.getString("BIRTH")
								  , rset.getInt("REPORT")
								  , rset.getDate("ENROLL_DATE")
								  , rset.getDate("MODIFY_DATE")
								  , rset.getString("STATUS")
								  , rset.getString("KAKAO")));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return list;
	}

	// 이름으로 회원 검색하는 메소드
	public ArrayList<Member> searchMemberByName(Connection conn, String keyword, pageInfo pi) {

		ArrayList<Member> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("searchMemberByName");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = (startRow + pi.getBoardLimit()) - 1;

			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Member(rset.getInt("USER_NO")
								  , rset.getString("USER_ID")
								  , rset.getString("USER_PWD")
								  , rset.getString("USER_NAME")
								  , rset.getString("PHONE")
								  , rset.getString("EMAIL")
								  , rset.getString("ADDRESS")
								  , rset.getString("BIRTH")
								  , rset.getInt("REPORT")
								  , rset.getDate("ENROLL_DATE")
								  , rset.getDate("MODIFY_DATE")
								  , rset.getString("STATUS")
								  , rset.getString("KAKAO")));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return list;
	}
	// 총 회원 수 조회
	public int selectMemberListCount(Connection conn) {
		
		int listCount = 0;
		ResultSet rset = null;
		Statement stmt = null;
		String sql = prop.getProperty("selectMemberListCount");

		try {
			stmt = conn.createStatement();

			rset = stmt.executeQuery(sql);

			if (rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
	
		return listCount;
	}

}
