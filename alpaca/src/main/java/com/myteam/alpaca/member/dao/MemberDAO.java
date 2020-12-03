package com.myteam.alpaca.member.dao;

import org.springframework.dao.DataAccessException;

import com.myteam.alpaca.member.vo.MemberVO;



public interface MemberDAO {
	public int insertMember(MemberVO memberVO) throws DataAccessException;

	public MemberVO loginById(MemberVO memberVO) throws DataAccessException;

	public String kIdChk(String id) throws DataAccessException;

	// 아이디 중복 체크
	public String idChk(MemberVO vo) throws Exception;

	// 회원정보 수정
	public void memberUpdate(MemberVO vo) throws Exception;

	// 회원 탈퇴
	public void memberDelete(MemberVO vo) throws Exception;

	// 회원 탈퇴에 쓰일 패스워드 체크
	public int passChk(MemberVO vo) throws Exception;

}
