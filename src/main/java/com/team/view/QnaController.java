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

import utils.Criteria;
import utils.PageMaker;

@Controller
public class QnaController {
	@Autowired
	private QnaService qnaService;
	/*@RequestParam(value="pageNum", defaultValue="1") String pageNum,
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
		model.addAttribute("pageMaker", pageMaker);*/
	@GetMapping(value="/qna_list")
	public String qnaList(@RequestParam(value="pageNum", defaultValue="1") String pageNum,
			@RequestParam(value="rowsPerPage", defaultValue="10") String rowsPerPage,
			QnaVO vo, Model model) {
		Criteria criteria = new Criteria();
		criteria.setPageNum(Integer.parseInt(pageNum));
		criteria.setRowsPerPage(Integer.parseInt(rowsPerPage));
		
		List<QnaVO> qnaList=qnaService.qnaList();
		model.addAttribute("qnaList", qnaList);
		return "qna/qnaList";
	}
	@GetMapping(value="/qna_write_form")
	public String qnaWriteForm(QnaVO vo, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "member/login";
		}else {
			return "qna/qnaWrite";
		}
	}

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
	public Map<String, Object> qnaList(QnaVO vo) {
		Map<String, Object> qnaInfo = new HashMap<>();
		// 상품 Q&A 목록 조회
		List<QnaVO> qnaList = qnaService.getProductQna(vo.getProduct_no());
		// 페이지 정보 작성
		qnaInfo.put("total", qnaList.size());
		qnaInfo.put("qnaList", qnaList);
		return qnaInfo;
	}
	
}
