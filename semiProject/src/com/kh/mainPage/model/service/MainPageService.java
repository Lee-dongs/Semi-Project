package com.kh.mainPage.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import java.util.LinkedHashMap;
import java.util.List;

import com.kh.common.JDBCTemplate;
import com.kh.mainPage.model.dao.MainPageDao;
import com.kh.mainPage.model.vo.Cafe;
import com.kh.mainPage.model.vo.CafeAttachment;
import com.kh.mainPage.model.vo.CafeReply;

public class MainPageService {

	public ArrayList<Cafe> selectCafeList(String location) { //카페 리스트 조회
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Cafe> list = new MainPageDao().selectCafeList(conn, location);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public ArrayList<Cafe> selectCafeScore(ArrayList<Cafe> list) { //카페 점수 조회
		Connection conn = JDBCTemplate.getConnection();
		
		list = new MainPageDao().selectCafeScore(conn,  list);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public ArrayList<Cafe> countReply(ArrayList<Cafe> list) { //리뷰 개수 조회
		Connection conn = JDBCTemplate.getConnection();
		
		list = new MainPageDao().countReply(conn, list);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public Cafe selectCafeInfo(String address) { //카페 정보 조회
		Connection conn = JDBCTemplate.getConnection();
		
		Cafe cafe = new MainPageDao().selectCafeInfo(conn, address);
		
		JDBCTemplate.close(conn);
		
		return cafe;
	}

	public Cafe countScore(Cafe cafe) { //조회수 조회
		Connection conn = JDBCTemplate.getConnection();
		
		cafe = new MainPageDao().countScore(conn, cafe);
		
		JDBCTemplate.close(conn);
		
		return cafe;
	}

	public LinkedHashMap<String, Integer> selectMenu(int cafeNo) { //메뉴와 가격 조회
		Connection conn = JDBCTemplate.getConnection();
		
		LinkedHashMap<String, Integer> map = new MainPageDao().selectMenu(conn, cafeNo);
		
		JDBCTemplate.close(conn);
		
		return map;
	}

	public ArrayList<CafeAttachment> selectAttachmentList(ArrayList<Cafe> list) { //카페 대문 이미지 조회
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<CafeAttachment> cfatList = new MainPageDao().selectAttachmentList(conn, list);
		
		JDBCTemplate.close(conn);
		
		return cfatList;
	}
	
	public String selectTitleChangeName(int cafeNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		String titleChangeName = new MainPageDao().selectTitleChangeName(conn, cafeNo);
		
		JDBCTemplate.close(conn);
		
		return titleChangeName;
	}

	public ArrayList<CafeAttachment> selectDetailAtList(int cafeNo) { //세부 사진 리스트 조회
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<CafeAttachment> detailAtList = new MainPageDao().selectDetailAtList(conn, cafeNo);
		
		JDBCTemplate.close(conn);
		
		return detailAtList;
	}

	public ArrayList<CafeReply> selectReplyList(int cafeNo) { //댓글 리스트 조회
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<CafeReply> list = new MainPageDao().selectReplyList(conn, cafeNo);
		
		JDBCTemplate.close(conn);
		
		return list;
	}
	
	public int checkScore(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int checkId = new MainPageDao().checkScore(conn, userNo);
		
		JDBCTemplate.close(conn);
		
		return checkId;
	}

	public int insertScore(int cafeNo, int userNo, ArrayList<Integer> list) { //점수(별점) 삽입
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MainPageDao().insertScore(conn, cafeNo, userNo, list);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	public int updateScore(int cafeNo, int userNo, ArrayList<Integer> list) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MainPageDao().updateScore(conn, cafeNo, userNo, list);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int insertReview(int cafeNo, int userNo, String content) { //리뷰 삽입
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MainPageDao().insertReview(conn, cafeNo, userNo, content);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int insertReport(String userId, String category, String content, String reportWriter) { //리뷰 신고
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MainPageDao().insertReport(conn, userId, category, content, reportWriter);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int increaseCount(String address) { //조회수 증가
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MainPageDao().increaseCount(conn, address);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int deleteCafe(String add) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MainPageDao().deleteCafe(conn, add);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int updateReview(int cafeReplyNo, String content) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MainPageDao().updateReview(conn, cafeReplyNo, content);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int deleteReview(int cafeReplyNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MainPageDao().deleteReview(conn, cafeReplyNo);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int updateCafeAttachment(ArrayList<CafeAttachment> list, Cafe cafe, List<String> foodName, LinkedHashMap<String, Integer> map) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MainPageDao().updateCafeAttachment(conn, list);
		
		if(result>0) {
			int result2 = new MainPageDao().updateCafe(conn, cafe);

			result = result * result2;
			
			if(result>0) {
				int result3 = new MainPageDao().updateMenu(conn, cafe.getCafeNo(), foodName, map);
				
				result = result * result3;
				
				if(result>0) {
					JDBCTemplate.commit(conn);
				}
			}
		}
		
		if(result == 0) {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

}
