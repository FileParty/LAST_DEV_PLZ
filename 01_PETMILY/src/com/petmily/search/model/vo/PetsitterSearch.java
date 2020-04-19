package com.petmily.search.model.vo;

import java.util.List;

public class PetsitterSearch {

	private String proPetsitter;
	
	private String petsitterId;
	
	private int boardCode;
	
	//게시글 키값
	private String boardTitle;
	// 게시글 제목
	private String boardInfo;
	// 게시글 소개글
	
	private int oneDayCareSprice;
	private int oneDayCareMprice;
	private int oneDayCareBprice;
	// 1일 케어 소형중형대형 동물 요금
	private String boardAddress;
	//게시글 작성자 주소
	private String boardAddressComment;
	// 펫시터 주소 추가 코멘트
	private String boardBlind;
	// 펫시터 정보 블라인드 여부
	private List<String> imgFile;
	// 펫시터 전체 후기 갯수
	private int reviewCount;
	private boolean bookmark;
	
	public PetsitterSearch() {
		// TODO Auto-generated constructor stub
	}

	public String getProPetsitter() {
		return proPetsitter;
	}

	public void setProPetsitter(String proPetsitter) {
		this.proPetsitter = proPetsitter;
	}

	public String getPetsitterId() {
		return petsitterId;
	}

	public void setPetsitterId(String petsitterId) {
		this.petsitterId = petsitterId;
	}

	public int getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardInfo() {
		return boardInfo;
	}

	public void setBoardInfo(String boardInfo) {
		this.boardInfo = boardInfo;
	}

	public int getOneDayCareSprice() {
		return oneDayCareSprice;
	}

	public void setOneDayCareSprice(int oneDayCareSprice) {
		this.oneDayCareSprice = oneDayCareSprice;
	}

	public int getOneDayCareMprice() {
		return oneDayCareMprice;
	}

	public void setOneDayCareMprice(int oneDayCareMprice) {
		this.oneDayCareMprice = oneDayCareMprice;
	}

	public int getOneDayCareBprice() {
		return oneDayCareBprice;
	}

	public void setOneDayCareBprice(int oneDayCareBprice) {
		this.oneDayCareBprice = oneDayCareBprice;
	}

	public String getBoardAddress() {
		return boardAddress;
	}

	public void setBoardAddress(String boardAddress) {
		this.boardAddress = boardAddress;
	}

	public String getBoardAddressComment() {
		return boardAddressComment;
	}

	public void setBoardAddressComment(String boardAddressComment) {
		this.boardAddressComment = boardAddressComment;
	}

	public String getBoardBlind() {
		return boardBlind;
	}

	public void setBoardBlind(String boardBlind) {
		this.boardBlind = boardBlind;
	}

	public List<String> getImgFile() {
		return imgFile;
	}

	public void setImgFile(List<String> imgFile) {
		this.imgFile = imgFile;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public boolean isBookmark() {
		return bookmark;
	}

	public void setBookmark(boolean bookmark) {
		this.bookmark = bookmark;
	}

	public void setPrefer(boolean flag) {
		// TODO Auto-generated method stub
		
	}

	
	

	
	
}
