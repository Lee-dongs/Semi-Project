package com.kh.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Board;
import com.kh.member.model.vo.BoardReply;
import com.kh.member.model.vo.CafeRequest;
import com.kh.member.model.vo.CafeRequestReply;
import com.kh.member.model.vo.Member;
import com.kh.member.model.vo.Question;
import com.kh.member.model.vo.QuestionReply;

public class MemberService {

	
	// 회원가입 메소드
	public int insertMember(Member m) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		return result;
	} 
	// 로그인 메소드
	public Member longinMember(String userId, String userPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		
		JDBCTemplate.close(conn);
				
		return m;
	}
	// 아이디 중복확인 메소드
	public int checkId(String checkId) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int count = new MemberDao().checkId(conn, checkId);
		
		JDBCTemplate.close(conn);
		
		return count;
	}
	// 카카오 로그인 메소드
	public int kakaoLoginMember(Member m) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().kakaoLoginMember(conn, m);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	//회원탈퇴 메소드
	public int deleteMember(String userId) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		result = new MemberDao().deleteMember(conn,userId);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result;
	}
	
	//댓글 있는 카페 요청글 조회 메소드
	public ArrayList<CafeRequest> selectCafeRequestWith(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<CafeRequest> aList = new MemberDao().selectCafeRequestWith(conn,userNo);
		JDBCTemplate.close(conn);
		return aList;
	}
	
	//댓글 있는 게시글 조회 메소드
	public ArrayList<Board> selectBoardWith(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Board> bList = new MemberDao().selectBoardWith(conn,userNo);
		JDBCTemplate.close(conn);
		return bList;
	}
	
	//댓글 있는 질문글 조회 메소드
	public ArrayList<Question> selectQuestionWith(int userId) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Question> qList = new MemberDao().selectQuestionWith(conn,userId);
		JDBCTemplate.close(conn);
		return qList;
	}
	
	//카페요청 댓글 조회 메소드
	public ArrayList<CafeRequestReply> selectCafeReqeustReply(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<CafeRequestReply> crList = new MemberDao().selectCafeRequestReply(conn,userNo);
		JDBCTemplate.close(conn);
		return crList;
	}
	
	//카페요청 댓글 조회 메소드
	public ArrayList<BoardReply> selectBoardReply(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<BoardReply> brList = new MemberDao().selectBoardReply(conn,userNo);
		JDBCTemplate.close(conn);
		return brList;
	}
	
	//질문글 댓글 조회 메소드
	public ArrayList<QuestionReply> selectQuestionReply(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<QuestionReply> qrList = new MemberDao().selectQuestionReply(conn,userNo);
		JDBCTemplate.close(conn);
		return qrList;
	}
	
	//게시글 댓글 읽음 표시 메소드
	public int ReadBoardReply(int userId) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().ReadBoardReply(conn,userId);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}
	
	//카페 요청글 댓글 읽음 표시 메소드
	public int ReadRequestReply(int userId) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().ReadRequestReply(conn,userId);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}
	
	//질문글 댓글 읽음 표시 메소드
	public int ReadQuestionReply(int userId) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().ReadQuestionReply(conn,userId);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}
	
	//남은 게시글 댓글 개수 세는 메소드
	public int CountBoardReply(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		int count = new MemberDao().CountBoardReply(conn,boardNo);
		JDBCTemplate.close(conn);
		return count;
	}
	
	//남은 요청글 댓글 개수 세는 메소드
	public int CountRequestReply(int requestNo) {
		Connection conn = JDBCTemplate.getConnection();
		int count = new MemberDao().CountRequestReply(conn,requestNo);
		JDBCTemplate.close(conn);
		return count;
	}
	
	//남은 질문글 댓글 개수 세는 메소드
	public int CountQuestionReply(int questionNo) {
		Connection conn = JDBCTemplate.getConnection();
		int count = new MemberDao().CountQuestionReply(conn,questionNo);
		JDBCTemplate.close(conn);
		return count;
	}
	
	//멤버 정보 수정 메소드
	public int updateMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().updateMember(conn,m);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	
	
}
