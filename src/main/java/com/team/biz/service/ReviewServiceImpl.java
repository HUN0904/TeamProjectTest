package com.team.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.biz.dao.ReviewDAO;
import com.team.biz.dto.ReviewVO;

import utils.Criteria;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;
	
	@Override
	public int getCountReviewList(int product_no) {
		return reviewDAO.countReviewList(product_no);
	}

	@Override
	public List<ReviewVO> getReviewListWithPaging(Criteria criteria, int product_no) {
		return reviewDAO.reviewListWithPaging(criteria, product_no);
	}

	@Override
	public int saveReview(ReviewVO vo) {
		return reviewDAO.saveReview(vo);
	}

	@Override
	public double getAvgReviewScore(int product_no) {
		return reviewDAO.avgReviewScore(product_no);
	}

	@Override
	public void deleteReview(int review_no) {
		reviewDAO.deleteReview(review_no);
	}

}
