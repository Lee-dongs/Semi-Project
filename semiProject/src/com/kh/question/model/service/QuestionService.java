package com.kh.question.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.pageInfo;
import com.kh.question.model.dao.QuestionDao;
import com.kh.question.model.vo.Question;
import com.kh.question.model.vo.Question_Reply;

public class QuestionService {

	public int selectListCount() {
		Connection conn = JDBCTemplate.getConnection();
		int listCount = new QuestionDao().selectListCount(conn);
		
		JDBCTemplate.close(conn);
		return listCount;
	}

	public ArrayList<Question> selectList(pageInfo pi) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Question> list = new QuestionDao().selectList(conn,pi);
		JDBCTemplate.close(conn);
		return list;
	}
	public int insertQuestion(Question q) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new QuestionDao().insertQuestion(conn,q);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public int updateQuestion(Question q) {
		Connection conn =JDBCTemplate.getConnection();
		int result = new QuestionDao().updateQuestion(conn,q);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	public Question seletQuestion(int questionNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		Question qq = new QuestionDao().seletQuestion(conn,questionNo);
		JDBCTemplate.close(conn);
		return qq;
	}

	public int questionReply(Question_Reply re) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new QuestionDao().questionReply(conn,re);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int deleteQustion(int questionNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new QuestionDao().deleteQustion(conn,questionNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<Question_Reply> selectReList(int questionNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Question_Reply> list = new QuestionDao().selectReList(conn,questionNo);
		
		JDBCTemplate.close(conn);
		return list;
	}

	public int deleteReply(int replyNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new QuestionDao().deleteReply(conn,replyNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int updateReply(int replyNo, String content) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new QuestionDao().updateReply(conn,replyNo,content);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
		
	}

	public ArrayList<Question> searchQuestion(String category, String searchText, pageInfo pi) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Question> list = new ArrayList<>();
		
		if(searchText != null) {
			
			if(category.equals("제목")) {
				list = new QuestionDao().searchTitle(conn,searchText,pi);
			}else if(category.equals("내용")) {
				list = new QuestionDao().searchContent(conn,searchText,pi);
			}else if(category.equals("작성자")) {
				list = new QuestionDao().searchWriter(conn,searchText,pi);
			}
		}
		JDBCTemplate.close(conn);
		return list;
	}

	public int searchListCount(String category, String searchText) {
		int listCount = 0;
		Connection conn = JDBCTemplate.getConnection();
		
		if(category.equals("제목")) {
			listCount = new QuestionDao().selectTitleCount(conn,searchText);
		}else if(category.equals("내용")) {
			listCount = new QuestionDao().selectContentCount(conn,searchText);
		}else if(category.equals("작성자")) {
			listCount = new QuestionDao().selectWriterCount(conn,searchText);
			
		}
		JDBCTemplate.close(conn);	
		return listCount;
	}

	

	

	

}
