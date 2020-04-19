package com.petmily.petsitterMyPage.reservation.model.vo;

import java.sql.Date;

public class PetsitterMypageDetail {
	
	private int reservationCode;
	private String userId;
	private String petsitterId;
	private int boardCode;
	private String checkInDate;
	private String checkOutDate;
	private String plusQuestions;
	private String priceEndDate;
	private int price;
	private String resType;
	private String petMedication;
	private String petPickUp;
	private String petSize;
	private int petBath;
	private String petBathTxt;
	private int petCode;
	public PetsitterMypageDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PetsitterMypageDetail(int reservationCode, String userId, String petsitterId, int boardCode,
			String checkInDate, String checkOutDate, String plusQuestions, String priceEndDate, int price,
			String resType, String petMedication, String petPickUp, String petSize, int petBath, String petBathTxt,
			int petCode) {
		super();
		this.reservationCode = reservationCode;
		this.userId = userId;
		this.petsitterId = petsitterId;
		this.boardCode = boardCode;
		this.checkInDate = checkInDate;
		this.checkOutDate = checkOutDate;
		this.plusQuestions = plusQuestions;
		this.priceEndDate = priceEndDate;
		this.price = price;
		this.resType = resType;
		this.petMedication = petMedication;
		this.petPickUp = petPickUp;
		this.petSize = petSize;
		this.petBath = petBath;
		this.petBathTxt = petBathTxt;
		this.petCode = petCode;
	}
	public int getReservationCode() {
		return reservationCode;
	}
	public void setReservationCode(int reservationCode) {
		this.reservationCode = reservationCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public String getCheckInDate() {
		return checkInDate;
	}
	public void setCheckInDate(String checkInDate) {
		this.checkInDate = checkInDate;
	}
	public String getCheckOutDate() {
		return checkOutDate;
	}
	public void setCheckOutDate(String checkOutDate) {
		this.checkOutDate = checkOutDate;
	}
	public String getPlusQuestions() {
		return plusQuestions;
	}
	public void setPlusQuestions(String plusQuestions) {
		this.plusQuestions = plusQuestions;
	}
	public String getPriceEndDate() {
		return priceEndDate;
	}
	public void setPriceEndDate(String priceEndDate) {
		this.priceEndDate = priceEndDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getResType() {
		return resType;
	}
	public void setResType(String resType) {
		this.resType = resType;
	}
	public String getPetMedication() {
		return petMedication;
	}
	public void setPetMedication(String petMedication) {
		this.petMedication = petMedication;
	}
	public String getPetPickUp() {
		return petPickUp;
	}
	public void setPetPickUp(String petPickUp) {
		this.petPickUp = petPickUp;
	}
	public String getPetSize() {
		return petSize;
	}
	public void setPetSize(String petSize) {
		this.petSize = petSize;
	}
	public int getPetBath() {
		return petBath;
	}
	public void setPetBath(int petBath) {
		this.petBath = petBath;
	}
	public String getPetBathTxt() {
		return petBathTxt;
	}
	public void setPetBathTxt(String petBathTxt) {
		this.petBathTxt = petBathTxt;
	}
	public int getPetCode() {
		return petCode;
	}
	public void setPetCode(int petCode) {
		this.petCode = petCode;
	}
	@Override
	public String toString() {
		return "PetsitterMypageDetail [reservationCode=" + reservationCode + ", userId=" + userId + ", petsitterId="
				+ petsitterId + ", boardCode=" + boardCode + ", checkInDate=" + checkInDate + ", checkOutDate="
				+ checkOutDate + ", plusQuestions=" + plusQuestions + ", priceEndDate=" + priceEndDate + ", price="
				+ price + ", resType=" + resType + ", petMedication=" + petMedication + ", petPickUp=" + petPickUp
				+ ", petSize=" + petSize + ", petBath=" + petBath + ", petBathTxt=" + petBathTxt + ", petCode="
				+ petCode + "]";
	}
	
	
	

}
