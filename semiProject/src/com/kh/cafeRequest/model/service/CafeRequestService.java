package com.kh.cafeRequest.model.service;

import java.sql.Connection;

import com.kh.cafeRequest.model.dao.CafeRequestDao;
import com.kh.cafeRequest.model.vo.Cafe;
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
}
