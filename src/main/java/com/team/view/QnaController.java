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
import com.team.biz.dto.NoticesVO;
import com.team.biz.dto.QnaVO;
import com.team.biz.service.QnaService;

import utils.Criteria;
import utils.PageMaker;

@Controller
public class QnaController {
	@Autowired
	private QnaService qnaService;

	
	//Q&A 페이지
	@GetMapping(value="/qna_list")
	public String qnaList(@RequestParam(value="key", defaultValue="") String title,
							@RequestParam(value="pageNum", defaultValue="1") String pageNum,
							@RequestParam(value="rowsPerPage", defaultValue="10") String rowsPerPage,
							Model model) {
		
		Criteria criteria = new Criteria();
		criteria.setPageNum(Integer.parseInt(pageNum));
		criteria.setRowsPerPage(Integer.parseInt(rowsPerPage));
		
		List<QnaVO> qnaList=qnaService.qnaList(criteria, title);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);   
		pageMaker.setTotalCount(qnaService.countQna());
		
		
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("qnaListSize", qnaList.size());
		model.addAttribute("pageMaker", pageMaker);
		return "qna/qnaList";
	}
	
	//Q&A 상세
	@GetMapping("/qna_view")
	public String getQna(QnaVO vo, Model model) {
		
		QnaVO qna = qnaService.getQna(vo.getQna_no());

		model.addAttribute("qnaVO",qna);

		return "qna/qnaView";
	}
	
	//Q&A 상
	@GetMapping(value="/qna_write_form")
	public String qnaWriteForm(QnaVO vo, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "member/login";
		}else {
			return "qna/qnaWrite";
		}
	}

	//
	@ResponseBody
	@PostMapping("qnas/save")
	public String qnaWriteAction(QnaVO vo, HttpSession session) {
		// 사용자 로그인 확인
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "not_logedin";
		} else {
			vo.setId(loginUser.getId());
	        if (qnaService.insertQna(vo) > 0) {
	            return "success";
	        } else {
	            return "fail";
	        }
		}
	}
	//qna $.ajax
	@ResponseBody
	@GetMapping(value="qnas/list", produces="application/json; charset=UTF-8")
	public Map<String, Object> qnaList(QnaVO vo, Criteria criteria) {
		Map<String, Object> qnaInfo = new HashMap<>();
		
		// 상품 Q&A 목록 조회
		List<QnaVO> qnaList=qnaService.getProductQnaList(criteria, vo.getProduct_no());
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);   
		pageMaker.setTotalCount(qnaService.countProductQna(vo.getProduct_no()));
		
		// 페이지 정보 작성
		qnaInfo.put("total", qnaList.size());
		qnaInfo.put("qnaList", qnaList);
		qnaInfo.put("pageInfo", pageMaker);
		
		return qnaInfo;
	}
	
}
