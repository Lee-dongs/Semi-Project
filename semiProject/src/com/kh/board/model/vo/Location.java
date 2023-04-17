package com.kh.board.model.vo;

public class Location {
	private String locationCode;
	private String locationName;
	
	
	public Location() {
		super();
	}


	public Location(String locationCode, String locationName) {
		super();
		this.locationCode = locationCode;
		this.locationName = locationName;
	}


	public String getLocationCode() {
		return locationCode;
	}


	public void setLocationCode(String locationCode) {
		this.locationCode = locationCode;
	}


	public String getLocationName() {
		return locationName;
	}


	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}


	@Override
	public String toString() {
		return "location [locationCode=" + locationCode + ", locationName=" + locationName + "]";
	}
	
	
	
	
	
}
