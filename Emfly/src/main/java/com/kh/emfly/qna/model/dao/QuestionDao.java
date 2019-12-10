package com.kh.emfly.qna.model.dao;

import java.util.List;

import javax.activation.CommandMap;

import org.springframework.stereotype.Repository;

import com.kh.emfly.qna.model.vo.Answer;
import com.kh.emfly.qna.model.vo.Question;

@Repository("qDAO")
public interface QuestionDao {

	public List<Question> QuestionList() throws Exception;

	public int questionInsert(Answer a);

	public List<Question> qnaList(String mEmail) throws Exception;

}
