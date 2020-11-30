package com.myteam.trip.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myteam.trip.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertMember(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.member.insertMember", memberVO);
		return result;
	}

	@Override
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException {
		MemberVO vo = sqlSession.selectOne("mapper.member.loginById", memberVO);
		return vo;
	}

	@Override
	public String kIdChk(String id) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.member.kIdChk", id);
		return result;
	}

	// 아이디 중복 체크
	@Override
	public String idChk(MemberVO vo) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.member.idChk", vo);
		return result;
	}

	// 회원정보 수정
	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		sqlSession.update("mapper.member.memberUpdate", vo);
	}

	// 회원 탈퇴
	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		sqlSession.delete("mapper.member.memberDelete", vo);

	}

	// 회원 탈퇴에 쓰일 패스워드 체크
	@Override
	public int passChk(MemberVO vo) throws Exception {
		int result = sqlSession.selectOne("mapper.member.passChk", vo);
		return result;
	}

}
