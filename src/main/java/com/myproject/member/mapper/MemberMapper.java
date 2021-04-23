package com.myproject.member.mapper;

import com.myproject.member.vo.MemberVO;

public interface MemberMapper {
	public int duplicateCheck(String user_id); // 회원가입시 아이디 중복체크
	public void memberJoin(MemberVO memberVO); // 회원가입
	public MemberVO loginOk(MemberVO memberVO); // 로그인
}
