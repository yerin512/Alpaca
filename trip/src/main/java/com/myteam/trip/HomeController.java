package com.myteam.trip;

import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
//	@RequestMapping(value = { "/","/index.do"}, method = RequestMethod.GET)
//	public String index(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//	
//	
//		return "index";
//	}
	


	    
	    
	    

	@RequestMapping(value = "/themaTour.do", method = RequestMethod.GET)
	public String instructor(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
	
		return "themaTour";
	}
	
	@RequestMapping(value = "/plan.do", method = RequestMethod.GET)
	public String about(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
	
		return "plan";
	}
	
	@RequestMapping(value = "/myPage.do", method = RequestMethod.GET)
	public String blog(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
	
		return "myPage";
	}
	
	@RequestMapping(value = "/with.do", method = RequestMethod.GET)
	public String course(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
	
		return "with";
	}
	
	@RequestMapping(value = "/insertBoard.do", method = RequestMethod.GET)
	public String insertBoard(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
	
		return "insertBoard";
	}
	
	@RequestMapping(value = "/signupsuccess.do", method = RequestMethod.GET)
	public String sucseccsignup(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
	
		return "signupsuccess";
	}
}
