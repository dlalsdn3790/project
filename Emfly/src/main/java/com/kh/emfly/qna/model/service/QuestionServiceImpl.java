package com.kh.emfly.qna.model.service;

import java.util.List;

import javax.activation.CommandMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.emfly.qna.model.dao.QuestionDao;
import com.kh.emfly.qna.model.vo.Answer;
import com.kh.emfly.qna.model.vo.Question;


@Service("qService")
public class QuestionServiceImpl implements QuestionService{

	@Autowired
	private QuestionDao qDAO;
	
	
	@Override
	public List<Question> QuestionList() throws Exception {
		return qDAO.QuestionList();
	}


	@Override
	public int questionInsert(Answer a) {
		return qDAO.questionInsert(a);
	}


	@Override
	public List<Question> qnaList(String mEmail) throws Exception {
		return qDAO.qnaList(mEmail);
	}



}
