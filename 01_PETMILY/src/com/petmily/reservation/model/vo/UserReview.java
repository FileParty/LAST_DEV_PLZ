package com.petmily.reservation.model.vo;

public class UserReview {

	private int userNo;
	private String userId;
	private String PetSitterId;
	private String reviewText;
	private int reviewStar;
	private String reviewDate;
	private String reviewType;
	private String reviewBling;
	private String reviewSendText;
	
	public UserReview() {
		// TODO Auto-generated constructor stub
	}

	protected UserReview(int userNo, String userId, String petSitterId, String reviewText, int reviewStar,
			String reviewDate, String reviewType, String reviewBling, String reviewSendText) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		PetSitterId = petSitterId;
		this.reviewText = reviewText;
		this.reviewStar = reviewStar;
		this.reviewDate = reviewDate;
		this.reviewType = reviewType;
		this.reviewBling = reviewBling;
		this.reviewSendText = reviewSendText;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPetSitterId() {
		return PetSitterId;
	}

	public void setPetSitterId(String petSitterId) {
		PetSitterId = petSitterId;
	}

	public String getReviewText() {
		return reviewText;
	}

	public void setReviewText(String reviewText) {
		this.reviewText = reviewText;
	}

	public int getReviewStar() {
		return reviewStar;
	}

	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}

	public String getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getReviewType() {
		return reviewType;
	}

	public void setReviewType(String reviewType) {
		this.reviewType = reviewType;
	}

	public String getReviewBling() {
		return reviewBling;
	}

	public void setReviewBling(String reviewBling) {
		this.reviewBling = reviewBling;
	}

	public String getReviewSendText() {
		return reviewSendText;
	}

	public void setReviewSendText(String reviewSendText) {
		this.reviewSendText = reviewSendText;
	}

	@Override
	public String toString() {
		return "UserReview [userNo=" + userNo + ", userId=" + userId + ", PetSitterId=" + PetSitterId + ", reviewText="
				+ reviewText + ", reviewStar=" + reviewStar + ", reviewDate=" + reviewDate + ", reviewType="
				+ reviewType + ", reviewBling=" + reviewBling + ", reviewSendText=" + reviewSendText + "]";
	}
	
}
