package com.myproject.manager.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myproject.admin.vo.CompanyVO;
import com.myproject.manager.service.CommutingService;
import com.myproject.member.vo.MemberVO;

@Controller
@RequestMapping(value = "/manager")
public class CommutingManagerController {
	private Logger logger = LoggerFactory.getLogger(CommutingManagerController.class);
	
	@Autowired
	private CommutingService commutingService;
	
	@GetMapping(value = "/commuting")
	public String commuting(Model model) {
		logger.info("/manager/commuting");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String userId = auth.getName();
		
		MemberVO memberVO = commutingService.selectMemberInfo(userId);
		String companyNm = memberVO.getCompanyNm();
		
		CompanyVO companyVO = commutingService.selectCompanyByNm(companyNm);

		model.addAttribute("userId", userId);
		model.addAttribute("companyNm", companyNm);
		model.addAttribute("companyVO", companyVO);
		
		return "manager/commuting";
	}
	
	
	@PostMapping(value = "/goToWork")
	public String goToWork(String companyNm, String userId, double lat, double lon) {
		logger.info("lat:{}",lat);
		logger.info("lon:{}",lon);
		logger.info("companyNm:{}",companyNm);
		return "redirect:/manager/commuting";
	}
}
