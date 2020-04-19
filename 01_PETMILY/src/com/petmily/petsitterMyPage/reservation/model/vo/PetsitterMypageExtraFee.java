package com.petmily.petsitterMyPage.reservation.model.vo;

public class PetsitterMypageExtraFee {
	
	private int reservationCode;
	private int finalyPrice;
	private String surchargeTxt;
	private String resImgFileName;
	private String resSurType;
	private String resType;
	private String resEndDate;
	public PetsitterMypageExtraFee() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PetsitterMypageExtraFee(int reservationCode, int finalyPrice, String surchargeTxt, String resImgFileName,
			String resSurType, String resType, String resEndDate) {
		super();
		this.reservationCode = reservationCode;
		this.finalyPrice = finalyPrice;
		this.surchargeTxt = surchargeTxt;
		this.resImgFileName = resImgFileName;
		this.resSurType = resSurType;
		this.resType = resType;
		this.resEndDate = resEndDate;
	}
	public int getReservationCode() {
		return reservationCode;
	}
	public void setReservationCode(int reservationCode) {
		this.reservationCode = reservationCode;
	}
	public int getFinalyPrice() {
		return finalyPrice;
	}
	public void setFinalyPrice(int finalyPrice) {
		this.finalyPrice = finalyPrice;
	}
	public String getSurchargeTxt() {
		return surchargeTxt;
	}
	public void setSurchargeTxt(String surchargeTxt) {
		this.surchargeTxt = surchargeTxt;
	}
	public String getResImgFileName() {
		return resImgFileName;
	}
	public void setResImgFileName(String resImgFileName) {
		this.resImgFileName = resImgFileName;
	}
	public String getResSurType() {
		return resSurType;
	}
	public void setResSurType(String resSurType) {
		this.resSurType = resSurType;
	}
	public String getResType() {
		return resType;
	}
	public void setResType(String resType) {
		this.resType = resType;
	}
	public String getResEndDate() {
		return resEndDate;
	}
	public void setResEndDate(String resEndDate) {
		this.resEndDate = resEndDate;
	}
	@Override
	public String toString() {
		return "PetsitterMypageEextraFee [reservationCode=" + reservationCode + ", finalyPrice=" + finalyPrice
				+ ", surchargeTxt=" + surchargeTxt + ", resImgFileName=" + resImgFileName + ", resSurType=" + resSurType
				+ ", resType=" + resType + ", resEndDate=" + resEndDate + "]";
	}

	
}
