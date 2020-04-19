package com.petmily.admin.model.vo;

public class ServiceData {
	
	private String scType;
	private String scQtext;
	private String scAtext;
	
	public ServiceData() {
		// TODO Auto-generated constructor stub
	}

	public String getScType() {
		return scType;
	}

	public void setScType(String scType) {
		this.scType = scType;
	}

	public String getScQtext() {
		return scQtext;
	}

	public void setScQtext(String scQtext) {
		this.scQtext = scQtext;
	}

	public String getScAtext() {
		return scAtext;
	}

	public void setScAtext(String scAtext) {
		this.scAtext = scAtext;
	}

	@Override
	public String toString() {
		return "ServiceData [scType=" + scType + ", scQtext=" + scQtext + ", scAtext=" + scAtext + "]";
	}
	
	

}
