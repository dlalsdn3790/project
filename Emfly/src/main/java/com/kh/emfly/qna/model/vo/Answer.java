package com.kh.emfly.qna.model.vo;

import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository
public class Answer implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6265626107763911874L;
	
	private int aId;
	private String question1;
	private String answer1;
	private String question2;
	private String answer2;
	private String question3;
	private String answer3;
	private Date addDate;
	private String writerId;
	
	public Answer() {
		
	}

	public Answer(int aId, String question1, String answer1, String question2, String answer2, String question3,
			String answer3, Date addDate, String writerId) {
		super();
		this.aId = aId;
		this.question1 = question1;
		this.answer1 = answer1;
		this.question2 = question2;
		this.answer2 = answer2;
		this.question3 = question3;
		this.answer3 = answer3;
		this.addDate = addDate;
		this.writerId = writerId;
	}
	
	public int getaId() {
		return aId;
	}

	public void setaId(int aId) {
		this.aId = aId;
	}

	public String getQuestion1() {
		return question1;
	}

	public void setQuestion1(String question1) {
		this.question1 = question1;
	}

	public String getAnswer1() {
		return answer1;
	}

	public void setAnswer1(String answer1) {
		this.answer1 = answer1;
	}

	public String getQuestion2() {
		return question2;
	}

	public void setQuestion2(String question2) {
		this.question2 = question2;
	}

	public String getAnswer2() {
		return answer2;
	}

	public void setAnswer2(String answer2) {
		this.answer2 = answer2;
	}

	public String getQuestion3() {
		return question3;
	}

	public void setQuestion3(String question3) {
		this.question3 = question3;
	}

	public String getAnswer3() {
		return answer3;
	}

	public void setAnswer3(String answer3) {
		this.answer3 = answer3;
	}

	public Date getAddDate() {
		return addDate;
	}

	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	@Override
	public String toString() {
		return "Answer [aId=" + aId + ", question1=" + question1 + ", answer1=" + answer1 + ", question2=" + question2
				+ ", answer2=" + answer2 + ", question3=" + question3 + ", answer3=" + answer3 + ", addDate=" + addDate
				+ ", writerId=" + writerId + "]";
	}
	
	

	
	
	

	
	
	
	
	
}
