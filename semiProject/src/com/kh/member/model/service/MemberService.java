package com.kh.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.pageInfo;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

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
	// 한 페이지에 보여줄 회원 조회 메소드
	public ArrayList<Member> selectMember(pageInfo pi) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Member> list = new MemberDao().selectMember(conn, pi);
		
		JDBCTemplate.close(conn);
		
		return list;
	}
	// 총 게시글 수 구하는 메소드
	public int selectListCount() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new MemberDao().selectListCount(conn);
		
		JDBCTemplate.close(conn);
		
		return listCount;
	}
	// 관리자 회원관리 페이지 - 회원 검색 메소드
	public ArrayList<Member> searchMember(pageInfo pi, String keyword, String searchBy) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Member> list = new ArrayList<>();
		
		if(searchBy.equals("userId")) { // 아이디로 회원 검색
			list = new MemberDao().searchMemberById(conn, keyword, pi);
		}else { // 이름으로 회원 검색
			list = new MemberDao().searchMemberByName(conn, keyword, pi);
		}
		
		JDBCTemplate.close(conn);
		
		return list;

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
	
}
