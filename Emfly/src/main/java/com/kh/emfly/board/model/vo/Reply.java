package com.kh.emfly.board.model.vo;

import java.sql.Date;

public class Reply {
   private int rId;
   private int bId;
   private String rContent;
   private String mId;
   private String mNickname;
   private Date createDate;
   private Date modifyDate;
   
   public Reply() {
      super();
      // TODO Auto-generated constructor stub
   }
   
   
   
   public Reply(int bId, String rContent, String mId, String mNickname) {
      super();
      this.bId = bId;
      this.rContent = rContent;
      this.mId = mId;
      this.mNickname = mNickname;
   }



   public Reply(int rId, int bId, String rContent, String mId, String mNickname, Date createDate, Date modifyDate) {
      super();
      this.rId = rId;
      this.bId = bId;
      this.rContent = rContent;
      this.mId = mId;
      this.mNickname = mNickname;
      this.createDate = createDate;
      this.modifyDate = modifyDate;
   }
   
   


   public int getrId() {
      return rId;
   }



   public void setrId(int rId) {
      this.rId = rId;
   }



   public int getbId() {
      return bId;
   }



   public void setbId(int bId) {
      this.bId = bId;
   }



   public String getrContent() {
      return rContent;
   }



   public void setrContent(String rContent) {
      this.rContent = rContent;
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



   public Date getCreateDate() {
      return createDate;
   }



   public void setCreateDate(Date createDate) {
      this.createDate = createDate;
   }



   public Date getModifyDate() {
      return modifyDate;
   }



   public void setModifyDate(Date modifyDate) {
      this.modifyDate = modifyDate;
   }



   @Override
   public String toString() {
      return "Reply [rId=" + rId + ", bId=" + bId + ", rContent=" + rContent + ", mId=" + mId + ", mNickname="
            + mNickname + ", createDate=" + createDate + ", modifyDate=" + modifyDate + "]";
   }

}

