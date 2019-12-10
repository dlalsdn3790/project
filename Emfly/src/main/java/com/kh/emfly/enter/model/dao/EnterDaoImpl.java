package com.kh.emfly.enter.model.dao;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.kh.emfly.enter.model.vo.Enter;

@Repository
public class EnterDaoImpl implements EnterDao{

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	@Override
	public int enterInsert(Enter e){
		return sqlSession.insert("EnterMapper.enterInsert",e);
	}


	@Override
	public List<Enter> enterList() {
		Map<String,Object> map = new HashMap<String,Object>();
		return sqlSession.selectList("EnterMapper.listAll");
	}

	@Override
	public int updateMember(String eId) {
		return sqlSession.update("Member.updateMember", eId);
	}


	@Override
	public int updateEnter(String eId) {
		return sqlSession.update("EnterMapper.updateEnter", eId);
	}
}
