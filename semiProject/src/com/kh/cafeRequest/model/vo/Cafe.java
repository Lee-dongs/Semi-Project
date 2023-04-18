package com.kh.cafeRequest.model.vo;

import java.sql.Date;

public class Cafe {
	private int CafeNo;
	private String locationCode;
	private String cafeName;
	private String operationTime;
	private String offDay;
	private String phone;
	private String address;
	private int count;
	private Date createDate;
	private String status;
	
	public Cafe() {
		super();
	}

	public Cafe(int cafeNo, String locationCode, String cafeName, String operationTime, String offDay, String phone,
			String address, int count, Date createDate, String status) {
		super();
		CafeNo = cafeNo;
		this.locationCode = locationCode;
		this.cafeName = cafeName;
		this.operationTime = operationTime;
		this.offDay = offDay;
		this.phone = phone;
		this.address = address;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
	}

	public int getCafeNo() {
		return CafeNo;
	}

	public void setCafeNo(int cafeNo) {
		CafeNo = cafeNo;
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

	public void setCafeName(String cafeName) {
		this.cafeName = cafeName;
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
		return "Cafe [CafeNo=" + CafeNo + ", locationCode=" + locationCode + ", cafeName=" + cafeName
				+ ", operationTime=" + operationTime + ", offDay=" + offDay + ", phone=" + phone + ", address="
				+ address + ", count=" + count + ", createDate=" + createDate + ", status=" + status + "]";
	}
	
	
	
}
