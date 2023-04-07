package com.team.biz.service;

import java.util.List;

import com.team.biz.dto.ReviewVO;

import utils.Criteria;

public interface ReviewService {

	int saveReview(ReviewVO vo); 
	
	double getAvgReviewScore(int product_no);
	
	int getCountReviewList(int product_no);

	List<ReviewVO> getReviewListWithPaging(Criteria criteria, int product_no);

	List<ReviewVO> avgScoreList();
	
	void deleteReview(int review_no);
}