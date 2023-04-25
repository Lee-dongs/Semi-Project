package com.kh.member.model.vo;

import java.util.Date;

public class CafeRequest {
	private int requestNo;
	private String requestWriter;
	private String cafeName;
	private String operationTime;
	private String address;
	private String content;
	private Date createDate;
	private String status;
	
	public CafeRequest() {
		super();
	}

	public CafeRequest(int requestNo, String cafeName, String content, Date createDate) {
		super();
		this.requestNo = requestNo;
		this.cafeName = cafeName;
		this.content = content;
		this.createDate = createDate;
	}

	public CafeRequest(int requestNo, String requestWriter, String cafeName, String operationTime, String address,
			String content, Date createDate, String status) {
		super();
		this.requestNo = requestNo;
		this.requestWriter = requestWriter;
		this.cafeName = cafeName;
		this.operationTime = operationTime;
		this.address = address;
		this.content = content;
		this.createDate = createDate;
		this.status = status;
	}

	public int getRequestNo() {
		return requestNo;
	}

	public void setRequestNo(int requestNo) {
		this.requestNo = requestNo;
	}

	public String getRequestWriter() {
		return requestWriter;
	}

	public void setRequestWriter(String requestWriter) {
		this.requestWriter = requestWriter;
	}

	public String getCafeName() {
		return cafeName;
	}

	public void setCafeName(String cafeName) {
		this.cafeName = cafeName;
	}

	public String getOperationTime() {
		return operationTime;
	}

	public void setOperationTime(String operationTime) {
		this.operationTime = operationTime;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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
		return "CafeRequest [requestNo=" + requestNo + ", requestWriter=" + requestWriter + ", cafeName=" + cafeName
				+ ", operationTime=" + operationTime + ", address=" + address + ", content=" + content + ", createDate="
				+ createDate + ", status=" + status + "]";
	}
	
	

}
