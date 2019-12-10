package com.kh.emfly.qna.model.service;

import java.util.List;

import javax.activation.CommandMap;

import com.kh.emfly.qna.model.vo.Answer;
import com.kh.emfly.qna.model.vo.Question;


public interface QuestionService {

	public List<Question> QuestionList() throws Exception;

	
	int questionInsert(Answer a);


	public List<Question> qnaList(String mId) throws Exception;
}
