package com.kh.question.model.vo;

import java.sql.Date;

public class Question {
private int questionNo;//	QUESTION_NO
private String questionTitle;//	QUESTION_TITLE
private String questionWriter;//	QUESTION_WRITER
private String content;//	CONTENT
private int count;//	COUNT
private Date createDate;//	CREATE_DATE
private Date modifyDate;//	MODIFY_DATE
private String statud;//	STATUS
public Question() {
	super();
}

public Question(int questionNo, String questionTitle, String questionWriter, String content, Date modifyDate) {
	super();
	this.questionNo = questionNo;
	this.questionTitle = questionTitle;
	this.questionWriter = questionWriter;
	this.content = content;
	this.modifyDate = modifyDate;
}




public Question(int questionNo, String questionTitle, String questionWriter, String content, int count, Date createDate,
		Date modifyDate, String statud) {
	super();
	this.questionNo = questionNo;
	this.questionTitle = questionTitle;
	this.questionWriter = questionWriter;
	this.content = content;
	this.count = count;
	this.createDate = createDate;
	this.modifyDate = modifyDate;
	this.statud = statud;
}
public int getQuestionNo() {
	return questionNo;
}
public void setQuestionNo(int questionNo) {
	this.questionNo = questionNo;
}
public String getQuestionTitle() {
	return questionTitle;
}
public void setQuestionTitle(String questionTitle) {
	this.questionTitle = questionTitle;
}
public String getQuestionWriter() {
	return questionWriter;
}
public void setQuestionWriter(String questionWriter) {
	this.questionWriter = questionWriter;
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
public String getStatud() {
	return statud;
}
public void setStatud(String statud) {
	this.statud = statud;
}
@Override
public String toString() {
	return "Question [questionNo=" + questionNo + ", questionTitle=" + questionTitle + ", questionWriter="
			+ questionWriter + ", content=" + content + ", count=" + count + ", createDate=" + createDate
			+ ", modifyDate=" + modifyDate + ", statud=" + statud + "]";
}


}
