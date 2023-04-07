package com.team.view;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.team.biz.dto.MemberVO;
import com.team.biz.dto.QnaVO;
import com.team.biz.service.QnaService;

@Controller

public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@GetMapping("/qna_list")
	public String listQna(HttpSession session,Model model,QnaVO vo) {
	
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "member/login";
		} else {
		List<QnaVO> listQna = qnaService.listQna(vo);

		model.addAttribute("listQna", listQna);
		
		return "qna/qnalist";
		}
	}
	
	@GetMapping("/qna_write_form")
	public String qnaWriteView(HttpSession session) {
		// 사용자 로그인 확인
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "member/login";
		} else {
			return "qna/qnawrite";
		}
	}
	@PostMapping("/qna_save")
	public String qnaWriteAction(QnaVO vo, HttpSession session) {
		// 사용자 로그인 확인
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "member/login";
		} else {
			vo.setId(loginUser.getId());
			System.out.println("qnaVO() : "+ vo);
			qnaService.insertQna(vo);
			
			return "redirect:qna_list";
		}
	}

}
