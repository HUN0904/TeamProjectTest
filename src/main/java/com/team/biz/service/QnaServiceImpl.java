package com.team.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.biz.dao.QnaDAO;
import com.team.biz.dto.QnaVO;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {
	
	
	@Autowired
	private QnaDAO qnaDao;
	
	
	
	@Override
	public void insertQna(QnaVO vo) {
	
		qnaDao.insertQna(vo);
	}

	@Override
	public List<QnaVO> listQna(QnaVO vo) {
	
		return qnaDao.listQna(vo);
	}

}
