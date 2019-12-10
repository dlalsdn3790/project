package com.kh.emfly.member.model.vo;

import org.springframework.stereotype.Repository;

public class Member
{
	private String mId;
	private String mNickname;
	private String mName;
	private String mEmail;
	private String mGender;
	private String mAge;
	private String mBirthday;
	private String mImg;
	private String mRoute;
	private String mAccess;

	public Member() {

	}

	// naver 회원 정보
	public Member(String mId, String mNickname, String mName, String mEmail, String mGender, String mAge,
			String mBirthday, String mImg, String mRoute, String mAccess) {
		super();
		this.mId = mId;
		this.mNickname = mNickname;
		this.mName = mName;
		this.mEmail = mEmail;
		this.mGender = mGender;
		this.mAge = mAge;
		this.mBirthday = mBirthday;
		this.mImg = mImg;
		this.mRoute = mRoute;
		this.mAccess = mAccess;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmNickname() {
		return mNickname;
	}

	public void setmNickname(String mNickname) {
		this.mNickname = mNickname;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmGender() {
		return mGender;
	}

	public void setmGender(String mGender) {
		this.mGender = mGender;
	}

	public String getmAge() {
		return mAge;
	}

	public void setmAge(String mAge) {
		this.mAge = mAge;
	}

	public String getmBirthday() {
		return mBirthday;
	}

	public void setmBirthday(String mBirthday) {
		this.mBirthday = mBirthday;
	}

	public String getmImg() {
		return mImg;
	}

	public void setmImg(String mImg) {
		this.mImg = mImg;
	}

	public String getmRoute() {
		return mRoute;
	}

	public void setmRoute(String mRoute) {
		this.mRoute = mRoute;
	}

	public String getmAccess() {
		return mAccess;
	}

	public void setmAccess(String mAccess) {
		this.mAccess = mAccess;
	}

	@Override
	public String toString() {
		return "Member [mId=" + mId + ", mNickname=" + mNickname + ", mName=" + mName + ", mEmail=" + mEmail
				+ ", mGender=" + mGender + ", mAge=" + mAge + ", mBirthday=" + mBirthday + ", mImg=" + mImg
				+ ", mRoute=" + mRoute + ", mAccess=" + mAccess + "]";
	}
}