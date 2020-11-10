package com.myteam.trip.member.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myteam.trip.member.vo.MemberVO;




public interface MemberDAO {
	public int insertMember(MemberVO memberVO) throws DataAccessException;

}
