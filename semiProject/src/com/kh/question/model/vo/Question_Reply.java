package com.kh.question.model.vo;

import java.sql.Date;

public class Question_Reply {
private int replyNo;//	REPLY_NO
private int refBno;//	REF_BNO
private String replyTitle;//	REPLY_TITLE
private String replyWriter;//	REPLY_WRITER
private String replyContent;//	REPLY_CONTENT
private Date createDate;//	CREATE_DATE
private String status;//	STATUS
public Question_Reply() {
	super();
}
public Question_Reply(int replyNo, int refBno, String replyTitle, String replyWriter, String replyContent,
		Date createDate, String status) {
	super();
	this.replyNo = replyNo;
	this.refBno = refBno;
	this.replyTitle = replyTitle;
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
public String getReplyTitle() {
	return replyTitle;
}
public void setReplyTitle(String replyTitle) {
	this.replyTitle = replyTitle;
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
	return "Question_Reply [replyNo=" + replyNo + ", refBno=" + refBno + ", replyTitle=" + replyTitle + ", replyWriter="
			+ replyWriter + ", replyContent=" + replyContent + ", createDate=" + createDate + ", status=" + status
			+ "]";
}


}
