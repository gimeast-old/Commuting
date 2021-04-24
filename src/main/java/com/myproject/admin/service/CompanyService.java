package com.myproject.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.admin.mapper.CompanyMapper;
import com.myproject.admin.vo.CompanyVO;

@Service
public class CompanyService {
	@Autowired
	private CompanyMapper companyMapper;
	
	public void companyReg(CompanyVO companyVO) {
		try {
			companyMapper.companyReg(companyVO);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<CompanyVO> companySelectAll() {
		List<CompanyVO> list = companyMapper.companySelectAll();
		return list;
	}
}
