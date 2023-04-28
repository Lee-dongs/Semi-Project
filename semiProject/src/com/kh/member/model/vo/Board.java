package com.kh.member.model.vo;

import java.util.Date;

public class Board {
	private int boardNo;
	private String boardWriter;
	private String locationCode;
	private String boardTitle;
	private String boardContent;
	private int count;
	private Date createDate;
	private Date modifyDate;
	private String status;
	
	public Board() {
		super();
	}

	

	public Board(int boardNo, String boardTitle, String boardContent, Date createDate) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.createDate = createDate;
	}



	public Board(int boardNo, String boardWriter, String locationCode, String boardTitle, String boardContent, int count,
			Date createDate, Date modifyDate, String status) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.locationCode = locationCode;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.count = count;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
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

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
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

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardWriter=" + boardWriter + ", locationCode=" + locationCode
				+ ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", count=" + count + ", createDate="
				+ createDate + ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}
	
	
}
