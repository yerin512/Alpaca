package com.myteam.trip.community.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myteam.trip.community.service.CommunityService;
import com.myteam.trip.community.vo.CommunityVO;

 

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
