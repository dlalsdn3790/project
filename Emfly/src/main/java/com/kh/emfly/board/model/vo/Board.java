package com.kh.emfly.board.model.vo;

import java.sql.Date;

public class Board {
   private int bId;
   private String bTitle;
   private String bContent;
   private String mId;
   private String mNickname;
   private int bCount;
   private Date createDate;
   private Date modifyDate;
   
   
   public Board() {
      super();
   }

   

   public Board(String bTitle, String bContent, String mId, String mNickname) {
      super();
      this.bTitle = bTitle;
      this.bContent = bContent;
      this.mId = mId;
      this.mNickname = mNickname;
   }



   public Board(int bId, String bTitle, String bContent, String mId, String mNickname) {
      super();
      this.bId = bId;
      this.bTitle = bTitle;
      this.bContent = bContent;
      this.mId = mId;
      this.mNickname = mNickname;
   }



   public Board(int bId, String bTitle, String bContent, String mId, String mNickname, int bCount, Date createDate,
         Date modifyDate) {
      super();
      this.bId = bId;
      this.bTitle = bTitle;
      this.bContent = bContent;
      this.mId = mId;
      this.mNickname = mNickname;
      this.bCount = bCount;
      this.createDate = createDate;
      this.modifyDate = modifyDate;
   }


   public int getbId() {
      return bId;
   }


   public void setbId(int bId) {
      this.bId = bId;
   }


   public String getbTitle() {
      return bTitle;
   }


   public void setbTitle(String bTitle) {
      this.bTitle = bTitle;
   }


   public String getbContent() {
      return bContent;
   }


   public void setbContent(String bContent) {
      this.bContent = bContent;
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


   public int getbCount() {
      return bCount;
   }


   public void setbCount(int bCount) {
      this.bCount = bCount;
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
      return "Board [bId=" + bId + ", bTitle=" + bTitle + ", bContent=" + bContent + ", mId=" + mId + ", mNickname="
            + mNickname + ", bCount=" + bCount + ", createDate=" + createDate + ", modifyDate=" + modifyDate + "]";
   }
}

