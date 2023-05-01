package com.kh.cafeRequest.model.vo;

import java.util.Date;

public class CafeRequestAttachment {
	
	private int fileNo;
	private int requestNo;
	private String originName;
	private String changeName;
	private String filePath;
	private Date createDate;
	private String status;
	
	public CafeRequestAttachment() {
		super();
	}

	public int getRequestNo() {
		return requestNo;
	}

	public CafeRequestAttachment(int requestNo) {
		super();
		this.requestNo = requestNo;
	}

	public void setRequestNo(int requestNo) {
		this.requestNo = requestNo;
	}

	public CafeRequestAttachment(int fileNo, int requestNo, String originName, String changeName, String filePath,
			Date createDate, String status) {
		super();
		this.fileNo = fileNo;
		this.requestNo = requestNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.createDate = createDate;
		this.status = status;
	}

	public CafeRequestAttachment(String changeName, String filePath) {
		super();
		this.changeName = changeName;
		this.filePath = filePath;
	}

	public CafeRequestAttachment(int fileNo, String originName, String changeName, String filePath, Date createDate,
			String status) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.createDate = createDate;
		this.status = status;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
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
		return "CafeRequestAttachment [fileNo=" + fileNo + ", requestNo=" + requestNo + ", originName=" + originName
				+ ", changeName=" + changeName + ", filePath=" + filePath + ", createDate=" + createDate + ", status="
				+ status + "]";
	}

	
	
	
	

}
