package com.kh.member.model.vo;

import java.util.Date;

public class BoardReply {
	private int boardReplyNo;
	private int boardRefNo;
	private String boardReplyWriter;
	private String boardReplyContent;
	private Date createDate;
	private Date modifyDate;
	private String status;
	private String read;
	
	public BoardReply() {
		super();
	}

	public BoardReply(int boardRefNo, String boardReplyWriter, String boardReplyContent, Date createDate) {
		super();
		this.boardRefNo = boardRefNo;
		this.boardReplyWriter = boardReplyWriter;
		this.boardReplyContent = boardReplyContent;
		this.createDate = createDate;
	}

	public BoardReply(int boardReplyNo, int boardRefNo, String boardReplyWriter, String boardReplyContent, Date createDate,
			Date modifyDate, String status, String read) {
		super();
		this.boardReplyNo = boardReplyNo;
		this.boardRefNo = boardRefNo;
		this.boardReplyWriter = boardReplyWriter;
		this.boardReplyContent = boardReplyContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.read = read;
	}

	public int getBoardReplyNo() {
		return boardReplyNo;
	}

	public void setBoardReplyNo(int boardReplyNo) {
		this.boardReplyNo = boardReplyNo;
	}

	public int getBoardRefNo() {
		return boardRefNo;
	}

	public void setBoardRefNo(int boardRefNo) {
		this.boardRefNo = boardRefNo;
	}

	public String getBoardReplyWriter() {
		return boardReplyWriter;
	}

	public void setBoardReplyWriter(String boardReplyWriter) {
		this.boardReplyWriter = boardReplyWriter;
	}

	public String getBoardReplyContent() {
		return boardReplyContent;
	}

	public void setBoardReplyContent(String boardReplyContent) {
		this.boardReplyContent = boardReplyContent;
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

	public String getRead() {
		return read;
	}

	public void setRead(String read) {
		this.read = read;
	}

	@Override
	public String toString() {
		return "BoardReply [boardReplyNo=" + boardReplyNo + ", boardRefNo=" + boardRefNo + ", boardReplyWriter="
				+ boardReplyWriter + ", boardReplyContent=" + boardReplyContent + ", createDate=" + createDate
				+ ", modifyDate=" + modifyDate + ", status=" + status + ", read=" + read + "]";
	}

	
}
