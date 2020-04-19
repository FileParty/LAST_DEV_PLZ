package com.petmily.admin.model.vo;

public class AdminQuestion {
	
	private int scNum;
	private String userId;
	private String emailTitle;
	private String sendEmail;
	private String queYN;
	private String emailDate;
	private String type;
	private String send;
	
	public AdminQuestion() {
		// TODO Auto-generated constructor stub
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getEmailTitle() {
		return emailTitle;
	}

	public void setEmailTitle(String emailTitle) {
		this.emailTitle = emailTitle;
	}

	public String getSendEmail() {
		return sendEmail;
	}

	public void setSendEmail(String sendEmail) {
		this.sendEmail = sendEmail;
	}

	public String getQueYN() {
		return queYN;
	}

	public void setQueYN(String queYN) {
		this.queYN = queYN;
	}

	public String getEmailDate() {
		return emailDate;
	}

	public void setEmailDate(String emailDate) {
		this.emailDate = emailDate;
	}
	
	

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSend() {
		return send;
	}

	public void setSend(String send) {
		this.send = send;
	}
	
	

	public int getScNum() {
		return scNum;
	}

	public void setScNum(int scNum) {
		this.scNum = scNum;
	}

	@Override
	public String toString() {
		return "AdminQuestion [scNum=" + scNum + ", userId=" + userId + ", emailTitle=" + emailTitle + ", sendEmail="
				+ sendEmail + ", queYN=" + queYN + ", emailDate=" + emailDate + ", type=" + type + ", send=" + send
				+ "]";
	}
	
	
	

}
