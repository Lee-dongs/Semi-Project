package com.kh.mainPage.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

import com.kh.common.JDBCTemplate;
import com.kh.mainPage.model.dao.MainPageDao;
import com.kh.mainPage.model.vo.Cafe;

public class MainPageService {

	public ArrayList<Cafe> selectCafeList(String location) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Cafe> list = new MainPageDao().selectCafeList(conn, location);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public ArrayList<Cafe> selectCafeScore(ArrayList<Cafe> list) {
		Connection conn = JDBCTemplate.getConnection();
		
		list = new MainPageDao().selectCafeScore(conn,  list);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public ArrayList<Cafe> countReply(ArrayList<Cafe> list) {
		Connection conn = JDBCTemplate.getConnection();
		
		list = new MainPageDao().countReply(conn, list);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public Cafe selectCafeInfo(String address) {
		Connection conn = JDBCTemplate.getConnection();
		
		Cafe cafe = new MainPageDao().selectCafeInfo(conn, address);
		
		JDBCTemplate.close(conn);
		
		return cafe;
	}

	public Cafe countScore(Cafe cafe) {
		Connection conn = JDBCTemplate.getConnection();
		
		cafe = new MainPageDao().countScore(conn, cafe);
		
		JDBCTemplate.close(conn);
		
		return cafe;
	}

	public LinkedHashMap<String, Integer> selectMenu(int cafeNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		LinkedHashMap<String, Integer> map = new MainPageDao().selectMenu(conn, cafeNo);
		
		JDBCTemplate.close(conn);
		
		return map;
	}

}
