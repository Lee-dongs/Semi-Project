package com.kh.cafeRequest.model.vo;

public class CafeAttachment {

	private int cafeFileNo;
	private int cafeRefNo;
	private int type;
	private String originName;
	private String changeName;
	private String uploadDate;
	private String filePath;
	private String status;
	
	public CafeAttachment() {
		super();
	}

	public CafeAttachment(int cafeFileNo, int cafeRefNo, int type, String originName, String changeName,
			String uploadDate, String filePath, String status) {
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

	public String getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(String uploadDate) {
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
				+ ", filePath=" + filePath + ", status=" + status + "]";
	}
	
	
}
