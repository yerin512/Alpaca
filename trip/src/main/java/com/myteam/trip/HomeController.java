package com.myteam.trip;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	
	@RequestMapping(value = "/instructor.do", method = RequestMethod.GET)
	public String instructor(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
	
		return "instructor";
	}
	
	@RequestMapping(value = "/about.do", method = RequestMethod.GET)
	public String about(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
	
		return "about";
	}
	
	@RequestMapping(value = "/blog.do", method = RequestMethod.GET)
	public String blog(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
	
		return "blog";
	}
	
	@RequestMapping(value = "/course.do", method = RequestMethod.GET)
	public String course(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
	
		return "course";
	}
}
