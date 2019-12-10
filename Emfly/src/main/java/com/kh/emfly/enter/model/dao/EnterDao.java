package com.kh.emfly.enter.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.emfly.enter.model.vo.Enter;

@Repository("eDAO") 
public interface EnterDao {

	public int enterInsert(Enter e);

	public List<Enter> enterList();

	int updateMember(String eId);

	int updateEnter(String eId);
}
