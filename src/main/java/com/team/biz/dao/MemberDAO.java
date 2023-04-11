package com.team.biz.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.biz.dto.MemberVO;

import utils.Criteria;

@Repository("memberDAO")
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//회원 상세정보 조회
	public MemberVO getMember(String id) {
		return mybatis.selectOne("MemberMapper.getMember",id);
	}
	
	//회원 id 존재여부 확인
	public int confirmID(String userid) {
		String pwd=mybatis.selectOne("MemberMapper.confirmID",userid);
		if(pwd!=null) return 1;
		else return 0;
	}
	public int joinconfirmNickname(String nickname) {
		String id=mybatis.selectOne("MemberMapper.joinconfirmNickname",nickname);
		if(id!=null) return 1;
		else return 0;
	}
	
	public int modifyconfirmNickname(MemberVO vo) {
		String id=mybatis.selectOne("MemberMapper.modifyconfirmNickname", vo);
		if(id!=null) return 1;
		else return 0;
	}
	
	public int confirmMail(String email) {
		String id=mybatis.selectOne("MemberMapper.confirmMail", email);
		if(id!=null) return 1;
		else return 0;
	}
	
	
	
	//admin 확인
	public int adminCheck(String id) {
		String admin=mybatis.selectOne("MemberMapper.adminCheck", id);
		if(admin!=null) return 2;
		else return 0;
	}
	
	//회원 로그인 확인
	public int loginID(MemberVO vo) {
		int result=-1;
		String pwd=mybatis.selectOne("MemberMapper.confirmID", vo);
		String admin=mybatis.selectOne("MemberMapper.adminCheck", vo);
		if(pwd==null) {
			result=-1;
		}else if(admin.equals("admin")&&pwd.equals(vo.getPwd())) {
			result=2;
		}else if(pwd.equals(vo.getPwd())) {
			result=1;
		}else {
			result=0;
		}
		return result;
	}
	
	//회원가입
	public void insertMember(MemberVO memberVO) {
			mybatis.insert("MemberMapper.insertMember", memberVO);
	}

	//이름과 이메일로 아이디 찾기
	public String selectIdByNameEmail(MemberVO vo) {
		return mybatis.selectOne("MemberMapper.selectIdByNameEmail", vo);
	}

	// 아이디, 이름, 이메일로 비밀번호 찾기 
	public String selectPwdByIdNameEmail(MemberVO vo) {
		return mybatis.selectOne("MemberMapper.selectPwdByIdNameEmail", vo);
	}

	// 비밀번호 메일로 보내기
	public String getPwdByNameEmail(String name) {
	    return mybatis.selectOne("MemberMapper.getPwdByNameEmail",name);
	}
	
	public void modifyMember(MemberVO vo) {
		  mybatis.update("MemberMapper.modifyMember",vo);
	}
	
	// 회원 등급 업데이트
	public void gradeUpdate(MemberVO vo) {
		
		mybatis.update("MemberMapper.gradeUpdate",vo);
	}
	
	public List<String> sumPriceById(int sum_price){
		
		return mybatis.selectList("MemberMapper.sumPriceById", sum_price);
	}

	
	public List<MemberVO> listMember(String name){
		
		return mybatis.selectList("MemberMapper.listMember",name);
	}
	
	public List<MemberVO> listMemberWithPaging(Criteria criteria, String name) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("name", name);
		
		return mybatis.selectList("MemberMapper.listMemberWithPaging", map);
	}
	
	public int countmemberlist(String name) {
		return mybatis.selectOne("MemberMapper.countmemberlist", name);
	}
}
