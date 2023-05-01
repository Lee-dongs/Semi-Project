package com.kh.cafeRequest.model.vo;

public class CafeMenu {
	private int cafeNo;
	private String menuName;
	private int cafePrice;
	
	public CafeMenu() {
		super();
	}

	public CafeMenu(int cafeNo, String menuName, int cafePrice) {
		super();
		this.cafeNo = cafeNo;
		this.menuName = menuName;
		this.cafePrice = cafePrice;
	}

	public int getCafeNo() {
		return cafeNo;
	}

	public void setCafeNo(int cafeNo) {
		this.cafeNo = cafeNo;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public int getCafePrice() {
		return cafePrice;
	}

	public void setCafePrice(int cafePrice) {
		this.cafePrice = cafePrice;
	}

	@Override
	public String toString() {
		return "CafeMenu [cafeNo=" + cafeNo + ", menuName=" + menuName + ", cafePrice=" + cafePrice + "]";
	}

	
}
