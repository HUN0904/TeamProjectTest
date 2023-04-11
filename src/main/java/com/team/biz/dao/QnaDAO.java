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
	
	public void insertQna(QnaVO vo) {
		mybatis.insert("QnaMapper.insertQna",vo);
	}
	
	public List<QnaVO> listQna(QnaVO vo) {
		
	return mybatis.selectList("QnaMapper.listQna",vo);
	}
	
}
