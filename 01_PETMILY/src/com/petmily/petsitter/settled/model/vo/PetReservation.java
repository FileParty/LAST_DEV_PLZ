package com.petmily.petsitter.settled.model.vo;

import java.util.Date;

public class PetReservation {
//	펫시터 예약테이블
	private int reservationCode; // RESERVATION_CODE(예약테이블 코드)
	private int petCode; // PET_CODE (펫코드)
	private String petSitterId; // PET_SETTER_ID(펫시터 아이디)
	private int boardCode; // BOARD_CODE(게시판 코드)
	private Date checkInDate; // CHECKIN_DATE(체크인 날짜)
	private Date checkOutDate; // CHECKOUT_DATE(체크아웃 날짜)
	private String careType; // CARE_TYPE(케어 타입)
	private int price; // PRICE(합계금액)
	private int fees; // 수수료
	private String resType; // RES_TYPE(예약상태타입)
	
	public PetReservation() {
		// TODO Auto-generated constructor stub
	}

	public PetReservation(int reservationCode, int petCode, String petSitterId, int boardCode, Date checkInDate,
			Date checkOutDate, String careType, int price, int fees, String resType) {
		super();
		this.reservationCode = reservationCode;
		this.petCode = petCode;
		this.petSitterId = petSitterId;
		this.boardCode = boardCode;
		this.checkInDate = checkInDate;
		this.checkOutDate = checkOutDate;
		this.careType = careType;
		this.price = price;
		this.fees = fees;
		this.resType = resType;
	}

	public int getReservationCode() {
		return reservationCode;
	}

	public void setReservationCode(int reservationCode) {
		this.reservationCode = reservationCode;
	}

	public int getPetCode() {
		return petCode;
	}

	public void setPetCode(int petCode) {
		this.petCode = petCode;
	}

	public String getPetSitterId() {
		return petSitterId;
	}

	public void setPetSitterId(String petSitterId) {
		this.petSitterId = petSitterId;
	}

	public int getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}

	public Date getCheckInDate() {
		return checkInDate;
	}

	public void setCheckInDate(Date checkInDate) {
		this.checkInDate = checkInDate;
	}

	public Date getCheckOutDate() {
		return checkOutDate;
	}

	public void setCheckOutDate(Date checkOutDate) {
		this.checkOutDate = checkOutDate;
	}

	public String getCareType() {
		return careType;
	}

	public void setCareType(String careType) {
		this.careType = careType;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getFees() {
		return fees;
	}

	public void setFees(int fees) {
		this.fees = fees;
	}

	public String getResType() {
		return resType;
	}

	public void setResType(String resType) {
		this.resType = resType;
	}

	@Override
	public String toString() {
		return "PetReservation [reservationCode=" + reservationCode + ", petCode=" + petCode + ", petSitterId="
				+ petSitterId + ", boardCode=" + boardCode + ", checkInDate=" + checkInDate + ", checkOutDate="
				+ checkOutDate + ", careType=" + careType + ", price=" + price + ", fees=" + fees + ", resType="
				+ resType + "]";
	}
}
