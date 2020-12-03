package com.myteam.alpaca.community.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myteam.alpaca.community.dao.CommunityDAO;
import com.myteam.alpaca.community.service.CommunityService;
import com.myteam.alpaca.community.vo.CommunityVO;
import com.myteam.alpaca.member.vo.MemberVO;



 
@Repository
@Controller("communityController")
public class CommunityController  {
	private static final String FILE_URL = null;
	@Autowired
	private CommunityService communityService;
	@Autowired
	private CommunityVO communityVO;
	@Autowired
	private CommunityDAO comunityDAO;
	
	
	@RequestMapping(value = "/community/listCommunity.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listCommunity(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List communityList = communityService.listCommunity();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("communityList", communityList);
		
		return mav;
	}
	
	// 글작성
	@RequestMapping(value = "/community/addNewCommunity.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewCommunity(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> communityMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			communityMap.put(name, value);
		}
		
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member"); 
		String id = memberVO.getId();
		communityMap.put("id", id);
		System.out.println("id : " + id);


		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			int c_no = communityService.addNewCommunity(communityMap);
						
			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/community/listCommunity.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {

			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');');";
			message += " location.href='" + multipartRequest.getContextPath() + "/community/communityForm.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	// 한개의 이미지 보여주기
	@RequestMapping(value = "/community/viewCommunity.do", method = RequestMethod.GET)
	public ModelAndView viewCommunity(@RequestParam("c_no") int c_no, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		communityVO = communityService.viewCommunity(c_no);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("community", communityVO);
		return mav;
		
		
	}
	
	
	// 한개의 이미지 수정 new
		@RequestMapping(value = "/community/modmodCommunity.do", method = RequestMethod.GET)
		public ModelAndView modmodCommunity(@RequestParam("c_no") int c_no, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			String viewName = (String) request.getAttribute("viewName");
			communityVO = communityService.viewCommunity(c_no);
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			mav.addObject("community", communityVO);
			return mav;
			
			
		}
		

	 //수정
	  @RequestMapping(value="/community/modCommunity.do" ,method = RequestMethod.POST)
	  @ResponseBody
	  public ResponseEntity modCommunity(MultipartHttpServletRequest multipartRequest,  
	    HttpServletResponse response) throws Exception{
	    multipartRequest.setCharacterEncoding("utf-8");
		Map<String,Object> communityMap = new HashMap<String, Object>();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			communityMap.put(name,value);
		}
		
		
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String id = memberVO.getId();
		communityMap.put("id", id);
		
		String c_no=(String)communityMap.get("c_no");
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	    try {
	       communityService.modCommunity(communityMap);
	       message = "<script>";
		   message += " alert('글을 수정했습니다.');";
		   message += " location.href='"+multipartRequest.getContextPath()+"/community/viewCommunity.do?c_no="+c_no+"';";
		   message +=" </script>";
	       resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	    }catch(Exception e) {
	      message = "<script>";
		  message += " alert('오류가 발생했습니다.다시 수정해주세요');";
		  message += " location.href='"+multipartRequest.getContextPath()+"/community/viewCommunity.do?c_no="+c_no+"';";
		  message +=" </script>";
	      resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	    }
	    return resEnt;
	  }

	@RequestMapping(value = "/community/removeCommunity.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeCommunity(@RequestParam("c_no") int c_no, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			communityService.removeCommunity(c_no);

			message = "<script>";
			message += " alert('글을 삭제했습니다.');";
			message += " location.href='" + request.getContextPath() + "/community/listCommunity.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다.다시 시도해 주세요.');";
			message += " location.href='" + request.getContextPath() + "/community/listCommunity"
					+ ".do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	@RequestMapping(value = "/community/*Form.do", method = RequestMethod.GET)
	private ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}


}