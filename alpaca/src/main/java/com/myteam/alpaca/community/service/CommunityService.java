package com.myteam.alpaca.community.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myteam.alpaca.community.dao.CommunityDAO;
import com.myteam.alpaca.community.vo.CommunityVO;



@Service("communityService")
@Transactional(propagation = Propagation.REQUIRED)
public class CommunityService{
	@Autowired
	private CommunityDAO communityDAO;
	
	public List<CommunityVO> listCommunity() throws Exception{
		List<CommunityVO> communityList =  communityDAO.selectAllCommunityList();
        return communityList;
	}
	 
	public int addNewCommunity(Map communityMap) throws Exception{
		return communityDAO.insertNewCommunity(communityMap);
	}
	
	 
	public CommunityVO viewCommunity(int c_no) throws Exception {
		CommunityVO communityVO = communityDAO.selectCommunity(c_no);
		return communityVO;
	}
	
	
	public void modCommunity(Map communityMap) throws Exception {
		communityDAO.updateCommunity(communityMap);
	}
	
	 
	public void removeCommunity(int c_no) throws Exception {
		communityDAO.deleteCommunity(c_no);
	}

	
}
