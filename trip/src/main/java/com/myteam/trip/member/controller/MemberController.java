package com.myteam.trip.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myteam.trip.member.vo.MemberVO;




public interface MemberController {
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member,
            HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
            RedirectAttributes rAttr,
             HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//아이디 중복 체크
	public ResponseEntity overlapped(@RequestParam("id") String id,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
}