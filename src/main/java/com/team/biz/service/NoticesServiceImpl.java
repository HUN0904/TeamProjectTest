package com.team.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.biz.dao.NoticesDAO;
import com.team.biz.dto.NoticesVO;

import utils.Criteria;

@Service("noticesService")
public class NoticesServiceImpl implements NoticesService {

	@Autowired
	private NoticesDAO noticesDAO;
	
	@Override
	public List<NoticesVO> getNoticesList() {
		
		return noticesDAO.noticesList();
	}

	@Override
	public int countnoticesList(String title) {
		
		return noticesDAO.countnoticesList(title);
	}	
	@Override
	public List<NoticesVO> getListNoticesWithPaging(Criteria criteria, String title) {
		
		return noticesDAO.listNoticesWithPaging(criteria, title);
	}
	@Override
	public NoticesVO getNotices(int notices_no) {
		
		return noticesDAO.getNotices(notices_no);
	}

	@Override
	public void insertNotices(NoticesVO vo) {
		
		noticesDAO.insertNotices(vo);
	}

	@Override
	public void updateNotices(NoticesVO vo) {
		
		noticesDAO.updateNotices(vo);
	}
	
	@Override
	public void IncreaseHits(int notices_no) {
		
		noticesDAO.IncreaseHits(notices_no);
	}

	@Override
	public void deleteNotices(int notices_no) {
		
		noticesDAO.deleteNotices(notices_no);
	}

}
