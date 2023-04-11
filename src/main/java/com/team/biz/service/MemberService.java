package com.team.biz.service;

import java.util.List;

import com.team.biz.dto.MemberVO;
import com.team.biz.dto.ProductVO;

import utils.Criteria;

public interface MemberService {
	
	// 회원 상세정보 조회
	MemberVO getMember(String id);

	// 회원ID 존재 여부 확인 
	int confirmID(String userid);
	
	// 회원 인증
	public int loginID(MemberVO vo);

	//회원가입
	void insertMember(MemberVO memberVO);
	
	// 아이디 :이름,이메일
	public String selectIdByNameEmail(MemberVO vo);
	
	//비밀번호 : 이름 아이디 이메일 
	public String selectPwdByIdNameEmail(MemberVO vo);
	
	//이메일 보내기
	public String getPwdByNameEmail(String name);
	
	//닉네임 중복체크
	public int joinconfirmnickname(String nickname);
	
	//닉네임 중복체크2
	public int modifyconfirmNickname(MemberVO vo);
	
	//회원정보수정
	public void modifyMember(MemberVO vo);
	
	//어드민 리스트
	public List<MemberVO> listMember(String name);
	
	public List<ProductVO> listMemberWithPaging(Criteria criteria, String name);
	
	public int countmemberlist(String name);
}