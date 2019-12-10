package com.kh.emfly.interview.model.vo;

public class techQ implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 16928173787570408L;
	
	private int tQid;
	private String tQuestion;
	
	public techQ() {
		
	}
	
	

	public techQ(int tQid, String tQuestion) {
		super();
		this.tQid = tQid;
		this.tQuestion = tQuestion;
	}



	public int gettQid() {
		return tQid;
	}

	public void settQid(int tQid) {
		this.tQid = tQid;
	}

	public String gettQuestion() {
		return tQuestion;
	}

	public void settQuestion(String tQuestion) {
		this.tQuestion = tQuestion;
	}



	@Override
	public String toString() {
		return "techQ [tQid=" + tQid + ", tQuestion=" + tQuestion + "]";
	}
	
	
}
