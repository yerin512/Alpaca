package com.myteam.trip.community.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myteam.trip.community.service.CommunityService;
import com.myteam.trip.community.vo.CommunityVO;
import com.myteam.trip.community.vo.PageMaker;
import com.myteam.trip.community.vo.SearchCriteria;

@Controller
@RequestMapping("/community/*")
public class SearchCommunityController {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchCommunityController.class);
	
	@Inject
	private CommunityService service;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void listPage(@ModelAttribute("pvo") SearchCriteria pvo, Model model)throws Exception {
		System.out.println("list pvo: " + pvo);
		
		model.addAttribute("list", service.listSearch(pvo));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPvo(pvo);
		
		pageMaker.setTotalCount(service.listSearchCount(pvo));
		System.out.println("ctrl" + service.listSearch(pvo));
		model.addAttribute("pageMaker", pageMaker);
	}
	
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerGet()throws Exception {
		logger.info("register get.................");
	}
	
	
	
}
	

