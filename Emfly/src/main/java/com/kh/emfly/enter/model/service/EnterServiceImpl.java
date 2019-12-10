package com.kh.emfly.enter.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.emfly.enter.model.dao.EnterDao;
import com.kh.emfly.enter.model.vo.Enter;
import com.kh.emfly.resume.model.dao.ResumeDao;
import com.kh.emfly.resume.model.vo.Resume;

@Service("eService")
public class EnterServiceImpl implements  EnterService{
	@Autowired
	private EnterDao eDAO;

	
	@Override
	public int enterInsert(Enter e) {
		// TODO Auto-generated method stub
		return eDAO.enterInsert(e);
	}


	@Override
	public List<Enter> EnterList() throws Exception {
		return eDAO.enterList();
	}
	
	@Override
	public int updateMember(String eId) {
		return eDAO.updateMember(eId);
		
	}


	@Override
	public int updateEnter(String eId) {
		return eDAO.updateEnter(eId);
	}
}

