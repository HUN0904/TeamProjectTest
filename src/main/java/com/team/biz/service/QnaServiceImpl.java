package com.team.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.biz.dao.QnaDAO;
import com.team.biz.dto.QnaVO;

import utils.Criteria;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDAO qnaDao;
	
	@Override
	public int countQna() {
		return qnaDao.countQna();
	}
	@Override
	public int countProductQna(int product_no) {
		return qnaDao.countProductQna(product_no);
	}
	@Override
	public List<QnaVO> qnaList(Criteria criteria, String title) {
		return qnaDao.qnaList(criteria, title);
	}
	@Override
	public List<QnaVO> getProductQnaList(Criteria criteria, int product_no) {
		return qnaDao.getProductQnaList(criteria, product_no);
	}

	@Override
	public int insertQna(QnaVO vo) {
		return qnaDao.insertQna(vo);
	}
	@Override
	public QnaVO getQna(int qna_no) {
		return qnaDao.getQna(qna_no);
	}
	@Override
	public void updateQna(QnaVO vo) {
		qnaDao.updateQna(vo);
	}
	@Override
	public void deleteQna(int qna_no) {
		qnaDao.deleteQna(qna_no);
	}


}
