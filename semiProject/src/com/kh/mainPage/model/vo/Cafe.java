package com.kh.mainPage.model.vo;

import java.util.Date;

public class Cafe {
	private int cafeNo;// Cafe_NO NUMBER
	private String locationCode;// LOCATION_CODE VARCHAR2(2 BYTE)
	private String cafeName;// Cafe_NAME VARCHAR2(100 BYTE)
	private String operationTime;// OPERATION_TIME VARCHAR2(100 BYTE)
	private String offDay;// OFF_DAY VARCHAR2(30 BYTE)
	private String phone;// PHONE VARCHAR2(15 BYTE)
	private String address;// ADDRESS VARCHAR2(100 BYTE)
	private int count;// COUNT NUMBER
	private Date createDate;// CREATE_DATE DATE
	private String status;// STATUS VARCHAR2(1 BYTE)
	
	private double score;//평점
	
	private int replyCount;//리뷰개수
	
	private int scoreCount;//평점을 준 사람 수

	public int getScoreCount() {
		return scoreCount;
	}

	public void setScoreCount(int scoreCount) {
		this.scoreCount = scoreCount;
	}

	public Cafe() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Cafe(int CafeNo, String locationCode, String CafeName, String operationTime, String offDay, String phone,
			String address, int count, Date createDate, String status) {
		super();
		this.cafeNo = CafeNo;
		this.locationCode = locationCode;
		this.cafeName = CafeName;
		this.operationTime = operationTime;
		this.offDay = offDay;
		this.phone = phone;
		this.address = address;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
	}

	public Cafe(int cafeNo, String cafeName, String address) {
		super();
		this.cafeNo = cafeNo;
		this.cafeName = cafeName;
		this.address = address;
	}
	
	

	public Cafe(int cafeNo, String cafeName, String operationTime, String offDay, String phone, String address,
			int count) {
		super();
		this.cafeNo = cafeNo;
		this.cafeName = cafeName;
		this.operationTime = operationTime;
		this.offDay = offDay;
		this.phone = phone;
		this.address = address;
		this.count = count;
	}

	public double getScore() {
		return score;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public int getCafeNo() {
		return cafeNo;
	}

	public void setCafeNo(int CafeNo) {
		this.cafeNo = CafeNo;
	}

	public String getLocationCode() {
		return locationCode;
	}

	public void setLocationCode(String locationCode) {
		this.locationCode = locationCode;
	}

	public String getCafeName() {
		return cafeName;
	}

	public void setCafeName(String CafeName) {
		this.cafeName = CafeName;
	}

	public String getOperationTime() {
		return operationTime;
	}

	public void setOperationTime(String operationTime) {
		this.operationTime = operationTime;
	}

	public String getOffDay() {
		return offDay;
	}

	public void setOffDay(String offDay) {
		this.offDay = offDay;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Cafe [cafeNo=" + cafeNo + ", locationCode=" + locationCode + ", cafeName=" + cafeName
				+ ", operationTime=" + operationTime + ", offDay=" + offDay + ", phone=" + phone + ", address="
				+ address + ", count=" + count + ", createDate=" + createDate + ", status=" + status + ", score="
				+ score + ", replyCount=" + replyCount + ", scoreCount=" + scoreCount + "]";
	}

	

	

}
