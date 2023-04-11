package com.team.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.biz.dao.MemberDAO;
import com.team.biz.dto.MemberVO;
import com.team.biz.dto.ProductVO;

import utils.Criteria;

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

	@Override
	public int modifyconfirmNickname(MemberVO vo) {
		
		return memberDao.modifyconfirmNickname(vo);
	}

	@Override
	public void modifyMember(MemberVO vo) {
		memberDao.modifyMember(vo);
	}

	@Override
	public int joinconfirmnickname(String nickname) {
		return memberDao.joinconfirmnickname(nickname);
	}

	@Override
	public List<MemberVO> listMember(String name) {
		return memberDao.listMember(name);
	}

	@Override
	public List<ProductVO> listMemberWithPaging(Criteria criteria, String name) {
	
		return memberDao.listMemberWithPaging(criteria, name);
	}

	@Override
	public int countmemberlist(String name) {
	
		return memberDao.countmemberlist(name);
	}




	
	
}
