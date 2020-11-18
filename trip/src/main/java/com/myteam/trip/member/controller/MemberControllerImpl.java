package com.myteam.trip.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myteam.trip.member.service.KakaoAPI;
import com.myteam.trip.member.service.MemberService;
import com.myteam.trip.member.service.ProfileService;
import com.myteam.trip.member.vo.MemberVO;
import com.myteam.trip.member.vo.ProfileVO;


@Controller("memberController")
//@EnableAspectJAutoProxy
public class MemberControllerImpl   implements MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO ;
	@Autowired
	private ProfileVO profileVO;
	@Autowired ProfileService profileService;
	 
	 @Autowired
	    private KakaoAPI kakao;
	    
	    @RequestMapping(value="/")
	    public String index() {
	        
	        return "index";
	    }
	    
		@RequestMapping(value = {"index.do"}, method = RequestMethod.GET)
		private ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
			String viewName = (String)request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			return mav;
		}
	    
	    
	    //카카오 로그인
	    @RequestMapping(value="/login")
	    public String login(@RequestParam("code") String code, HttpSession session) {
	        String access_Token = kakao.getAccessToken(code);
	        HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
	        System.out.println("login Controller : " + userInfo);
	        
	      
	        if (userInfo.get("kakaoID") != null) {
	        	session.setAttribute("kakaoID", userInfo.get("kakaoID"));
	            session.setAttribute("nickname", userInfo.get("nickname"));
	            session.setAttribute("profileImage", userInfo.get("profileImage"));
	            
	            session.setAttribute("access_Token", access_Token);
	            session.setAttribute("isLogOn", true);

	            memberVO.setId((String)userInfo.get("kakaoID"));
	            session.setAttribute("member", memberVO);   //카카오 로긴값 세션에 묶어보기 시도
	        }
	        
	        
	        return "index";
	    }
	    //카카오 로그아웃
	    @RequestMapping(value="/logout")
	    public String logout(HttpSession session) {
//	        kakao.kakaoLogout((String)session.getAttribute("access_Token")); 필요가 없네.... 걍 로그아웃 된다..
	        session.removeAttribute("access_Token");
	        session.removeAttribute("kakaoID");
	        session.removeAttribute("isLogOn");
	        return "index";
	    }
	
		@RequestMapping(value="/kakao/viewProfile.do" ,method = RequestMethod.GET)
		public ModelAndView viewArticle(@RequestParam("userId") int id,
	                                    HttpServletRequest request, HttpServletResponse response) throws Exception{
			String viewName = (String)request.getAttribute("viewName");
	//		id=profileService.view(id);
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			mav.addObject("profile", profileVO);
			return mav;
		}	
	
	

	
	@Override
	@RequestMapping(value="/member/addMember.do" ,method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		int result = 0;
		result = memberService.addMember(member);
		ModelAndView mav = new ModelAndView("redirect:/signupsuccess.do");
		return mav;
	}
	
	@RequestMapping(value="signUp.do" ,method = RequestMethod.GET)
	private ModelAndView loginMain(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	
	@Override
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
				              RedirectAttributes rAttr,
		                       HttpServletRequest request, HttpServletResponse response) throws Exception {
	ModelAndView mav = new ModelAndView();
	memberVO = memberService.login(member);
	if(memberVO != null) {
	    HttpSession session = request.getSession();
	    session.setAttribute("member", memberVO);
	    session.setAttribute("isLogOn", true);
	    //mav.setViewName("redirect:/member/listMembers.do");
	    String action = (String)session.getAttribute("action");
	    session.removeAttribute("action");
	    if(action!= null) {
	       mav.setViewName("redirect:"+action);
	    }else {
	       mav.setViewName("redirect:/index.do");	
	    }

	}else {
	   rAttr.addFlashAttribute("result","loginFailed");
	   mav.setViewName("redirect:/index.do");
	}
	return mav;
	}

	//아이디 중복 체크
		@ResponseBody
		@RequestMapping(value="/idChk.do" ,method = RequestMethod.POST)
		public String idChk(MemberVO vo) throws Exception {
			String result = memberService.idChk(vo);
			return result;
		}

	

	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String viewName = uri.substring(begin, end);
		if (viewName.indexOf(".") != -1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if (viewName.lastIndexOf("/") != -1) {
			viewName = viewName.substring(viewName.lastIndexOf("/", 1), viewName.length());
		}
		return viewName;
	}


}
