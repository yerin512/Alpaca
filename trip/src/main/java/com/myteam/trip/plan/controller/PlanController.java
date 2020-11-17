package com.myteam.trip.plan.controller;

<<<<<<< HEAD
 

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

 

public class PlanController {

	@RequestMapping(value = "/location", method = RequestMethod.GET)

	public String location() {

	    return "/location";

	}

=======
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/planMake.do", method = RequestMethod.GET)
public class PlanController {
	
	@RequestMapping(value="/plan.do")
	public void planList(){
		
	}
>>>>>>> origin/master
}