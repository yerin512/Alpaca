package com.myteam.alpaca.member.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myteam.alpaca.member.service.KakaoAPI;
import com.myteam.alpaca.member.service.MemberService;

import com.myteam.alpaca.member.vo.MemberVO;




@Controller("memberController")
public class MemberControllerImpl implements MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private static final String ARTICLE_IMAGE_REPO = "C:\\member\\profile_image";
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;

	@Autowired
	private KakaoAPI kakao;

	@RequestMapping(value = "/")
	public String index() {

		return "index";
	}

	@RequestMapping(value = "index.do", method = RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	// 카카오 로그인
	@RequestMapping(value = "/login")
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

			memberVO.setId((String) userInfo.get("kakaoID"));
			memberVO.setName((String) userInfo.get("nickname"));
			session.setAttribute("member", memberVO); // 카카오 로긴값 세션에 묶어보기 시도
		}

		return "index";

	}

	// 카카오 로그아웃
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
//           kakao.kakaoLogout((String)session.getAttribute("access_Token")); 필요가 없네.... 걍 로그아웃 된다..
		session.removeAttribute("access_Token");
		session.removeAttribute("kakaoID");
		session.removeAttribute("isLogOn");
		session.removeAttribute("member");
		return "index";
	}


	@Override
	@RequestMapping(value = "member/addMember.do", method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");

		int result = 0;
		result = memberService.addMember(member);
		ModelAndView mav = new ModelAndView("redirect:/index.do");
		return mav;

	}

	// 회원가입 프로필 이미지 업로드
	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		String imageFileName = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		System.out.println("fileNames");
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			imageFileName = mFile.getOriginalFilename();
			File file = new File(ARTICLE_IMAGE_REPO + "\\" + fileName);
			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					if (file.getParentFile().mkdirs()) {
						file.createNewFile();
					}
				}
				mFile.transferTo(new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName));
			}
		}
		return imageFileName;
	}

	@RequestMapping(value = "signUp.do", method = RequestMethod.GET)
	private ModelAndView loginMain(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(member);
		if (memberVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", memberVO);
			session.setAttribute("isLogOn", true);
			String action = (String) session.getAttribute("action");
			session.removeAttribute("action");
			if (action != null) {
				mav.setViewName("redirect:" + action);
			} else {
				mav.setViewName("redirect:/index.do");
			}

		} else {
			rAttr.addFlashAttribute("result", "loginFailed");
			mav.setViewName("redirect:/index.do");
		}
		return mav;
	}

	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idChk.do", method = RequestMethod.POST)
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

	// 회원 정보 수정 get
	@RequestMapping(value = "/memberUpdateView", method = RequestMethod.GET)
	public String memberUpdateView() throws Exception {
		return "member/memberUpdateView";

	}

	// 회원 정보 수정 post
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String memberUpdate(MemberVO vo, HttpSession session) throws Exception {
		memberService.memberUpdate(vo);
		session.invalidate();
		return "redirect:/index.do";
	}

	// 회원 탈퇴 get
	@RequestMapping(value = "/memberDeleteView", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception {
		return "member/memberDeleteView";
	}

	// 회원 탈퇴 post
	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
	public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("member");
		String sessionPass = member.getPwd();
		String voPass = vo.getPwd();

		if (!(sessionPass.equals(voPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/memberDeleteView";
		}
		memberService.memberDelete(vo);
		session.invalidate();
		return "redirect:/index.do";
	}

	// 회원 탈퇴에 필요한 패스워드 체크
	@ResponseBody
	@RequestMapping(value = "/passChk", method = RequestMethod.POST)
	public int passChk(MemberVO vo) throws Exception {
		int result = memberService.passChk(vo);
		return result;
	}

}