package com.kh.mainPage.model.vo;

import java.util.Date;

public class CafeAttachment {
	private int cafeFileNo;//	CAFE_FILE_NO	NUMBER
	private int cafeRefNo;//	CAFE_REF_NO	NUMBER
	private int type;//	TYPE	NUMBER
	private String originName;//	ORIGIN_NAME	VARCHAR2(225 BYTE)
	private String changeName;//	CHANGE_NAME	VARCHAR2(225 BYTE)
	private Date uploadDate;//	UPLOAD_DATE	DATE
	private String filePath;//	FILE_PATH	VARCHAR2(1000 BYTE)
	private String status;//	STATUS	VARCHAR2(1 BYTE)
	
	private String newPath;
	
	public CafeAttachment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CafeAttachment(int cafeFileNo, int cafeRefNo, int type, String originName, String changeName,
			Date uploadDate, String filePath, String status) {
		super();
		this.cafeFileNo = cafeFileNo;
		this.cafeRefNo = cafeRefNo;
		this.type = type;
		this.originName = originName;
		this.changeName = changeName;
		this.uploadDate = uploadDate;
		this.filePath = filePath;
		this.status = status;
	}

	
	public CafeAttachment(int cafeRefNo, String newPath) {
		super();
		this.cafeRefNo = cafeRefNo;
		this.newPath = newPath;
	}

	public String getNewPath() {
		return newPath;
	}

	public void setNewPath(String newPath) {
		this.newPath = newPath;
	}

	public int getCafeFileNo() {
		return cafeFileNo;
	}

	public void setCafeFileNo(int cafeFileNo) {
		this.cafeFileNo = cafeFileNo;
	}

	public int getCafeRefNo() {
		return cafeRefNo;
	}

	public void setCafeRefNo(int cafeRefNo) {
		this.cafeRefNo = cafeRefNo;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
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

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "CafeAttachment [cafeFileNo=" + cafeFileNo + ", cafeRefNo=" + cafeRefNo + ", type=" + type
				+ ", originName=" + originName + ", changeName=" + changeName + ", uploadDate=" + uploadDate
				+ ", filePath=" + filePath + ", status=" + status + ", newPath=" + newPath + "]";
	}


	
	
}
