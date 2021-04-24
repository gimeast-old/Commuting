package com.myproject.manager.mapper;

import com.myproject.member.vo.MemberVO;

public interface CommutingMapper {
	public MemberVO selectMemberInfo(String userId);
}
