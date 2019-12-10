package com.kh.emfly.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.emfly.member.model.vo.Member;

public interface MemberDao
{
	int insertMember(SqlSessionTemplate sqlSession, Member m);
	
	Member checkMember(SqlSessionTemplate sqlSession, String mId);

}