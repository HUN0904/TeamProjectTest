package com.team.view;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.biz.dto.MemberVO;
import com.team.biz.dto.QnaVO;
import com.team.biz.service.QnaService;

@Controller
public class QnaController {
	@Autowired
	private QnaService qnaService;
	
	@GetMapping(value="/qna_list")
	public String qnaList(QnaVO vo, Model model) {
		List<QnaVO> qnaList=qnaService.qnaList();
		model.addAttribute("qnaList", qnaList);
		return "qna/qnaList";
	}
	@GetMapping("/qna_write_form")
	public String qnaWrite(Model model, HttpSession session, 
			@RequestParam(value="product_no") int product_no) {
		// 사용자 로그인 확인
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "member/login";
		} else {
			model.addAttribute("product_no", product_no);
			System.out.println(product_no);
			return "qna/qnaWrite";
		}
	}
	@PostMapping("/qna_write")
	public String qnaWriteAction(QnaVO vo, HttpSession session, 
			@RequestParam(value="product_no") int product_no) {
		// 사용자 로그인 확인
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "member/login";
		} else {
			
			vo.setId(loginUser.getId());
			vo.setProduct_no(product_no);
			qnaService.insertQna(vo);
			return "redirect:product_detail?product_no="+product_no;
		}
	}
	//qna $.ajax
	@ResponseBody
	@GetMapping(value="qnas/list", produces="application/json; charset=UTF-8")
	public Map<String, Object> qnaList(@RequestParam(value="product_no") int product_no) {
		Map<String, Object> qnaInfo = new HashMap<>();
		// 상품 댓글 목록 조회
		List<QnaVO> qnaList = qnaService.getProductQna(product_no);
		// 페이지 정보 작성
		qnaInfo.put("total", qnaList.size());
		qnaInfo.put("qnaList", qnaList);
		return qnaInfo;
	}
	
}
