package com.myteam.trip.community.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myteam.trip.community.service.CommunityService;
import com.myteam.trip.community.vo.CommunityVO;
import com.myteam.trip.member.vo.MemberVO;

 
@Repository
@Controller("communityController")
public class CommunityController{
	private static final String CURR_IMAGE_REPO_PATH = "C:\\community\\article_image";
	@Autowired 
	private CommunityService commnuityService;
	@Autowired 
	private CommunityVO communityVO;
	

	@RequestMapping(value = "/community/listCommunity.do",
										method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listCommunity(HttpServletRequest request,
										HttpServletResponse response) throws Exception{
		
			String viewName = (String)request.getAttribute("viewName");
			//List communityList = CommunityService.listCommunity();
			ModelAndView mav = new ModelAndView(viewName);
			//mav.addObject("communityList", communityList);
			return mav; 
	}

	// 한 개 이미지 글쓰기
	@RequestMapping(value = "/community/communityForm.do", method = RequestMethod.POST)
	public ResponseEntity communityForm(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> communityMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			communityMap.put(name, value);
		}

		List<String> imageFileName = upload(multipartRequest); 
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member"); 
		String id = memberVO.getId();
		communityMap.put("id", id);
		communityMap.put("imageFileName", imageFileName);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int c_no = communityService.addNewCommunity(communityMap);
			if (imageFileName != null) {
				for (int i = 0; i < imageFileName.size(); i++) {
					File srcFile = new File(COMMUNITY_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName.get(i));
					File destDir = new File(COMMUNITY_IMAGE_REPO + "\\" + c_no);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}

			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/listArticles.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(COMMUNITY_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
			srcFile.delete();

			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');');";
			message += " location.href='" + multipartRequest.getContextPath() + "/community/communityForm.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}	
	
	

	private List<String> upload(MultipartHttpServletRequest multipartRequest) {
		// TODO Auto-generated method stub
		return null;
	}

	public ResponseEntity addNewCommunity(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public ModelAndView viewCommunity(int c_no, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public ResponseEntity removeCommunity(int c_no, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	
	
}
