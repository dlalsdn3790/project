package com.kh.emfly.company.model.service;

import java.util.List;

import com.kh.emfly.company.model.vo.Company;
import com.kh.emfly.company.model.vo.CompanyPage;
import com.kh.emfly.company.model.vo.Hire;
import com.kh.emfly.company.model.vo.THire;

public interface CompanyService
{
   public List<Hire> listHire();
   
   public List<THire> listTHire();
   
   public String selecthMin(String hNo);
   
   public String selecthMax(String hNo);
   
   public int insertCompany(Company c);
   

   // 기업 리스트
   public List<Company> CompanyList(String searchWord, int start, int end) throws Exception;

   // 페이징
   int getListCount(String searchWord) throws Exception;

   // 기업 상세 페이지
   public Company CompanyDetail(int cId) throws Exception;

   public List<Company> listCompany(CompanyPage pager,String searchWord, List<String> cDiv, List<String> cLocation, List<Integer> cSalary,int start, int end);


}