package com.team.biz.service;

import java.util.List;

import com.team.biz.dto.QnaVO;

public interface QnaService {

	List<QnaVO> qnaList();

	int insertQna(QnaVO vo);
	
	List<QnaVO> getProductQna(int product_no);
}