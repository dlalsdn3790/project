package com.kh.emfly.enter.model.vo;

public class Enter implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -815686595772463931L;
	
	private String eId;
	private String eAccess;
	private String eName;
	private String originName;
	private String changeName;
	
	public Enter() {
		
	}

	public Enter(String eId, String eAccess, String eName, String originName, String changeName) {
		super();
		this.eId = eId;
		this.eAccess = eAccess;
		this.eName = eName;
		this.originName = originName;
		this.changeName = changeName;
	}




	public String geteId() {
		return eId;
	}

	public void seteId(String eId) {
		this.eId = eId;
	}

	public String geteAccess() {
		return eAccess;
	}

	public void seteAccess(String eAccess) {
		this.eAccess = eAccess;
	}

	public String geteName() {
		return eName;
	}

	public void seteName(String eName) {
		this.eName = eName;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	@Override
	public String toString() {
		return "Enter [eId=" + eId + ", eAccess=" + eAccess + ", eName=" + eName + ", originName=" + originName
				+ ", changeName=" + changeName + "]";
	}
	

	
	
	
	
}
