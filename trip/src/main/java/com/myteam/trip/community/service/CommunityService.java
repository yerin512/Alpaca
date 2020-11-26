package com.myteam.trip.community.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.myteam.trip.community.dao.CommunityDAO;
import com.myteam.trip.community.vo.CommunityVO;
import com.myteam.trip.community.vo.SearchCriteria;

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

	/*ckEditor*/
	public void ckeditorImageUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile upload) {
		// TODO Auto-generated method stub
		
	}
	/*조회수
	public void updateViewcnt(int c_no) throws Exception {
		communityDAO.updateViewcnt(c_no);
	}
	*/
	public List<CommunityVO> listSearch(SearchCriteria pvo) throws Exception {
		return communityDAO.listSearch(pvo);
	}
	public int listSearchCount(SearchCriteria pvo) throws Exception {
		return communityDAO.listSearchCount(pvo);
	}
	
	

	
}
