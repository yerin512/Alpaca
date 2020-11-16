package com.myteam.trip.member.dao;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myteam.trip.member.vo.ProfileVO;
@Repository("profileDAO")
public class ProfileDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public void insertNewProfile(ProfileVO vo) throws DataAccessException{
		sqlSession.insert("mapper.profile.insertNewProfile", vo);

	}
}
