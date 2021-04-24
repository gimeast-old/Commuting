package com.myproject.admin.mapper;

import java.util.List;

import com.myproject.admin.vo.CompanyVO;

public interface CompanyMapper {
	
	public void companyReg(CompanyVO companyVO); // 회사 등록
	public List<CompanyVO> companySelectAll();
	
}
