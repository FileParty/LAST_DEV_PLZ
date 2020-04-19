package com.petmily.user.model.vo;

public class UserPaymentHistory {
//	[슬기 작업]
//	펫시터 예약테이블을 객체로 담아, 리스트로 띄울 것.
	private String checkIn;
	private String checkOut;
	private String name;
	private int price;
	private String endDate;
	
	public UserPaymentHistory() {
		// TODO Auto-generated constructor stub
	}

	public UserPaymentHistory(String checkIn, String checkOut, String name, int price, String endDate) {
		super();
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.name = name;
		this.price = price;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "UserPaymentHistory [checkIn=" + checkIn + ", checkOut=" + checkOut + ", name=" + name + ", price="
				+ price + ", endDate=" + endDate + "]";
	}

}
