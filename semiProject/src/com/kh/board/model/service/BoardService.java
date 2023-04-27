package com.kh.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Like;
import com.kh.board.model.vo.Location;
import com.kh.board.model.vo.ReReply;
import com.kh.board.model.vo.Reply;
import com.kh.board.model.vo.unLike;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.pageInfo;

public class BoardService {
	Connection conn = JDBCTemplate.getConnection();
	public int selectListCount() {
		
		int listCount = new BoardDao().selectListCount(conn);
		
		JDBCTemplate.close(conn);
		
		return listCount;
	}

	public ArrayList<Board> selectList(pageInfo pi) {
		
		ArrayList<Board> list = new BoardDao().selectList(conn, pi);
		
		JDBCTemplate.close(conn);
		
		return list ;
	}

	public ArrayList<Location> selectLocation() {
		
		ArrayList<Location> list = new BoardDao().selectLocation(conn);
		
		JDBCTemplate.close(conn);
		return list;
	}

	public int insertBoard(Board b, Attachment at) {
		
		int result = new BoardDao().insertBoard(conn,b);
		
		int result2 =0;
		
		if(at!=null) {
			result2 = new BoardDao().insertAttachment(conn,at);
		}else {
			result2 = 1;
		}
		
		if(result>0&&result2>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		
		return result*result2;
	}

	public int increaseCount(int bno) {
		
		int result = new BoardDao().increaseCount(conn, bno);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result;
	}

	public Board selectBoard(int bno) {
		Board b = new BoardDao().selectBoard(conn,bno);
		
		JDBCTemplate.close(conn);
		return b;
	}

	public Attachment selectAttachment(int bno) {
		Attachment at = new BoardDao().selectAttachment(conn, bno);
		
		JDBCTemplate.close(conn);
		return at;
	}
	
	public int selectByCategory(String keyword, String category) {
		int listCount = 0;
		
		if(category.equals("제목")) {
			listCount = new BoardDao().selectByTitle(conn,keyword);
		}else if(category.equals("내용")) {
			listCount = new BoardDao().selectByContent(conn,keyword);
		}else if(category.equals("작성자")) {
			listCount = new BoardDao().selectByWriter(conn,keyword);
		}
		
		
		JDBCTemplate.close(conn);
		return listCount;
	}
	public ArrayList<Board> searchBoard(String keyword, String category, pageInfo pi) {
		ArrayList<Board> list = new ArrayList<>();
		
		if(category.equals("제목")) {
			list = new BoardDao().searchTitle(conn, keyword, pi);
		}else if(category.equals("내용")) {
			list = new BoardDao().searchContent(conn,keyword,pi);
		}else if(category.equals("작성자")) {
			list = new BoardDao().searchWriter(conn,keyword, pi);
		}
		
		
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<Board> mostViewList(pageInfo pi) {
		ArrayList<Board> list = new BoardDao().mostViewList(conn, pi);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public int replyinsert(int bno, String content, int userNo) {
		int result = new BoardDao().replyinsert(conn,bno,content,userNo);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public ArrayList<Reply> selectReplyList(int bno) {
		ArrayList<Reply> list = new BoardDao().selectReplyList(conn,bno);
		
		JDBCTemplate.close(conn);
		return list;
	}

	public int deleteReply(int rno) {
		int result = new BoardDao().deleteReply(conn, rno);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result;
	}

	public int updateReply(int rno, String content) {
		int result = new BoardDao().updateReply(conn, rno, content);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result;
	}

	public int deleteBoard(int bno) {
		int result = new BoardDao().deleteBoard(conn, bno);
		
		
		if(result >0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int updateBoard(Board b, Attachment at) {
		//새로운 첨부파일 없고 기존 첨부 파일도 없는 경우  - board update
		//새로운 첨부파일 있고 기존 첨부파일 없는 경우 - board update / attachment insert
		//새로운 첨부파일 있고 기존 첨부파일 있는 경우 - board update/ attachment update
		int result = new BoardDao().updateBoard(conn,b);
		
		int result2 = 1;
		if(at!=null) {
			if(at.getFileNo()!=0) {
				result2 = new BoardDao().updateAttachment(conn,at);
			}else {
				result2 = new BoardDao().newInsertAttachment(conn,at);
			}
		}
		if(result>0 && result2>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result*result2;
	}
	//like 테이블에 추가
	public int insertLike(int bno, int uno) {
		int result = new BoardDao().insertLike(conn,bno,uno);
		
		int result2 =0;
		if(result>0) {
			result2 = new BoardDao().updateLike(conn, bno);
		}
		if(result>0&&result2>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		
		return result*result2;
	}
	//like 테이블에 추가
	public int insertUnLike(int bno, int uno) {
		int result = new BoardDao().insertUnLike(conn,bno,uno);
		
		int result2 =0;
		if(result>0) {
			result2 = new BoardDao().updateBad(conn, bno);
		}
		if(result>0&&result2>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		
		return result*result2;
	}
	//detail뷰에서 사용
	public Like likeSelectList(int bno) {
		Like l = new BoardDao().likeSelectList(conn, bno);
		
		JDBCTemplate.close(conn);
		return l;
	}
	//detail뷰에서 사용
	public unLike selectUnLikeList(int bno) {
		unLike ul = new BoardDao().unLikeSelectList(conn, bno);
		
		JDBCTemplate.close(conn);
		return ul;
	}

	public int chkUserUnLike(int uno) {
		int result = new BoardDao().chkUserUnLike(conn, uno);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}

	public int deleteUnLike(int uno, int bno) {
		int result = new BoardDao().deleteUnLike(conn, uno);
		
		int result2 = 0;
		
		if(result>0) {
			result2= new BoardDao().updateBad2(conn, bno);
		}
		if(result>0 && result2>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result*result2;
		
	}

	public int chkUserLike(int uno) {
		int result = new BoardDao().chkUserLike(conn, uno);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
		
	}

	public int deleteLike(int uno, int bno) {
		int result = new BoardDao().deleteLike(conn, uno);
		
		int result2 = 0;
		
		if(result>0) {
			result2= new BoardDao().updateLike2(conn, bno);
		}
		if(result>0 && result2>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result*result2;
		
	}

	public ArrayList<Board> sortLocation(pageInfo pi, int location) {
		ArrayList<Board> list = new ArrayList<>();
		switch(location) {
		case 1 : list = new BoardDao().selectDongJak(conn, pi); break;
		case 2 : list = new BoardDao().selectMaPo(conn, pi); break;
		case 3 : list = new BoardDao().selectSeoDaeMoon(conn, pi); break;
		case 4 : list = new BoardDao().selectYeongDeungPo(conn, pi); break;
		case 5 : list = new BoardDao().selectYangCheon(conn, pi); break;
		case 6 : list = new BoardDao().selectJung(conn, pi); break;
				
		}
		return list;
	}

	public int insertReReply(int rno, int bno, String content, int uno) {
		int result = new BoardDao().insertReReply(conn,bno,rno,content,uno);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<ReReply> selectReReplyList(int rno) {
		ArrayList<ReReply> list = new BoardDao().selectReReplyList(conn, rno);
		
		JDBCTemplate.close(conn);
		return list;
	}

	public int deleteReReply(int rrno, int rno) {
		int result = new BoardDao().deleteReReply(conn,rrno,rno);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int updateReReply(int rno, int rrno, String content) {
		int result = new BoardDao().updateReReply(conn, rno, rrno, content);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
		
	}
}

