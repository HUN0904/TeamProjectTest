package com.team.biz.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.biz.dto.ReviewVO;

import utils.Criteria;

@Repository
public class ReviewDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int saveReview(ReviewVO vo) {
		return mybatis.insert("ReviewMapper.saveReview", vo);
	}
	
	public double avgReviewScore(int product_no) {
		return mybatis.selectOne("ReviewMapper.avgReviewScore", product_no);
	}
	
	public int countReviewList(int product_no) {
		return mybatis.selectOne("ReviewMapper.countReviewList", product_no);
	}
	
	public List<ReviewVO> reviewListWithPaging(Criteria criteria, int product_no) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("product_no", product_no);
		return mybatis.selectList("ReviewMapper.reviewListWithPaging", map);
	}
	
	public void deleteReview(int review_no) {
		mybatis.delete("ReviewMapper.deleteReview", review_no);
	}
}
