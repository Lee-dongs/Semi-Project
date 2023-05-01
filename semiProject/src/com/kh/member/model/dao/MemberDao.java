package com.kh.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.board.model.vo.Attachment;
import com.kh.common.JDBCTemplate;
import com.kh.member.model.vo.Board;
import com.kh.member.model.vo.BoardReply;
import com.kh.member.model.vo.CafeRequest;
import com.kh.member.model.vo.CafeRequestReply;
import com.kh.member.model.vo.Member;
import com.kh.member.model.vo.Question;
import com.kh.member.model.vo.QuestionReply;

public class MemberDao {

	
	private Properties prop = new Properties();
	
	public MemberDao() {
		String filePath = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	// 회원가입 메소드
	public int insertMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getAddress());
			pstmt.setString(7, m.getBirth());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	// 프로필사진 등록 메소드
	public int insertAttachment(Connection conn, Attachment at) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	// 로그인 메소드
	public Member loginMember(Connection conn, String userId, String userPwd) {
		
		Member m = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				m = new Member(rset.getInt("USER_NO")
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
						, rset.getString("KAKAO"));	
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
	
		return m;
	}

	// 로그인시 프로필사진 가져오는 메소드
	public Attachment selectAttachment(Connection conn, String userId) {

		Attachment at = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAttachment");

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment(rset.getInt("PROFILE_FILE_NO")
						, rset.getString("ORIGIN_NAME")
						, rset.getString("CHANGE_NAME")
						, rset.getString("FILE_PATH")); 
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return at;
	}

