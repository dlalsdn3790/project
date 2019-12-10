package com.kh.emfly.resume.model.dao;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.emfly.resume.model.vo.Resume;

@Repository
public class ResumeDaoImpl implements ResumeDao{

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	@Override
	public int resumeInsert(Resume r){
		return sqlSession.insert("ResumeMapper.resumeInsert",r);
	}


	@Override
	public List<Resume> ResumeList(List<String> reYear,List<String> reGender,List<String> reBirth,List<String> reSchool,List<String> reLocation,List<String> reEmdiv,List<String> reEmploy,List<String> reSalary) {
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("reYear", reYear);
		m.put("reGender", reGender);
		m.put("reBirth", reBirth);
		m.put("reSchool", reSchool);
		m.put("reLocation", reLocation);
		m.put("reEmdiv", reEmdiv);
		m.put("reEmploy", reEmploy);
		m.put("reSalary", reSalary);
		System.out.println("reYear : " + reYear);
		System.out.println("reGender : " + reGender);
		System.out.println("reBirth : " + reBirth);
		System.out.println("reSchool : " + reSchool);
		System.out.println("reLocation : " + reLocation);
		System.out.println("reEmdiv : " + reEmdiv);
		System.out.println("reEmploy : " + reEmploy);
		System.out.println("reSalary : " + reSalary);
		return sqlSession.selectList("ResumeMapper.listResume",m);
		
	}
	

	@Override
	public int getListCount() {
		return sqlSession.selectOne("ResumeMapper.getListCount");
	}


	@Override
	public Resume resumeDetail(int reId) {
		return sqlSession.selectOne("ResumeMapper.selectResume",reId);
	}
	
	
	
}
