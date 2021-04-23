package com.myproject.commuting;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		boolean isAuth = auth.isAuthenticated(); // 로그인여부확인
		String userId = auth.getName();
		logger.info("userId:{}",userId);
		
		model.addAttribute("isAuth",isAuth);
		model.addAttribute("userId",userId);
		return "home";
	}
	
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String errorPage() {
		return "errorPage";
	}
}
