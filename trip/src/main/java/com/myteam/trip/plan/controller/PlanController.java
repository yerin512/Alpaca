package com.myteam.trip.plan.controller;

 

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

 

public class PlanController {

	@RequestMapping(value = "/location", method = RequestMethod.GET)

	public String location() {

	    return "/location";

	}

}