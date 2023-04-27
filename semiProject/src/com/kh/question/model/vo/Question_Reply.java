package com.kh.question.model.vo;

import java.sql.Date;

public class Question_Reply {
private int replyNo;//	REPLY_NO
private int refBno;//	REF_BNO
private String replyWriter;//	REPLY_WRITER
private String replyContent;//	REPLY_CONTENT
private String createDate;//	CREATE_DATE
private String status;//	STATUS
public Question_Reply() {
	super();
}

public Question_Reply(int replyNo, int refBno, String replyWriter, String replyContent, String createDate) {
	super();
	this.replyNo = replyNo;
	this.refBno = refBno;
	this.replyWriter = replyWriter;
	this.replyContent = replyContent;
	this.createDate = createDate;
}

public Question_Reply(int replyNo, int refBno, String replyWriter, String replyContent,
		String createDate, String status) {
	super();
	this.replyNo = replyNo;
	this.refBno = refBno;
	this.replyWriter = replyWriter;
	this.replyContent = replyContent;
	this.createDate = createDate;
	this.status = status;
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

public String getReplyContent() {
	return replyContent;
}

public void setReplyContent(String replyContent) {
	this.replyContent = replyContent;
}

public String getCreateDate() {
	return createDate;
}

public void setCreateDate(String createDate) {
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
	return "Question_Reply [replyNo=" + replyNo + ", refBno=" + refBno + ", replyWriter=" + replyWriter
			+ ", replyContent=" + replyContent + ", createDate=" + createDate + ", status=" + status + "]";
}








}
