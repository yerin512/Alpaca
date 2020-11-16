package com.myteam.trip.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository("profileDAO")
public class ProfileDAO {
	@Autowired
	private SqlSession sqlSession;
}
