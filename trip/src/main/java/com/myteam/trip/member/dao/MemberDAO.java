package com.myteam.trip.member.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myteam.trip.member.vo.MemberVO;




public interface MemberDAO {
	public int insertMember(MemberVO memberVO) throws DataAccessException;
	
	 public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
	 
	 public String kIdChk(String id) throws DataAccessException;
	//아이디 중복 체크
		String idChk(MemberVO vo) throws Exception;
		

	 
}
