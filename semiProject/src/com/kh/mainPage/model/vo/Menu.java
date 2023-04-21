package com.kh.mainPage.model.vo;

public class Menu {
	private String menuName;//	MENU_NAME	VARCHAR2(50 BYTE)
	private int cafePrice;//	CAFE_PRICE	NUMBER
	
	public Menu() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Menu(String menuName, int cafePrice) {
		super();
		this.menuName = menuName;
		this.cafePrice = cafePrice;
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
		return "Menu [menuName=" + menuName + ", cafePrice=" + cafePrice + "]";
	}
	
	
}
