package com.kh.emfly.company.model.vo;

public class Company implements java.io.Serializable
{
   private static final long serialVersionUID = 5680567698821447684L;

   private int cId;
   private String cName;
   private String cDiv;
   private String cLocation;
   private String cSector;
   private int cSalary;
   private String cInfo;
   private int cPerson;
   private int cSales;
   private int cCapital;
   private String cLeader;
   private String cUrl;

   public Company() {

   }

   public Company(int cId, String cName, String cDiv, String cLocation, String cSector, int cSalary, String cInfo,
         int cPerson, int cSales, int cCapital, String cLeader, String cUrl) {
      super();
      this.cId = cId;
      this.cName = cName;
      this.cDiv = cDiv;
      this.cLocation = cLocation;
      this.cSector = cSector;
      this.cSalary = cSalary;
      this.cInfo = cInfo;
      this.cPerson = cPerson;
      this.cSales = cSales;
      this.cCapital = cCapital;
      this.cLeader = cLeader;
      this.cUrl = cUrl;
   }

   public int getcId() {
      return cId;
   }

   public void setcId(int cId) {
      this.cId = cId;
   }

   public String getcName() {
      return cName;
   }

   public void setcName(String cName) {
      this.cName = cName;
   }

   public String getcDiv() {
      return cDiv;
   }

   public void setcDiv(String cDiv) {
      this.cDiv = cDiv;
   }

   public String getcLocation() {
      return cLocation;
   }

   public void setcLocation(String cLocation) {
      this.cLocation = cLocation;
   }

   public String getcSector() {
      return cSector;
   }

   public void setcSector(String cSector) {
      this.cSector = cSector;
   }

   public int getcSalary() {
      return cSalary;
   }

   public void setcSalary(int cSalary) {
      this.cSalary = cSalary;
   }

   public String getcInfo() {
      return cInfo;
   }

   public void setcInfo(String cInfo) {
      this.cInfo = cInfo;
   }

   public int getcPerson() {
      return cPerson;
   }

   public void setcPerson(int cPerson) {
      this.cPerson = cPerson;
   }

   public int getcSales() {
      return cSales;
   }

   public void setcSales(int cSales) {
      this.cSales = cSales;
   }

   public int getcCapital() {
      return cCapital;
   }

   public void setcCapital(int cCapital) {
      this.cCapital = cCapital;
   }

   public String getcLeader() {
      return cLeader;
   }

   public void setcLeader(String cLeader) {
      this.cLeader = cLeader;
   }

   public String getcUrl() {
      return cUrl;
   }

   public void setcUrl(String cUrl) {
      this.cUrl = cUrl;
   }

   public static long getSerialversionuid() {
      return serialVersionUID;
   }

   @Override
   public String toString() {
      return "Company [cId=" + cId + ", cName=" + cName + ", cDiv=" + cDiv + ", cLocation=" + cLocation + ", cSector="
            + cSector + ", cSalary=" + cSalary + ", cInfo=" + cInfo + ", cPerson=" + cPerson + ", cSales=" + cSales
            + ", cCapital=" + cCapital + ", cLeader=" + cLeader + ", cUrl=" + cUrl + "]";
   }
}