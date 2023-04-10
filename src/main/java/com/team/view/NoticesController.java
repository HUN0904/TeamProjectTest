package com.team.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.team.biz.dto.NoticesVO;
import com.team.biz.service.NoticesService;

@Controller
public class NoticesController {

	@Autowired
	private NoticesService noticesService;

	// 전체 공지사항 리스트
	@GetMapping("/notices_list")
	public String noticesList(Model model) {

		List<NoticesVO> noticesList = noticesService.getNoticesList();

		model.addAttribute("noticesList",noticesList);
		return "notices/noticesList";
	}

	// 공지사항 상세보기
	@GetMapping("/notices_view")
	public String getNotices(NoticesVO vo, Model model) {

		NoticesVO notices = noticesService.getNotices(vo.getNotices_no());

		model.addAttribute("noticesVO",notices);

		return "notices/noticesView";
	}
}










