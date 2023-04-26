package com.kh.manager.model.vo;

public class Report {
	
	private int reportNo;
	private String userId;
	private String category;
	private String reportContent;
	private String reportWriter;
	public Report() {
		super();
	}
	public Report(int reportNo, String userId, String category, String reportContent, String reportWriter) {
		super();
		this.reportNo = reportNo;
		this.userId = userId;
		this.category = category;
		this.reportContent = reportContent;
		this.reportWriter = reportWriter;
	}
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public String getReportWriter() {
		return reportWriter;
	}
	public void setReportWriter(String reportWriter) {
		this.reportWriter = reportWriter;
	}
	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", userId=" + userId + ", category=" + category + ", reportContent="
				+ reportContent + ", reportWriter=" + reportWriter + "]";
	}
	
	
	

}
