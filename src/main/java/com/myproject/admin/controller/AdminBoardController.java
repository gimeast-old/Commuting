package com.myproject.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myproject.admin.service.CompanyService;
import com.myproject.admin.vo.CompanyVO;

@Controller
@RequestMapping(value = "/admin")
public class AdminBoardController {
	private Logger logger = LoggerFactory.getLogger(AdminBoardController.class);

	@Autowired
	private CompanyService companyService;
	
	@GetMapping(value = "/board")
	public String adminBoard(Model model) {
		List<CompanyVO> list = companyService.companySelectAll();
		if(list != null) {
			model.addAttribute("list",list);
		}
		return "admin/board";
	}
	
	@PostMapping(value = "/companyReg")
	public String companyReg(CompanyVO companyVO) {
		logger.info("/admin/companyReg");
		
		companyService.companyReg(companyVO);
		
		return "redirect:/admin/board";
	}
	
}
