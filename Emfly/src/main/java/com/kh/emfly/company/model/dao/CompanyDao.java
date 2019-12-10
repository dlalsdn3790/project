package com.kh.emfly.company.model.dao;

import java.util.List;

import com.kh.emfly.company.model.vo.Company;
import com.kh.emfly.company.model.vo.CompanyPage;
import com.kh.emfly.company.model.vo.Hire;
import com.kh.emfly.company.model.vo.THire;

public interface CompanyDao
{
   public List<Hire> listHire();
   
   public List<THire> listTHire();
   
   public String selecthMin(String hNo);
   
   public String selecthMax(String hNo);
   
   public int insertCompany(Company c);
   
   public List<Company> listCompany(CompanyPage pager,String searchWord,List<String> cDiv,List<String> cLocation,List<Integer> cSalary,int start, int end);
   
   public List<Company> CompanyList(String searchWord,int start,int end) throws Exception;

   public int getListCount(String searchWord) throws Exception;

   public Company CompanyDetail(int cId) throws Exception;
}