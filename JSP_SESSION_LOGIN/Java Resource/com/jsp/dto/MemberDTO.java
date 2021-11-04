package com.jsp.dto;

public class MemberDTO {
	private String ID;
	private String PW;
	
	public MemberDTO() {
		
	}
	
	public MemberDTO(String ID,String PW) {
		this.ID=ID;
		this.PW=PW;
	}
	
	public void setID(String ID) {
		this.ID=ID;
	}
	public String getId() {
		return ID;
	}
	public void setPW(String ID) {
		this.ID=ID;
	}
	public String getPw() {
		return PW;
	}
}
