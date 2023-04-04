package com.team.view;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.biz.dto.MemberVO;
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

	// 공지사항 작성페이지 이동
	@GetMapping("/notices_write_form")
	public String insertNotices(HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "member/login";
		} else {
			return "notices/noticesWrite";
		}
	}

	// 공지사항 작성저장
	@RequestMapping(value="/notices_write")
	public String insertNotices(NoticesVO vo,HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "member/login";
		} else {
			vo.setId(loginUser.getId());
			noticesService.insertNotices(vo);

			return "redirect:notices_list";
		}

	}

	// 공지사항 수정페이지 이동
	@RequestMapping(value="notices_update_form")
	public String updateNoticesform(NoticesVO vo,HttpSession session, Model model) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "member/login";
		} else {
			
			model.addAttribute("noticesVO",noticesService.getNotices(vo.getNotices_no()));
			return "notices/noticesUpdate";
		}
	}


	// 공지사항 수정저장
	@RequestMapping(value="notices_update")
	public String updateNoticesAction(NoticesVO vo,HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "member/login";
		} else {
			vo.setId(loginUser.getId());
			noticesService.updateNotices(vo);

			return "redirect:notices_list";
		}
	}
	
	@RequestMapping(value="notices_delete")
	public String deleteNotices(NoticesVO vo,HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "member/login";
		} else {
			vo.setId(loginUser.getId());
			noticesService.deleteNotices(vo.getNotices_no());

			return "redirect:notices_list";
		}
	}
	

}










