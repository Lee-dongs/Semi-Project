package com.kh.board.model.vo;

public class Like {
	private int likeNo;
	private int userNo;
	private int boardNo;
	private int goodCount;
	public Like() {
		super();
	}
	public Like(int likeNo, int userNo, int boardNo, int goodCount) {
		super();
		this.likeNo = likeNo;
		this.userNo = userNo;
		this.boardNo = boardNo;
		this.goodCount = goodCount;
	}
	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getGoodCount() {
		return goodCount;
	}
	public void setGoodCount(int goodCount) {
		this.goodCount = goodCount;
	}
	@Override
	public String toString() {
		return "Like [likeNo=" + likeNo + ", userNo=" + userNo + ", boardNo=" + boardNo + ", goodCount=" + goodCount
				+ "]";
	}
}
	