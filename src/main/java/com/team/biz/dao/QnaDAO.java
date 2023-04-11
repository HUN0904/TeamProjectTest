package com.team.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.biz.dto.QnaVO;

@Repository
public class QnaDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<QnaVO> qnaList(){
		return mybatis.selectList("QnaMapper.qnaList");
	}
	
	public List<QnaVO> getProductQna(int product_no){
		return mybatis.selectList("QnaMapper.getProductQna",product_no);
	}
	
	public void insertQna(QnaVO vo) {
		mybatis.insert("QnaMapper.insertQna", vo);
	}
}
