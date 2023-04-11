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
	//상품별 Q&A
	public List<QnaVO> getProductQnaList(Criteria criteria, int product_no){
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("product_no", product_no);
		return mybatis.selectList("QnaMapper.getProductQnaList", map);
	}
	// Q&A상세
	public QnaVO getQna(int qna_no){
		return mybatis.selectOne("QnaMapper.getQna", qna_no);
	}
	public int insertQna(QnaVO vo) {
		return mybatis.insert("QnaMapper.insertQna", vo);
	}
	public void updateQna(QnaVO vo) {
		mybatis.update("QnaMapper.updateQna", vo);
	}
	public void deleteQna(int qna_no) {
		mybatis.delete("QnaMapper.deleteQna", qna_no);
	}
}
