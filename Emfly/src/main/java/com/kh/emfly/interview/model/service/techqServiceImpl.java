package com.kh.emfly.interview.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.emfly.interview.model.dao.techqDAO;
import com.kh.emfly.qna.model.vo.Question;
@Service("ts")
public class techqServiceImpl implements techqService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired techqDAO td;
	
	@Override
	public List<Question> techQList() {
		
		return td.techQList(sqlSession);
	}

}
