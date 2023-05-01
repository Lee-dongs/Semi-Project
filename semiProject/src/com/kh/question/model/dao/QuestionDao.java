package com.kh.question.model.dao;

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
import com.kh.question.model.vo.Question;
import com.kh.question.model.vo.Question_Reply;



public class QuestionDao {
	private Properties prop = new Properties();

	public QuestionDao(){
		String filePath = QuestionDao.class.getResource("/sql/question/question-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(filePath));

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int selectListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
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
		}
		return listCount;
	}

	public ArrayList<Question> selectList(Connection conn, pageInfo pi) {
		ArrayList<Question> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = (startRow + pi.getBoardLimit())-1;
			pstmt.setInt(1, startRow );
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Question(rset.getInt("QUESTION_NO")
						             ,rset.getString("QUESTION_TITLE")
						             ,rset.getString("USER_ID")
						             ,rset.getDate("MODIFY_DATE")));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public int insertQuestion(Connection conn, Question q) {
		int result =0;
		PreparedStatement pstmt =null;
		
		String sql = prop.getProperty("insertQuestion");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q.getQuestionTitle());
			pstmt.setString(2, q.getContent());
			pstmt.setInt(3, Integer.parseInt(q.getQuestionWriter()));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public int updateQuestion(Connection conn, Question q) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateQuestion");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q.getQuestionTitle());
			pstmt.setString(2, q.getContent());
			pstmt.setInt(3, q.getQuestionNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public Question seletQuestion(Connection conn, int questionNo) {
		Question qq = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("seletQuestion");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, questionNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				qq = new Question(rset.getInt("QUESTION_NO")
						         ,rset.getString("QUESTION_TITLE")
						         ,rset.getString("USER_ID")
						         ,rset.getString("CONTENT")
						         ,rset.getDate("MODIFY_DATE"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return qq;
	}

	public int questionReply(Connection conn, Question_Reply re) {
		int result =0;
		PreparedStatement pstmt =null;
		
		String sql = prop.getProperty("questionReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, re.getRefBno());
			pstmt.setInt(2, Integer.parseInt(re.getReplyWriter()));
			pstmt.setString(3, re.getReplyContent());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteQustion(Connection conn, int questionNo) {
		int result = 0;
		PreparedStatement pstmt =null;
		
		String sql = prop.getProperty("deleteQuestion");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, questionNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	public ArrayList<Question_Reply> selectReList(Connection conn, int questionNo) {
		ArrayList<Question_Reply> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, questionNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Question_Reply(rset.getInt("REPLY_NO")
						                   ,rset.getInt("REF_BNO")
						                   ,rset.getString("USER_ID")
						                   ,rset.getString("REPLY_CONTENT")
						                   ,rset.getString("CREATE_DATE")));
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

	public int deleteReply(Connection conn, int replyNo) {
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updateReply(Connection conn, int replyNo, String content) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setInt(2, replyNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Question> searchTitle(Connection conn, String searchText, pageInfo pi) {
		ArrayList<Question> list= new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchTitle");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchText);
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = (startRow + pi.getBoardLimit())-1;
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Question(rset.getInt("QUESTION_NO")
			             ,rset.getString("QUESTION_TITLE")
			             ,rset.getString("USER_ID")
			             ,rset.getDate("MODIFY_DATE")));
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

	public ArrayList<Question> searchContent(Connection conn, String searchText, pageInfo pi) {
		ArrayList<Question> list= new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchContent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchText);
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = (startRow + pi.getBoardLimit())-1;
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Question(rset.getInt("QUESTION_NO")
			             ,rset.getString("QUESTION_TITLE")
			             ,rset.getString("USER_ID")
			             ,rset.getDate("MODIFY_DATE")));
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

	public ArrayList<Question> searchWriter(Connection conn, String searchText, pageInfo pi) {
		ArrayList<Question> list= new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchWriter");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchText);
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = (startRow + pi.getBoardLimit())-1;
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Question(rset.getInt("QUESTION_NO")
			             ,rset.getString("QUESTION_TITLE")
			             ,rset.getString("USER_ID")
			             ,rset.getDate("MODIFY_DATE")));
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

	public int selectTitleCount(Connection conn, String searchText) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTitleCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchText);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return listCount;
	}

	public int selectContentCount(Connection conn, String searchText) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectContentCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchText);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount=rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return listCount;
	}

	public int selectWriterCount(Connection conn, String searchText) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectWriterCount");		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchText);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return listCount;
	}

	

	

	
}
