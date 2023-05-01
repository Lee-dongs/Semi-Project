package com.kh.manager.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.pageInfo;
import com.kh.manager.model.dao.ManagerDao;
import com.kh.manager.model.vo.Report;
import com.kh.member.model.vo.Member;

public class ManagerService {

	// 총 신고글 개수 가져오는 메소드
	public int selectListCount() {

		Connection conn = JDBCTemplate.getConnection();

		int listCount = new ManagerDao().selectListCount(conn);

		JDBCTemplate.close(conn);

		return listCount;
	}
	// 한 페이지에 보여줄 신고글 가져오는 메소드
	public ArrayList<Report> selectReport(pageInfo pi) {

		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Report> list = new ManagerDao().selectReport(conn, pi);
		
		JDBCTemplate.close(conn);
		
		return list;
	}
	// 회원 경고 수 +1
	public int increaseReport(String userId) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new ManagerDao().increaseReport(conn, userId);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
		
	}
	// 경고글 상태 변경
	public int updateReport(int reportNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new ManagerDao().updateReport(conn, reportNo);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	// 경고글 검색
	public ArrayList<Report> searchReport(pageInfo pi, String keyword, String searchBy) {

		Connection conn = JDBCTemplate.getConnection();

		ArrayList<Report> list = new ArrayList<>();

		if (searchBy.equals("userId")) { // 아이디로 신고글 검색
			list = new ManagerDao().searchReportById(conn, keyword, pi);
		} else { // 상세신고내용으로 신고글 검색
			list = new ManagerDao().searchReportByContent(conn, keyword, pi);
		}

		JDBCTemplate.close(conn);

		return list;
	}

	// 검색어에 따라서 총 검색결과 카운트(report)
	public int searchReportListCount(String keyword, String searchBy) {

		Connection conn = JDBCTemplate.getConnection();

		int count = 0;

		if (searchBy.equals("userId")) { // 아이디로 신고 검색
			count = new ManagerDao().countSearchReportById(conn, keyword);
		} else if(searchBy.equals("content")){ // 상세내용으로 신고 검색
			count = new ManagerDao().countSearchReportByContent(conn, keyword);
		}

		JDBCTemplate.close(conn);

		return count;
	}
	// 검색어에 따라서 총 검색결과 카운트(member)
	public int searchMemberListCount(String keyword, String searchBy) {
		
		Connection conn = JDBCTemplate.getConnection();

		int count = 0;

		if (searchBy.equals("userId")) { // 아이디로 멤버 검색
			count = new ManagerDao().countSearchMemberById(conn, keyword);
		} else { // 이름으로 멤머 검색
			count = new ManagerDao().countSearchMemberByName(conn, keyword);
		}

		JDBCTemplate.close(conn);

		return count;
	}

	// 관리자 회원관리 페이지 - 회원 검색 메소드
	public ArrayList<Member> searchMember(pageInfo pi, String keyword, String searchBy) {

		Connection conn = JDBCTemplate.getConnection();

		ArrayList<Member> list = new ArrayList<>();

		if (searchBy.equals("userId")) { // 아이디로 회원 검색
			list = new ManagerDao().searchMemberById(conn, keyword, pi);
		} else if(searchBy.equals("userName")){ // 이름으로 회원 검색
			list = new ManagerDao().searchMemberByName(conn, keyword, pi);
		}

		JDBCTemplate.close(conn);

		return list;

	}

	// 한 페이지에 보여줄 회원 조회 메소드
	public ArrayList<Member> selectMember(pageInfo pi) {

		Connection conn = JDBCTemplate.getConnection();

		ArrayList<Member> list = new ManagerDao().selectMember(conn, pi);

		JDBCTemplate.close(conn);

		return list;
	}
	// 총 회원 수 조회
	public int selectMemberListCount() {
		
		Connection conn = JDBCTemplate.getConnection();

		int listCount = new ManagerDao().selectMemberListCount(conn);

		JDBCTemplate.close(conn);

		return listCount;
	}
	
}
