package com.kh.board.model.vo;

import java.sql.Date;

public class ReReply {
	private int reReplyNo;
	private int refRno;
	private int refBno;
	private String reReplyWriter;
	private String content;
	private String createDate;
	private Date modifyDate;
	public ReReply() {
		super();
	}
	public ReReply(int reReplyNo,int refRno, int refBno, String reReplyWriter, String content, String createDate, Date modifyDate) {
		super();
		this.reReplyNo =reReplyNo;
		this.refRno = refRno;
		this.refBno = refBno;
		this.reReplyWriter = reReplyWriter;
		this.content = content;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
	}
	
	public ReReply(int reReplyNo, int refRno, int refBno, String reReplyWriter, String content, String createDate) {
		super();
		this.reReplyNo = reReplyNo;
		this.refRno = refRno;
		this.refBno = refBno;
		this.reReplyWriter = reReplyWriter;
		this.content = content;
		this.createDate = createDate;
	}
	public int getrefRno() {
		return refRno;
	}
	public void setrefRno(int reReplyNo) {
		this.refRno = reReplyNo;
	}
	public int getRefBno() {
		return refBno;
	}
	public void setRefBno(int refBno) {
		this.refBno = refBno;
	}
	public String getReReplyWriter() {
		return reReplyWriter;
	}
	public void setReReplyWriter(String reReplyWriter) {
		this.reReplyWriter = reReplyWriter;
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
	public int getReReplyNo() {
		return reReplyNo;
	}
	public void setReReplyNo(int reReplyNo) {
		this.reReplyNo = reReplyNo;
	}
	public int getRefRno() {
		return refRno;
	}
	public void setRefRno(int refRno) {
		this.refRno = refRno;
	}
	@Override
	public String toString() {
		return "ReReply [reReplyNo=" + reReplyNo + ", refRno=" + refRno + ", refBno=" + refBno + ", reReplyWriter="
				+ reReplyWriter + ", content=" + content + ", createDate=" + createDate + ", modifyDate=" + modifyDate
				+ "]";
	}
	
}
