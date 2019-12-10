package com.kh.emfly.company.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.emfly.company.model.vo.Company;
import com.kh.emfly.company.model.vo.CompanyPage;
import com.kh.emfly.company.model.vo.Hire;
import com.kh.emfly.company.model.vo.THire;

@Repository("cDAO")
public class CompanyDaoImpl implements CompanyDao
{   
   @Autowired
   private SqlSessionTemplate sqlSession;

   @Override
   public List<Hire> listHire()
   {
      return sqlSession.selectList("Company.listHire");
   }

   public List<THire> listTHire()
   {
      return sqlSession.selectList("Company.listTHire");
   }

   @Override
   public String selecthMin(String hNo)
   {
      return sqlSession.selectOne("Company.selecthMin", hNo);
   }

   @Override
   public String selecthMax(String hNo)
   {
      return sqlSession.selectOne("Company.selecthMax", hNo);
   }

   @Override
   public int insertCompany(Company c)
   {
      return sqlSession.insert("Company.insertCompany", c);
   }

   @Override
   public List<Company> listCompany(CompanyPage pager,String searchWord,List<String> cDiv, List<String> cLocation, List<Integer> cSalary,int start, int end)
   {
	   
      Map<String, Object> m = new HashMap<String, Object>();
      m.put("pager", pager);
      m.put("searchWord",searchWord);
      m.put("cDiv", cDiv);
      m.put("cLocation", cLocation);
      m.put("cSalary", cSalary);
      m.put("start", start); 
      m.put("end", end);
     
      System.out.println(searchWord);
      System.out.println(cDiv);
      System.out.println(cLocation);
      System.out.println(cSalary);
      return sqlSession.selectList("Company.listCompany", m);
      
   }

   @Override
   public List<Company> CompanyList(String searchWord,int start,int end) throws Exception{
      Map<String,Object> map = new HashMap<String,Object>();
      map.put("searchWord",searchWord);
      map.put("start", start); 
      map.put("end", end);
      return sqlSession.selectList("Company.listAll",map);
   }

   public int getListCount(String searchWord) {
      // TODO Auto-generated method stub
      Map<String,String> map = new HashMap<String,String>();
      map.put("searchWord",searchWord);
      return sqlSession.selectOne("Company.getListCount",map);
   }

   public Company CompanyDetail(int cId) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne("Company.selectCompany",cId);
   }
}