package com.kh.emfly.qna.model.dao;

import java.util.List;

import javax.activation.CommandMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.emfly.qna.model.vo.Answer;
import com.kh.emfly.qna.model.vo.Question;

@Repository
public class QuestionDaoImpl implements QuestionDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Question> QuestionList() throws Exception {
		return sqlSession.selectList("Question.listAll");
	}


	@Override
	public int questionInsert(Answer a) {
		return sqlSession.insert("Answer.questionInsert",a);
	}


	@Override
	public List<Question> qnaList(String mEmail) throws Exception {
		return sqlSession.selectList("Answer.listAll",mEmail);
	}




}
