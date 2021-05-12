package com.myproject.manager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.admin.vo.CompanyVO;
import com.myproject.manager.mapper.CommutingMapper;
import com.myproject.member.vo.MemberVO;

@Service
public class CommutingService {
	@Autowired
	private CommutingMapper commutingMapper;
	
	public MemberVO selectMemberInfo(String userId) {
		MemberVO vo = commutingMapper.selectMemberInfo(userId);
		return vo;
	}
	
	public CompanyVO selectCompanyByNm(String companyNm) {
		CompanyVO vo = commutingMapper.selectCompanyByNm(companyNm);
		return vo;
	}
	
}
