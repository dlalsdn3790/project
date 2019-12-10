package com.kh.emfly.qna.model.vo;

import org.springframework.stereotype.Repository;

@Repository 
public class Question implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4152977159598519320L;

	
	private int qId;
	private String qName;
	private String qAnswer;
	
	public Question() {
		
	}
	
	public Question(int qId, String qName, String qAnswer) {
		super();
		this.qId = qId;
		this.qName = qName;
		this.qAnswer = qAnswer;
	}

	public int getqId() {
		return qId;
	}

	public void setqId(int qId) {
		this.qId = qId;
	}

	public String getqName() {
		return qName;
	}

	public void setqName(String qName) {
		this.qName = qName;
	}

	public String getqAnswer() {
		return qAnswer;
	}

	public void setqAnswer(String qAnswer) {
		this.qAnswer = qAnswer;
	}


	@Override
	public String toString() {
		return "Question [qId=" + qId + ", qName=" + qName + ", qAnswer=" + qAnswer + "]";
	}
	
	
}
