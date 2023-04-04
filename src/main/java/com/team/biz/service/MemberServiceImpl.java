package com.team.biz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.biz.dao.MemberDAO;
import com.team.biz.dto.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDao;
	
	@Override
	public MemberVO getMember(String id) {
		return memberDao.getMember(id);
	}

	@Override
	public int confirmID(String userid) {
		return memberDao.confirmID(userid);
	}

	@Override
	public int loginID(MemberVO vo) {
		return memberDao.loginID(vo);
	}

	@Override
	public void insertMember(MemberVO memberVO) {
		memberDao.insertMember(memberVO);
		
	}

	@Override
	public String selectIdByNameEmail(MemberVO vo) {
		return memberDao.selectIdByNameEmail(vo);
	}

	@Override
	public String selectPwdByIdNameEmail(MemberVO vo) {
		return null;
	}

	@Override
	public String getPwdByNameEmail(String name) {
			return memberDao.getPwdByNameEmail(name);
	}
}
