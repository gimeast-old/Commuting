package com.myproject.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myproject.member.service.MemberService;
import com.myproject.member.vo.MemberVO;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@GetMapping(value = "/join")
	public String join() {
		logger.info("/member/join");
		
		return "member/join";
	}
	
	@PostMapping(value = "/joinSubmit")
	public String joinSubmit(MemberVO memberVO) {
		logger.info("/member/joinSubmit");
		
		String user_pw = bcryptPasswordEncoder.encode(memberVO.getUserPw());
		memberVO.setUserPw(user_pw);
		memberService.memberJoin(memberVO);
		return "redirect:/";
		
	}
	
	@ResponseBody
	@PostMapping(value = "/duplicateCheck")
	public int duplicateCheck(String userId) {
		logger.info("/member/duplicateCheck");
		int result = memberService.duplicateCheck(userId);
		return result;
	}
	
	@GetMapping(value = "/login")
	public String login(Model model) {
		logger.info("/member/login");
		return "member/login";
	}
	
	@GetMapping(value = "/logout")
	public String loout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
	return "redirect:/";
	}


}
