package com.kh.manager.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.pageInfo;
import com.kh.manager.model.dao.ManagerDao;
import com.kh.manager.model.vo.Report;

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
	
}
