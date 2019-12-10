package com.kh.emfly.resume.model.vo;

import java.sql.Date;

public class Resume implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4708137620061801551L;
	
	private int reId; // 이력서번호
	private String rName; //이름
	private String reBirth; //생일
	private String reGender; //성별
	private String reEmail; // 이메일
	private String rePhone; //핸드폰번호
	private String reAddress; //주소
//	private String originName;
//	private String changeName;
	private String reSchool; // 학교구분
	private String reScname; // 학교명
	private String reSdate; // 입학년월
	private String reEdate; // 졸업년월
	private String reGraduate; // 졸업
	private String reMajor; // 전공
	private String reGpoint; //학점
	private String reTpoint; //총점
	private String reComName; // 회사명
	private String reDivName; // 부서명
	private String reRank; // 직급
	private String reYear; // 근속년수
	private String reWorkInfo; // 담당업무
	private String reEmploy; // 고용형태
	private String reEmDiv; // 직종구분
	private String reLocation; // 희망근무지역
	private String reSalary; // 희망연봉
	private String reStatus; // 공개여부
	private String reDate; 
	
	public Resume() {
		
	}

	
	
	
	
	public Resume(int reId, String rName, String reBirth, String reGender, String reEmail, String rePhone,
			String reAddress, String reSchool, String reScname, String reSdate, String reEdate, String reGraduate,
			String reMajor, String reGpoint, String reTpoint, String reComName, String reDivName, String reRank,
			String reYear, String reWorkInfo, String reEmploy, String reEmDiv, String reLocation, String reSalary,
			String reStatus, String reDate) {
		super();
		this.reId = reId;
		this.rName = rName;
		this.reBirth = reBirth;
		this.reGender = reGender;
		this.reEmail = reEmail;
		this.rePhone = rePhone;
		this.reAddress = reAddress;
		this.reSchool = reSchool;
		this.reScname = reScname;
		this.reSdate = reSdate;
		this.reEdate = reEdate;
		this.reGraduate = reGraduate;
		this.reMajor = reMajor;
		this.reGpoint = reGpoint;
		this.reTpoint = reTpoint;
		this.reComName = reComName;
		this.reDivName = reDivName;
		this.reRank = reRank;
		this.reYear = reYear;
		this.reWorkInfo = reWorkInfo;
		this.reEmploy = reEmploy;
		this.reEmDiv = reEmDiv;
		this.reLocation = reLocation;
		this.reSalary = reSalary;
		this.reStatus = reStatus;
		this.reDate = reDate;
	}





	public int getReId() {
		return reId;
	}





	public void setReId(int reId) {
		this.reId = reId;
	}





	public String getrName() {
		return rName;
	}





	public void setrName(String rName) {
		this.rName = rName;
	}





	public String getReBirth() {
		return reBirth;
	}





	public void setReBirth(String reBirth) {
		this.reBirth = reBirth;
	}





	public String getReGender() {
		return reGender;
	}





	public void setReGender(String reGender) {
		this.reGender = reGender;
	}





	public String getReEmail() {
		return reEmail;
	}





	public void setReEmail(String reEmail) {
		this.reEmail = reEmail;
	}





	public String getRePhone() {
		return rePhone;
	}





	public void setRePhone(String rePhone) {
		this.rePhone = rePhone;
	}





	public String getReAddress() {
		return reAddress;
	}





	public void setReAddress(String reAddress) {
		this.reAddress = reAddress;
	}





	public String getReSchool() {
		return reSchool;
	}





	public void setReSchool(String reSchool) {
		this.reSchool = reSchool;
	}





	public String getReScname() {
		return reScname;
	}





	public void setReScname(String reScname) {
		this.reScname = reScname;
	}





	public String getReSdate() {
		return reSdate;
	}





	public void setReSdate(String reSdate) {
		this.reSdate = reSdate;
	}





	public String getReEdate() {
		return reEdate;
	}





	public void setReEdate(String reEdate) {
		this.reEdate = reEdate;
	}





	public String getReGraduate() {
		return reGraduate;
	}





	public void setReGraduate(String reGraduate) {
		this.reGraduate = reGraduate;
	}





	public String getReMajor() {
		return reMajor;
	}





	public void setReMajor(String reMajor) {
		this.reMajor = reMajor;
	}





	public String getReGpoint() {
		return reGpoint;
	}





	public void setReGpoint(String reGpoint) {
		this.reGpoint = reGpoint;
	}





	public String getReTpoint() {
		return reTpoint;
	}





	public void setReTpoint(String reTpoint) {
		this.reTpoint = reTpoint;
	}





	public String getReComName() {
		return reComName;
	}





	public void setReComName(String reComName) {
		this.reComName = reComName;
	}





	public String getReDivName() {
		return reDivName;
	}





	public void setReDivName(String reDivName) {
		this.reDivName = reDivName;
	}





	public String getReRank() {
		return reRank;
	}





	public void setReRank(String reRank) {
		this.reRank = reRank;
	}





	public String getReYear() {
		return reYear;
	}





	public void setReYear(String reYear) {
		this.reYear = reYear;
	}





	public String getReWorkInfo() {
		return reWorkInfo;
	}





	public void setReWorkInfo(String reWorkInfo) {
		this.reWorkInfo = reWorkInfo;
	}





	public String getReEmploy() {
		return reEmploy;
	}





	public void setReEmploy(String reEmploy) {
		this.reEmploy = reEmploy;
	}





	public String getReEmDiv() {
		return reEmDiv;
	}





	public void setReEmDiv(String reEmDiv) {
		this.reEmDiv = reEmDiv;
	}





	public String getReLocation() {
		return reLocation;
	}





	public void setReLocation(String reLocation) {
		this.reLocation = reLocation;
	}





	public String getReSalary() {
		return reSalary;
	}





	public void setReSalary(String reSalary) {
		this.reSalary = reSalary;
	}





	public String getReStatus() {
		return reStatus;
	}





	public void setReStatus(String reStatus) {
		this.reStatus = reStatus;
	}





	public String getReDate() {
		return reDate;
	}





	public void setReDate(String reDate) {
		this.reDate = reDate;
	}





	@Override
	public String toString() {
		return "Resume [reId=" + reId + ", rName=" + rName + ", reBirth=" + reBirth + ", reGender=" + reGender
				+ ", reEmail=" + reEmail + ", rePhone=" + rePhone + ", reAddress=" + reAddress + ", reSchool="
				+ reSchool + ", reScname=" + reScname + ", reSdate=" + reSdate + ", reEdate=" + reEdate
				+ ", reGraduate=" + reGraduate + ", reMajor=" + reMajor + ", reGpoint=" + reGpoint + ", reTpoint="
				+ reTpoint + ", reComName=" + reComName + ", reDivName=" + reDivName + ", reRank=" + reRank
				+ ", reYear=" + reYear + ", reWorkInfo=" + reWorkInfo + ", reEmploy=" + reEmploy + ", reEmDiv="
				+ reEmDiv + ", reLocation=" + reLocation + ", reSalary=" + reSalary + ", reStatus=" + reStatus
				+ ", reDate=" + reDate + "]";
	}
	

	
	

	
	

	
	
	

	



	



	

	

	

	
	
}