	// 아이디 중복확인 메소드
	public int checkId(Connection conn, String checkId) {
		
		int count = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("checkId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	public int deleteMember(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteMember");

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	// 카카오로그인 메소드
	public int kakaoLoginMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("kakaoLoginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getBirth());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	//댓글있는 게시글 조회 메소드
	public ArrayList<Board> selectBoardWith(Connection conn, int userNo) {
		ArrayList<Board> bList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoardWith"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			int boardNo = 0;
			while(rset.next()) {
				//BOARD_NO, BOARD_TITLE, BOARD_CONTENT
				if(boardNo==rset.getInt("BOARD_NO")) {
					continue;
				}
				bList.add(new Board(rset.getInt("BOARD_NO"),
						  			rset.getString("BOARD_TITLE"),
						  			rset.getString("BOARD_CONTENT"),
						  			rset.getDate("CREATE_DATE")));
				boardNo = rset.getInt("BOARD_NO");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return bList;
	}
	
	//댓글있는 카페요청글 조회 메소드
	public ArrayList<CafeRequest> selectCafeRequestWith(Connection conn, int userNo) {
		ArrayList<CafeRequest> cList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCafeRequestWith"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			int requestNo = 0;
			while(rset.next()) {
//				REQUEST_NO, CAFE_NAME, CONTENT, C.CREATE_DATE
				if(requestNo==rset.getInt("REQUEST_NO")) {
					continue;
				}
				cList.add(new CafeRequest(rset.getInt("REQUEST_NO"),
						  				  rset.getString("CAFE_NAME"),
						  			      rset.getString("CONTENT"),
						  			      rset.getDate("CREATE_DATE")));
				requestNo = rset.getInt("REQUEST_NO");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return cList;
	}
	
	//댓글있는 질문글 조회 메소드
	public ArrayList<Question> selectQuestionWith(Connection conn, int userNo) {
		ArrayList<Question> qList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQuestionWith");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			int questionNo = 0;
			while(rset.next()) {
//				QUESTION_NO, QUESTION_TITLE, CONTENT, Q.CREATE_DATE
				if(questionNo==rset.getInt("QUESTION_NO")){
					continue;
				}
				qList.add(new Question(rset.getInt("QUESTION_NO"),
									   rset.getString("QUESTION_TITLE"),
									   rset.getString("CONTENT"),
									   rset.getDate("CREATE_DATE")));
				questionNo = rset.getInt("QUESTION_NO");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return qList;
	}
	
	//카페요청글 댓글 조회
	public ArrayList<CafeRequestReply> selectCafeRequestReply(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCafeRequestReply");
		ArrayList<CafeRequestReply> crList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
//				REF_BNO, USER_ID, REPLY_CONTENT, CREATE_DATE
				crList.add(new CafeRequestReply(rset.getInt("REF_BNO"),
												rset.getString("USER_ID"),
												rset.getString("REPLY_CONTENT"),
												rset.getDate("CREATE_DATE")));
			};
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return crList;
	}
	
	//게시글 댓글 조회 
	public ArrayList<BoardReply> selectBoardReply(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoardReply");
		ArrayList<BoardReply> brList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
//				BOARD_REF_NO, USER_ID, BOARD_REPLY_CONTENT, CREATE_DATE
				brList.add(new BoardReply(rset.getInt("BOARD_REF_BNO"),
										  rset.getString("USER_ID"),
										  rset.getString("BOARD_REPLY_CONTENT"),
										  rset.getDate("CREATE_DATE")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return brList;
	}
	
	//질문글 댓글 조회
	public ArrayList<QuestionReply> selectQuestionReply(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQuestionReply");
		ArrayList<QuestionReply> qrList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
//				SELECT REF_BNO, USER_ID, REPLY_CONTENT, CREATE_DATE
				qrList.add(new QuestionReply(rset.getInt("REF_BNO"),
											 rset.getString("USER_ID"),
											 rset.getString("REPLY_CONTENT"),
											 rset.getDate("CREATE_DATE")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return qrList;
	}
	
	//게시글 댓글 읽음 메소드
	public int ReadBoardReply(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("ReadBoardReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	//카페 요청글 댓글 읽음 메소드
	public int ReadRequestReply(Connection conn, int requestNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("ReadRequestReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, requestNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	//질문글 댓글 읽음 메소드
	public int ReadQuestionReply(Connection conn, int questionNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("ReadQuestionReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,questionNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	//게시글 댓글 개수 세는 메소드
	public int CountBoardReply(Connection conn,int userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		String sql = prop.getProperty("CountBoardReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userId);
			rset = pstmt.executeQuery();
			int go = -1;
			while(rset.next()) {
				if(go==rset.getInt("BOARD_NO")) {
					continue;
				}
				count++;
				go = rset.getInt("BOARD_NO");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return count;
	}
	
	//카페요청 댓글 개수 세는 메소드
	public int CountRequestReply(Connection conn,int userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		String sql = prop.getProperty("CountRequestReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userId);
			rset = pstmt.executeQuery();
			int go = -1;
			while(rset.next()) {
				if(go==rset.getInt("REQUEST_NO")) {
					continue;
				}
				count++;
				go = rset.getInt("REQUEST_NO");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return count;
	}
	
	//질문글 댓글 개수 세는 메소드
	public int CountQuestionReply(Connection conn,int userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		String sql = prop.getProperty("CountQuestionReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,userId);
			rset = pstmt.executeQuery();
			int go = -1;
			while(rset.next()) {
				if(go==rset.getInt("QUESTION_NO")) {
					continue;
				}
				count++;
				go = rset.getInt("QUESTION_NO");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return count;
	}
	public int updateMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserPwd());
			pstmt.setString(2, m.getUserName());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getAddress());
			pstmt.setInt(6, m.getUserNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	// 회원 몇 명인지 가져오는 메소드
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		ResultSet rset = null;
		Statement stmt = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
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
	
	// 마이페이지 아이디찾기 메소드
	public Member findUserId(Connection conn, String userName, String userEmail) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findUserId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userEmail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next() && rset.getString("USER_NAME").equals(userName)) {
				m = new Member(rset.getString("USER_ID"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}
	// 비밀번호 찾기 - 랜덤으로 생성한 새로운 비밀번호로 변경 메소드
	public int updatePwd(Connection conn, String userId, String newPwd) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, newPwd);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	// 이메일 중복확인 메소드
	public int checkEmail(Connection conn, String userEmail) {
		
		int count = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("checkEmail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userEmail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	

}
