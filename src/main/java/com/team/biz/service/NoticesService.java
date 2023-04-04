package com.team.biz.service;

import java.util.List;

import com.team.biz.dto.NoticesVO;

public interface NoticesService {

	List<NoticesVO> getNoticesList();

	NoticesVO getNotices(int notices_no);

	void insertNotices(NoticesVO vo);

	void updateNotices(NoticesVO vo);

	void deleteNotices(int notices_no);

}