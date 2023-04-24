package com.kh.mainPage.model.vo;

import java.util.Date;

public class CafeReply {
	private int cafeReplyNo;//	CAFE_REPLY_NO	NUMBER
	private int cafeNo;//	CAFE_NO	NUMBER
	private String cafeReplyWriter;//	CAFE_REPLY_WRITER	NUMBER
	private String cafeReplyContent;//	CAFE_REPLY_CONTENT	VARCHAR2(4000 BYTE)
	private Date createDate;//	CREATE_DATE	DATE
	private String status;//	STATUS	VARCHAR2(1 BYTE)
	
	public CafeReply() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CafeReply(int cafeReplyNo, int cafeNo, String cafeReplyWriter, String cafeReplyContent, Date createDate,
			String status) {
		super();
		this.cafeReplyNo = cafeReplyNo;
		this.cafeNo = cafeNo;
		this.cafeReplyWriter = cafeReplyWriter;
		this.cafeReplyContent = cafeReplyContent;
		this.createDate = createDate;
		this.status = status;
	}
	
	public CafeReply(int cafeReplyNo, String cafeReplyWriter, String cafeReplyContent, Date createDate) {
		super();
		this.cafeReplyNo = cafeReplyNo;
		this.cafeReplyWriter = cafeReplyWriter;
		this.cafeReplyContent = cafeReplyContent;
		this.createDate = createDate;
	}

	public int getCafeReplyNo() {
		return cafeReplyNo;
	}

	public void setCafeReplyNo(int cafeReplyNo) {
		this.cafeReplyNo = cafeReplyNo;
	}

	public int getCafeNo() {
		return cafeNo;
	}

	public void setCafeNo(int cafeNo) {
		this.cafeNo = cafeNo;
	}

	public String getCafeReplyWriter() {
		return cafeReplyWriter;
	}

	public void setCafeReplyWriter(String cafeReplyWriter) {
		this.cafeReplyWriter = cafeReplyWriter;
	}

	public String getCafeReplyContent() {
		return cafeReplyContent;
	}

	public void setCafeReplyContent(String cafeReplyContent) {
		this.cafeReplyContent = cafeReplyContent;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "CafeReply [cafeReplyNo=" + cafeReplyNo + ", cafeNo=" + cafeNo + ", cafeReplyWriter=" + cafeReplyWriter
				+ ", cafeReplyContent=" + cafeReplyContent + ", createDate=" + createDate + ", status=" + status + "]";
	}
	
	
}
