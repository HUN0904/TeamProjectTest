package com.team.biz.service;

import java.util.List;

import com.team.biz.dto.MemberVO;

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
	String selectIdByNameEmail(MemberVO vo);
	
	//비밀번호 : 이름 아이디 이메일 
	String selectPwdByIdNameEmail(MemberVO vo);
	
	//이메일 보내기
	String getPwdByNameEmail(String name);
	
	//가입 닉네임 중복체크
	int joinconfirmNickname(String nickname);
	
	//수정 닉네임 중복체크
	int modifyconfirmNickname(MemberVO vo);
	
	//메일 중복체크
	public int confirmMail(String email);
	//회원정보수정
	void modifyMember(MemberVO vo);
	
	//회원등급업
	void gradeUpdate(MemberVO vo);
	
	//회원등급업 대상 아이디 추출
	List<String> sumPriceById(int sum_price);
	
	//어드민 리스트
	public List<MemberVO> listMember(String name);
	
	public List<MemberVO> listMemberWithPaging(Criteria criteria, String name);
	
	public int countmemberlist(String name);
}