package com.myteam.trip.community.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myteam.trip.community.vo.CommunityVO;
import com.myteam.trip.community.vo.SearchCriteria;



@Repository("communityDAO")
public class CommunityDAO{
	@Autowired
	private SqlSession sqlSession;

	 
	public List selectAllCommunityList() throws DataAccessException {
		List<CommunityVO> communityList = sqlSession.selectList("mapper.community.selectAllCommunityList");
		return communityList;
	}

	
	 
	public int insertNewCommunity(Map communityMap) throws DataAccessException {
		int c_no = selectNewC_no();
		communityMap.put("c_no", c_no);
		sqlSession.insert("mapper.community.insertNewCommunity",communityMap);
		return c_no;
	}
    
	
	 
	public CommunityVO selectCommunity(int c_no) throws DataAccessException {
		return sqlSession.selectOne("mapper.community.selectCommunity", c_no);
	}

	 
	public void updateCommunity(Map communityMap) throws DataAccessException {
		sqlSession.update("mapper.community.updateCommunity", communityMap);
	}

	 
	public void deleteCommunity(int c_no) throws DataAccessException {
		sqlSession.delete("mapper.community.deleteCommunity", c_no);
		
	}
	
	private int selectNewC_no() throws DataAccessException {
		return sqlSession.selectOne("mapper.community.selectNewC_no");
	}
	
	private int selectNewImageFileNO() throws DataAccessException {
		return sqlSession.selectOne("mapper.community.selectNewImageFileNO");
	}
	
	/*페이징*/
	/* 조회수
	public void updateViewcnt(int c_no) throws Exception {
		sqlSession.update("mapper.community.updateViewcnt", c_no);
		
	}
	*/
	public List<CommunityVO> listPage(int page) throws Exception {
		
		if(page <= 0) {
			page = 1;
		}
		
		page = (page -1) * 10;
		
		return sqlSession.selectList("mapper.community.listPage",page);
		
	}
	
	
	public List<CommunityVO> listSearch(SearchCriteria pvo) throws Exception {
		return sqlSession.selectList("mapper.community.listSearch", pvo);
	}
	
	public int listSearchCount(SearchCriteria pvo) throws Exception {
		return sqlSession.selectOne("mapper.community.listSearchCount", pvo);
	}
	
	

}
