package com.kh.faq.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.faq.model.vo.FAQ;
import com.kh.faq.model.dao.FAQDao;

public class FAQService {

	public ArrayList<FAQ> selecList() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<FAQ> list = new FAQDao().selectList(conn);
		
		JDBCTemplate.close(conn);
		return list;
	}

	public int insertFAQ(FAQ f) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new FAQDao().insertFAQ(conn,f);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

}
