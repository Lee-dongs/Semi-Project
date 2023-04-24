package com.kh.board.model.vo;

import java.sql.Date;

public class Board {
	int boardNo;
	String boardWriter;
	String locationCode;
	String title;
	String content;
	int count;
	Date createDate;
	Date modifyDate;
	String status;
	int good;
	int bad;
	public Board() {
		super();
	}
	public Board(int boardNo, String boardWriter, String locationCode, String title, String content, int count,
			Date createDate, Date modifyDate, String status, int good, int bad) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.locationCode = locationCode;
		this.title = title;
		this.content = content;
		this.count = count;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.good = good;
		this.bad = bad;
	}
	
	public Board(int boardNo,String locationCode, String title, String boardWriter,  int count, Date createDate) {
		super();
		this.boardNo = boardNo;
		this.locationCode = locationCode;
		this.title = title;
		this.boardWriter = boardWriter;
		this.count = count;
		this.createDate = createDate;
	}
	
	public Board(int boardNo, String locationCode, String title, String content,String boardWriter, Date createDate,int count,int good, int bad) {
		super();
		this.boardNo = boardNo;
		this.locationCode = locationCode;
		this.title = title;
		this.content = content;
		this.boardWriter = boardWriter;
		this.createDate = createDate;
		this.count = count;
		this.good = good;
		this.bad = bad;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	public String getLocationCode() {
		return locationCode;
	}
	public void setLocationCode(String locationCode) {
		this.locationCode = locationCode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
	}
	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardWriter=" + boardWriter + ", locationCode=" + locationCode
				+ ", title=" + title + ", content=" + content + ", count=" + count + ", createDate=" + createDate
				+ ", modifyDate=" + modifyDate + ", status=" + status + ", good=" + good + ", bad=" + bad + "]";
	}
	
	
	
}
