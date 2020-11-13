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
	
	 @Autowired
	    private KakaoAPI kakao;
	    
	    @RequestMapping(value="/")
	    public String index() {
	        
	        return "index";
	    }
	    
	    @RequestMapping(value="/login")
	    public String login(@RequestParam("code") String code, HttpSession session) {
	        String access_Token = kakao.getAccessToken(code);
	        HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
	        System.out.println("login Controller : " + userInfo);
	        
	        //    클占쏙옙占싱억옙트占쏙옙 占싱몌옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙 占쏙옙占실울옙 占쌔댐옙 占싱몌옙占싹곤옙 占쏙옙큰 占쏙옙占�
	        if (userInfo.get("account_email") != null) {
	            session.setAttribute("userId", userInfo.get("email"));
	            session.setAttribute("access_Token", access_Token);
	        }
	        
	        
	        return "index";
	    }

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
}
