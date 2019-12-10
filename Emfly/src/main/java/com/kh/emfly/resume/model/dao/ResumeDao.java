package com.kh.emfly.resume.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.emfly.resume.model.vo.Resume;

@Repository("rDAO") 
public interface ResumeDao {

	public int resumeInsert(Resume r);

	public List<Resume> ResumeList(List<String> reYear,List<String> reGender,List<String> reBirth,List<String> reSchool,List<String> reLocation,List<String> reEmdiv,List<String> reEmploy,List<String> reSalary);

	public int getListCount();

	public Resume resumeDetail(int reId);

}
