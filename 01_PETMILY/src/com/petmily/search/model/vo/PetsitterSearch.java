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
	
	
	

	
	
}
