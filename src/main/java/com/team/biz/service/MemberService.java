package com.team.biz.service;

import com.team.biz.dto.MemberVO;

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
}