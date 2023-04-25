package com.kh.board.model.vo;

public class unLike {
	private int unLikeNo;
	private int userNo;
	private int boardNo;
	private int badCount;
	public unLike() {
		super();
	}
	public unLike(int unLikeNo, int userNo, int boardNo, int badCount) {
		super();
		this.unLikeNo = unLikeNo;
		this.userNo = userNo;
		this.boardNo = boardNo;
		this.badCount = badCount;
	}
	public int getUnLikeNo() {
		return unLikeNo;
	}
	public void setUnLikeNo(int unLikeNo) {
		this.unLikeNo = unLikeNo;
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
	public int getBadCount() {
		return badCount;
	}
	public void setBadCount(int badCount) {
		this.badCount = badCount;
	}
	@Override
	public String toString() {
		return "unLike [unLikeNo=" + unLikeNo + ", userNo=" + userNo + ", boardNo=" + boardNo + ", badCount=" + badCount
				+ "]";
	}
	
	
}
