package com.team.biz.service;

import java.util.List;

import com.team.biz.dto.NoticesVO;

import utils.Criteria;

public interface NoticesService {

	List<NoticesVO> getNoticesList();

	NoticesVO getNotices(int notices_no);

	void insertNotices(NoticesVO vo);

	void updateNotices(NoticesVO vo);
	
	void IncreaseHits(int notices_no);

	void deleteNotices(int notices_no);
	
	int countnoticesList(String title);
	
	List<NoticesVO> getListNoticesWithPaging(Criteria criteria, String title);
}