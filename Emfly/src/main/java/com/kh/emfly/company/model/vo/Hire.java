package com.kh.emfly.company.model.vo;

public class Hire
{
   private String hNo;
   private String hCompany;
   private int hMin;
   private int hMax;
   private String hStartdate;
   private String hEnddate;
   private String hUrl;
   private int hJobcode;
   
   public Hire() {

   }

   public Hire(String hNo, String hCompany, int hMin, int hMax, String hStartdate, String hEnddate, String hUrl,
         int hJobcode) {
      super();
      this.hNo = hNo;
      this.hCompany = hCompany;
      this.hMin = hMin;
      this.hMax = hMax;
      this.hStartdate = hStartdate;
      this.hEnddate = hEnddate;
      this.hUrl = hUrl;
      this.hJobcode = hJobcode;
   }

   public String gethNo() {
      return hNo;
   }

   public void sethNo(String hNo) {
      this.hNo = hNo;
   }

   public String gethCompany() {
      return hCompany;
   }

   public void sethCompany(String hCompany) {
      this.hCompany = hCompany;
   }

   public int gethMin() {
      return hMin;
   }

   public void sethMin(int hMin) {
      this.hMin = hMin;
   }

   public int gethMax() {
      return hMax;
   }

   public void sethMax(int hMax) {
      this.hMax = hMax;
   }

   public String gethStartdate() {
      return hStartdate;
   }

   public void sethStartdate(String hStartdate) {
      this.hStartdate = hStartdate;
   }

   public String gethEnddate() {
      return hEnddate;
   }

   public void sethEnddate(String hEnddate) {
      this.hEnddate = hEnddate;
   }

   public String gethUrl() {
      return hUrl;
   }

   public void sethUrl(String hUrl) {
      this.hUrl = hUrl;
   }

   public int gethJobcode() {
      return hJobcode;
   }

   public void sethJobcode(int hJobcode) {
      this.hJobcode = hJobcode;
   }

   @Override
   public String toString() {
      return "Hire [hNo=" + hNo + ", hCompany=" + hCompany + ", hMin=" + hMin + ", hMax=" + hMax + ", hStartdate="
            + hStartdate + ", hEnddate=" + hEnddate + ", hUrl=" + hUrl + ", hJobcode=" + hJobcode + "]";
   }
}