package com.team.biz.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.biz.dto.QnaVO;

import utils.Criteria;

@Repository
public class QnaDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int countQna() {
		return mybatis.selectOne("QnaMapper.countQna");
	}
	public int countProductQna(int product_no) {
		return mybatis.selectOne("QnaMapper.countProductQna", product_no);
	}
	public List<QnaVO> qnaList(Criteria criteria, String title){
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("title", title);
		return mybatis.selectList("QnaMapper.qnaList", map);
	}
	
	public List<QnaVO> getProductQna(Criteria criteria, int product_no){
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("product_no", product_no);
		return mybatis.selectList("QnaMapper.getProductQna", map);
	}
	
	public int insertQna(QnaVO vo) {
		return mybatis.insert("QnaMapper.insertQna", vo);
	}
}
