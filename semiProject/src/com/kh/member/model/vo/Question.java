package com.kh.member.model.vo;

import java.util.Date;

public class Question {
	private int questionNo;
	private String questionTitle;
	private String questionWriter;
	private String content;
	private int count;
	private Date createDate;
	private Date modifyDate;
	private String status;
	
	public Question() {
		super();
	}

	public Question(int questionNo, String questionTitle, String content, Date createDate) {
		super();
		this.questionNo = questionNo;
		this.questionTitle = questionTitle;
		this.content = content;
		this.createDate = createDate;
	}

	public Question(int questionNo, String questionTitle, String questionWriter, String content, int count,
			Date createDate, Date modifyDate, String status) {
		super();
		this.questionNo = questionNo;
		this.questionTitle = questionTitle;
		this.questionWriter = questionWriter;
		this.content = content;
		this.count = count;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Question [questionNo=" + questionNo + ", questionTitle=" + questionTitle + ", questionWriter="
				+ questionWriter + ", content=" + content + ", count=" + count + ", createDate=" + createDate
				+ ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}

	
}
