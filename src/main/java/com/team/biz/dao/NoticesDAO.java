package com.team.biz.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.biz.dto.NoticesVO;

import utils.Criteria;

@Repository
public class NoticesDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<NoticesVO> noticesList(){
		
		return mybatis.selectList("NoticesMapper.noticesList");
	}
	
	public int countnoticesList(String title) {
		
		return mybatis.selectOne("NoticesMapper.countnoticesList", title);
	}	
	
	public List<NoticesVO> listNoticesWithPaging(Criteria criteria, String title) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("title", title);
		
		return mybatis.selectList("NoticesMapper.listNoticesWithPaging", map);
	}	
	
	public NoticesVO getNotices(int notices_no) {
		
		return mybatis.selectOne("NoticesMapper.getNotices", notices_no);
	}
	
	public void insertNotices(NoticesVO vo) {
		
		mybatis.insert("NoticesMapper.insertNotices", vo);
	}
	
	public void IncreaseHits(int notices_no) {
		
		mybatis.update("NoticesMapper.IncreaseHits", notices_no);	
	}
	
	public void updateNotices(NoticesVO vo) {
		
		mybatis.update("NoticesMapper.updateNotices", vo);	
	}
	
	public void deleteNotices(int notices_no) {
		
		mybatis.delete("NoticesMapper.deleteNotices", notices_no);
	}
}
