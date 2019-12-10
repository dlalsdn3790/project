package com.kh.emfly.company.model.vo;

public class THire
{
   private String tHNo;
   private String tHCompany;
   
   public THire() {

   }

   public THire(String tHNo, String tHCompany) {
      super();
      this.tHNo = tHNo;
      this.tHCompany = tHCompany;
   }

   public String gettHNo() {
      return tHNo;
   }

   public void settHNo(String tHNo) {
      this.tHNo = tHNo;
   }

   public String gettHCompany() {
      return tHCompany;
   }

   public void settHCompany(String tHCompany) {
      this.tHCompany = tHCompany;
   }

   @Override
   public String toString() {
      return "Thire [tHNo=" + tHNo + ", tHCompany=" + tHCompany + "]";
   }
}