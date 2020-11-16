package com.myteam.trip.themaTour.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/themaTourView.do", method = RequestMethod.GET )
public class ThemaTourController {
	
	@RequestMapping(value="/themaTour.do")
	public void themaTourList(){
		
	}
	
//	@RequestMapping(value="/themaTourView.do")
//	public void themaTourView(@RequestParam("ename") String ename){
//		
//	}
}