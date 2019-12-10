package com.kh.emfly.enter.model.service;

import java.util.List;

import com.kh.emfly.enter.model.vo.Enter;

public interface EnterService {

	public int enterInsert(Enter e);

	public List<Enter> EnterList() throws Exception;
	
	int updateMember(String eId);

	int updateEnter(String eId);
}
