package com.kh.board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Location;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.pageInfo;

public class BoardDao {
	private Properties prop =new Properties();
	
	public BoardDao() {
		String filePath = BoardDao.class.getResource("/sql/board/Board-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int selectListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return listCount;
	}

	public ArrayList<Board> selectList(Connection conn, pageInfo pi) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = (startRow + pi.getBoardLimit())-1;
			pstmt.setInt(1, startRow );
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO")
								  ,rset.getString("LOCATION_NAME")
								  ,rset.getString("BOARD_TITLE")
								  ,rset.getString("USER_ID")
								  ,rset.getInt("COUNT")
								  ,rset.getDate("CREATE_DATE")));
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Location> selectLocation(Connection conn) {
		ArrayList<Location> list = new ArrayList<>();
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectLocation");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				list.add(new Location(rset.getString("LOCATION_CODE")
									 ,rset.getString("LOCATION_NAME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return list;
	}

	public int insertBoard(Connection conn, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(b.getBoardWriter()));
			pstmt.setString(2, b.getLocationCode());
			pstmt.setString(3, b.getTitle());
			pstmt.setString(4, b.getContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int insertAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	public int increaseCount(Connection conn, int bno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(conn);
		}
		return result;
	}

	public Board selectBoard(Connection conn, int bno) {
		Board b =null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				b = new Board(rset.getInt("BOARD_NO")
							 ,rset.getString("LOCATION_NAME")
							 ,rset.getString("BOARD_TITLE")
							 ,rset.getString("BOARD_CONTENT")
							 ,rset.getString("USER_ID")
							 ,rset.getDate("CREATE_DATE")
							 ,rset.getInt("COUNT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return b;
	}

	public Attachment selectAttachment(Connection conn, int bno) {
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment(rset.getInt("BOARD_FILE_NO")
								   ,rset.getString("ORIGIN_NAME")
								   ,rset.getString("CHANG_NAME")
								   ,rset.getString("FILE_PATH"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return at;
	}

	public ArrayList<Board> searchTitle(Connection conn, String keyword, pageInfo pi) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchTitle");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = (startRow + pi.getBoardLimit())-1;
			pstmt.setInt(2, startRow );
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO")
								  ,rset.getString("LOCATION_NAME")
								  ,rset.getString("BOARD_TITLE")
								  ,rset.getString("USER_ID")
								  ,rset.getInt("COUNT")
								  ,rset.getDate("CREATE_DATE")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		
		return list;
	}

	public ArrayList<Board> searchContent(Connection conn, String keyword, pageInfo pi) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchContent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = (startRow + pi.getBoardLimit())-1;
			pstmt.setInt(2, startRow );
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO")
								  ,rset.getString("LOCATION_NAME")
								  ,rset.getString("BOARD_TITLE")
								  ,rset.getString("USER_ID")
								  ,rset.getInt("COUNT")
								  ,rset.getDate("CREATE_DATE")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Board> searchWriter(Connection conn, String keyword, pageInfo pi) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchWriter");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = (startRow + pi.getBoardLimit())-1;
			pstmt.setInt(2, startRow );
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO")
								  ,rset.getString("LOCATION_NAME")
								  ,rset.getString("BOARD_TITLE")
								  ,rset.getString("USER_ID")
								  ,rset.getInt("COUNT")
								  ,rset.getDate("CREATE_DATE")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		return list;
	}

	public ArrayList<Board> mostViewList(Connection conn, pageInfo pi) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("mostViewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = (startRow + pi.getBoardLimit())-1;
			pstmt.setInt(1, startRow );
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO")
								  ,rset.getString("LOCATION_NAME")
								  ,rset.getString("BOARD_TITLE")
								  ,rset.getString("USER_ID")
								  ,rset.getInt("COUNT")
								  ,rset.getDate("CREATE_DATE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}	
}