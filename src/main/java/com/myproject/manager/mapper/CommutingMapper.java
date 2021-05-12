package com.myproject.manager.mapper;

import com.myproject.admin.vo.CompanyVO;
import com.myproject.member.vo.MemberVO;

public interface CommutingMapper {
	public MemberVO selectMemberInfo(String userId);
	public CompanyVO selectCompanyByNm(String companyNm);
	
}
