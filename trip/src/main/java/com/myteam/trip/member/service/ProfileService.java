package com.myteam.trip.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myteam.trip.member.dao.ProfileDAO;



@Service("profileService")
@Transactional(propagation = Propagation.REQUIRED)
public class ProfileService {
	@Autowired
	private ProfileDAO profileDAO;
	
	
//	public int addNewArticle(Map articleMap) throws Exception{
//		return boardDAO.insertNewArticle(articleMap);
//	}
}
