package com.team.biz.service;

import java.util.List;

import com.team.biz.dto.QnaVO;

public interface QnaService {

	void insertQna(QnaVO vo);

	List<QnaVO> listQna(QnaVO vo);
}