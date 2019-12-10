package com.kh.emfly.interview.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.emfly.qna.model.vo.Question;

@Repository("tDAO")
public class techqDAO {

	public List<Question> techQList(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("techQ.randomlist");
	}

}
