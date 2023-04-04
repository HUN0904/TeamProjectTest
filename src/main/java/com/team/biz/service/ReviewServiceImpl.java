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
	private ReviewDAO cDao;
	
	@Override
	public int getCountReviewList(int product_no) {
		return cDao.countReviewList(product_no);
	}

	@Override
	public List<ReviewVO> getReviewListWithPaging(Criteria criteria, int product_no) {
		return cDao.reviewListWithPaging(criteria, product_no);
	}

	@Override
	public int saveReview(ReviewVO vo) {
		return cDao.saveReview(vo);
	}

	@Override
	public double getAvgReviewScore(int product_no) {
		return cDao.avgReviewScore(product_no);
	}

	@Override
	public List<ReviewVO> avgScoreList() {
		return cDao.avgScoreList();
	}

}
