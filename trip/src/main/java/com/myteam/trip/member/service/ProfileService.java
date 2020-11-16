package com.myteam.trip.member.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myteam.trip.member.dao.ProfileDAO;
import com.myteam.trip.member.vo.ProfileVO;



@Service("profileService")
@Transactional(propagation = Propagation.REQUIRED)
public class ProfileService {
	@Autowired
	private ProfileDAO profileDAO;
	
	
	public void addNewProfile(ProfileVO vo) throws Exception{
		profileDAO.insertNewProfile(vo);
	}
}
