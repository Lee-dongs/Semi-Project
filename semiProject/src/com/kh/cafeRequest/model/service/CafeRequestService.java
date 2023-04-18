package com.kh.cafeRequest.model.service;

import java.sql.Connection;

import com.kh.cafeRequest.model.dao.CafeRequestDao;
import com.kh.cafeRequest.model.vo.Cafe;
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
			result2 = new CafeRequestDao().insertCafeAttachment(conn,atRe);
		}
		
		if(result>0 && result2>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		return result*result2;
	}
}
