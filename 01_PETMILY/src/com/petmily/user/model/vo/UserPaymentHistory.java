package com.petmily.user.model.vo;

public class UserPaymentHistory {
//	[슬기 작업]
//	펫시터 예약테이블을 객체로 담아, 리스트로 띄울 것.
	private String checkIn;
	private String checkOut;
	private String petId;
	private String endDate;
	
	public UserPaymentHistory() {
		// TODO Auto-generated constructor stub
	}

	public UserPaymentHistory(String checkIn, String checkOut, String petId, String endDate) {
		super();
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.petId = petId;
		this.endDate = endDate;
	}

	public String getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}

	public String getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}

	public String getPetId() {
		return petId;
	}

	public void setPetId(String petId) {
		this.petId = petId;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "UserPaymentHistory [checkIn=" + checkIn + ", checkOut=" + checkOut + ", petId=" + petId + ", endDate="
				+ endDate + "]";
	}
	
	
}
