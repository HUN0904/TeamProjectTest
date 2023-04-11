package com.team.biz.service;

import java.util.List;

import com.team.biz.dto.QnaVO;

import utils.Criteria;

public interface QnaService {
	int countQna();
	
	int countProductQna(int product_no);

	List<QnaVO> qnaList(Criteria criteria, String title);

	List<QnaVO> getProductQna(Criteria criteria, int product_no);
	
	int insertQna(QnaVO vo);
}