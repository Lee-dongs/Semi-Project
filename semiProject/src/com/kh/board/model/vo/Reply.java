package com.kh.board.model.vo;

import java.sql.Date;

public class Reply {
	private int replyNo;
	private int refBno;
	private String replyWriter;
	private String content;
	private String createDate;
	private Date modifyDate;
	private String status;
	public Reply() {
		super();
	}
	public Reply(int replyNo, int refBno, String replyWriter, String content, String createDate, Date modifyDate,
			String status) {
		super();
		this.replyNo = replyNo;
		this.refBno = refBno;
		this.replyWriter = replyWriter;
		this.content = content;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;	
	}
	
	public Reply(int replyNo, String replyWriter, String content, String createDate) {
		super();
		this.replyNo = replyNo;
		this.replyWriter = replyWriter;
		this.content = content;
		this.createDate = createDate;
	}
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public int getRefBno() {
		return refBno;
	}
	public void setRefBno(int refBno) {
		this.refBno = refBno;
	}
	public String getReplyWriter() {
		return replyWriter;
	}
	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
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
		return "Reply [replyNo=" + replyNo + ", refBno=" + refBno + ", replyWriter=" + replyWriter + ", content="
				+ content + ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}
	
}
