package com.myteam.trip.member.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myteam.trip.member.vo.MemberVO;



public interface MemberService {
	
	public int addMember(MemberVO member) throws DataAccessException;
	
	 public MemberVO login(MemberVO memberVO) throws Exception;
}
