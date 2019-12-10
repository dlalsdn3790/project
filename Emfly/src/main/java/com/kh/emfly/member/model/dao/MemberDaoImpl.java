package com.kh.emfly.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.emfly.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao
{
	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member m)
	{
		return sqlSession.insert("Member.insertMember", m);
	}

	@Override
	public Member checkMember(SqlSessionTemplate sqlSession, String mId)
	{
		return sqlSession.selectOne("Member.checkMember", mId);
	}

}