package com.myproject.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.member.mapper.MemberMapper;
import com.myproject.member.vo.MemberVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	public int duplicateCheck(String user_id) {
		int count = memberMapper.duplicateCheck(user_id);
		return count;
	}
	
	public void memberJoin(MemberVO memberVO) {
		try {
			memberMapper.memberJoin(memberVO);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public MemberVO loginOk(MemberVO memberVO) {
		MemberVO returnVO = memberMapper.loginOk(memberVO);
		return returnVO;
	}
}
