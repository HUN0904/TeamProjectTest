package com.team.view;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.biz.dto.NoticesVO;
import com.team.biz.service.NoticesService;

import utils.Criteria;
import utils.PageMaker;

@Controller
public class NoticesController {

	@Autowired
	private NoticesService noticesService;

	// 전체 공지사항 리스트
//	@GetMapping("/notices_list")
//	public String noticesList(Model model) {
//
//		List<NoticesVO> noticesList = noticesService.getNoticesList();
//
//		model.addAttribute("noticesList",noticesList);
//		return "notices/noticesList";
//	}

	@RequestMapping("/notices_list")
	public String adminnoticesList(
			@RequestParam(value="key", defaultValue="") String title,
			@RequestParam(value="pageNum", defaultValue="1") String pageNum,
			@RequestParam(value="rowsPerPage", defaultValue="10") String rowsPerPage,
			Model model) {

		Criteria criteria = new Criteria();
		criteria.setPageNum(Integer.parseInt(pageNum));
		criteria.setRowsPerPage(Integer.parseInt(rowsPerPage));

		List<NoticesVO> noticesList = noticesService.getListNoticesWithPaging(criteria, title);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);   
		pageMaker.setTotalCount(noticesService.countnoticesList(title)); 

		model.addAttribute("noticesList", noticesList);
		model.addAttribute("noticesListSize", noticesList.size());
		model.addAttribute("pageMaker", pageMaker);

		return "notices/noticesList";
	}	
	
	// 공지사항 상세보기
	@GetMapping("/notices_view")
	public String getNotices(NoticesVO vo, Model model) {
		
		noticesService.IncreaseHits(vo.getNotices_no());
		NoticesVO notices = noticesService.getNotices(vo.getNotices_no());

		model.addAttribute("noticesVO",notices);

		return "notices/noticesView";
	}
}










