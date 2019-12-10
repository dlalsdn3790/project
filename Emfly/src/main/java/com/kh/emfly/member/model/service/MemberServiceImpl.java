package com.kh.emfly.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.kh.emfly.member.model.service.MemberService;
import com.kh.emfly.member.model.vo.Member;
import com.kh.emfly.member.model.dao.MemberDao;

@Service("ms")
public class MemberServiceImpl implements MemberService
{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao md;
	
	@Override
	public int insertMember(Member m)
	{
		return md.insertMember(sqlSession, m);
	}
	
	@Override
	public Member checkMember(String mId)
	{
		return md.checkMember(sqlSession, mId);
	}

}