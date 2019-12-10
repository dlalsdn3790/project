package com.kh.emfly.member.model.service;

import com.kh.emfly.member.model.vo.Member;

public interface MemberService
{
	int insertMember(Member m);
	
	Member checkMember(String mId);

}