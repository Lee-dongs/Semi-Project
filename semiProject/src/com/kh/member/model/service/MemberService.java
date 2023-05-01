package com.kh.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.vo.Attachment;
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
	public int insertMember(Member m, Attachment at) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		// 첨부파일 있거나 없거나 회원가입실행
		int result1 = new MemberDao().insertMember(conn, m);
		
		// 첨부파일 있으면 프로필사진 등록 
		int result2 = 1;
		if(at != null) {
			result2 = new MemberDao().insertAttachment(conn, at);
		}
		
		if(result1 > 0 && result2 > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		return result1 * result2;
	} 
	// 로그인 메소드
	public Member longinMember(String userId, String userPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		
		JDBCTemplate.close(conn);
				
		return m;
	}
	// 로그인시 프로필 사진 가져오는 메소드
	public Attachment selectAttachment(String userId) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Attachment at = new MemberDao().selectAttachment(conn, userId);
		
		JDBCTemplate.close(conn);
		
		return at;
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
	
	// 마이페이지 아이디찾기 메소드
	public Member findUserId(String userName, String userEmail) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new Member();
		
		m = new MemberDao().findUserId(conn, userName, userEmail);
		
		JDBCTemplate.close(conn);
		
		return m;
	}
	// 비밀번호 찾기 - 랜덤으로 생성한 새로운 비밀번호로 변경 메소드
	public int updatePwd(String userId, String newPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().updatePwd(conn, userId, newPwd);
		
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
	// 이메일 중복 체크 메소드
	public int checkEmail(String userEmail) {
		
		Connection conn = JDBCTemplate.getConnection();

		int count = new MemberDao().checkEmail(conn, userEmail);

		JDBCTemplate.close(conn);

		return count;
	}
	
	
}
