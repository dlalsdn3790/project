package com.kh.emfly.resume.model.service;

import java.util.List;

import com.kh.emfly.resume.model.vo.Resume;

public interface ResumeService {

	int resumeInsert(Resume r);

	public List<Resume> ResumeList(List<String> reYear,List<String> reGender,List<String> reBirth,List<String> reSchool,List<String> reLocation,List<String> reEmdiv,List<String> reEmploy,List<String> reSalary) throws Exception;
	

	int getListCount() throws Exception;

	Resume ResumeDetail(int reId);
	
}
