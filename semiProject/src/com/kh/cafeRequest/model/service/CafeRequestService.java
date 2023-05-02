package com.kh.cafeRequest.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.cafeRequest.model.dao.CafeRequestDao;
import com.kh.cafeRequest.model.vo.Cafe;
import com.kh.cafeRequest.model.vo.CafeAttachment;
import com.kh.cafeRequest.model.vo.CafeMenu;
import com.kh.cafeRequest.model.vo.CafeRequest;
import com.kh.cafeRequest.model.vo.CafeRequestAttachment;
import com.kh.common.JDBCTemplate;

public class CafeRequestService {

	//ajax 카페주소 확인 메소드
	public Cafe findCafeAddress(String cafeAddress) {
		Connection conn = JDBCTemplate.getConnection();
		Cafe cafe = null;
		cafe = new CafeRequestDao().findCafeAddress(conn, cafeAddress);
		JDBCTemplate.close(conn);
		
		return cafe;
	}

	public int insertCafeRequest(CafeRequest cafeRe, CafeRequestAttachment atRe) {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		result = new CafeRequestDao().insertCafeRequest(conn,cafeRe);
		
		int result2 = 1;
		if(atRe!=null) {
			result2 = new CafeRequestDao().insertCafeRequestAttachment(conn,atRe);
		}
		
		if(result>0 && result2>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		return result*result2;
	}

	public ArrayList<CafeRequest> selectCafeRequest() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<CafeRequest> cList = new ArrayList<>();
		cList = new CafeRequestDao().selectCafeRequest(conn);
		JDBCTemplate.close(conn);
		return cList;
	}

	public CafeRequestAttachment selectCafeRequestAttachment(int requestNo) {
		Connection conn = JDBCTemplate.getConnection();
		CafeRequestAttachment cAt = new CafeRequestAttachment();
		cAt = new CafeRequestDao().selectCafeRequestAttachment(conn,requestNo);
		JDBCTemplate.close(conn);
		return cAt;
	}

	//첨부파일 삭제
	public int delectCafeRequestAttachment(ArrayList<Integer> attachNos) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new CafeRequestDao().delectCafeRequestAttachment(conn,attachNos);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}

	//첨부파일이 있는 리쿼스트의 번호 불러오기
	public ArrayList<CafeRequestAttachment> selectRequestAttachmentNo() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<CafeRequestAttachment> aList = new ArrayList<>();
		aList = new CafeRequestDao().selectRequestAttachmentNo(conn);
		JDBCTemplate.close(conn);
		return aList;
	}

	//리쿼스트 삭제
	public int delectCafeRequest(ArrayList<Integer> requestNos) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new CafeRequestDao().delectCafeRequest(conn,requestNos);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	//리쿼스트에 답변
	public int replyCafeRequest(ArrayList<Integer> requestNos, String content, int writerNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new CafeRequestDao().replyCafeRequest(conn,requestNos,content,writerNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}

	//카페정보 입력 메소드
	public int insertCafe(Cafe c, ArrayList<CafeMenu> cmList, ArrayList<CafeAttachment> acList) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new CafeRequestDao().insertCafe(conn, c);
		int result2 = new CafeRequestDao().insertCafeMenu(conn,cmList);
		int result3 = new CafeRequestDao().insertCafeAttachment(conn, acList);
		if((result*result2*result3)>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result*result2*result3;
	}

	//지역코드 찾는 메소드
	public String findCafeLocationCode(String location) {
		Connection conn = JDBCTemplate.getConnection();
		String locationCode = new CafeRequestDao().findCafeLocationCode(conn, location);
		JDBCTemplate.close(conn);
		return locationCode;
	}

	
}
