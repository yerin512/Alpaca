package com.myteam.trip.community.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myteam.trip.community.dao.CommunityDAO;
import com.myteam.trip.community.vo.CommunityVO;

@Service("communityService")
@Transactional(propagation = Propagation.REQUIRED)
public class CommunityService{
	@Autowired
	CommunityDAO communityDAO;
	
	public List<CommunityVO> listCommunitys() throws Exception{
		List<CommunityVO> communitysList =  communityDAO.selectAllCommunitysList();
        return communitysList;
	}

	
	
	 
	public int addNewCommunity(Map communityMap) throws Exception{
		return communityDAO.insertNewCommunity(communityMap);
	}
	
	
	
	 
	public CommunityVO viewCommunity(int communityNO) throws Exception {
		CommunityVO communityVO = communityDAO.selectCommunity(communityNO);
		return communityVO;
	}
	
	
	 
	public void modCommunity(Map communityMap) throws Exception {
		communityDAO.updateCommunity(communityMap);
	}
	
	 
	public void removeCommunity(int communityNO) throws Exception {
		communityDAO.deleteCommunity(communityNO);
	}
	

	
}
