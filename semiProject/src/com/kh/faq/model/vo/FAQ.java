package com.kh.faq.model.vo;

public class FAQ {
private int faqNo;//	FAQ_NO
private String faqTitle;//	FAQ_TITLE
private String faqContent;//	FAQ_CONTENT
private String faqWriter;//	FAQ_WRITER
private String status;//	STATUS
public FAQ() {
	super();
}
public FAQ(int faqNo, String faqTitle, String faqContent) {
	super();
	this.faqNo = faqNo;
	this.faqTitle = faqTitle;
	this.faqContent = faqContent;
}
public FAQ(int faqNo, String faqTitle, String faqContent, String faqWriter, String status) {
	super();
	this.faqNo = faqNo;
	this.faqTitle = faqTitle;
	this.faqContent = faqContent;
	this.faqWriter = faqWriter;
	this.status = status;
}
public int getFaqNo() {
	return faqNo;
}
public void setFaqNo(int faqNo) {
	this.faqNo = faqNo;
}
public String getFaqTitle() {
	return faqTitle;
}
public void setFaqTitle(String faqTitle) {
	this.faqTitle = faqTitle;
}
public String getFaqContent() {
	return faqContent;
}
public void setFaqContent(String faqContent) {
	this.faqContent = faqContent;
}
public String getFaqWriter() {
	return faqWriter;
}
public void setFaqWriter(String faqWriter) {
	this.faqWriter = faqWriter;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
@Override
public String toString() {
	return "FAQ [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", faqWriter=" + faqWriter
			+ ", status=" + status + "]";
}



}
