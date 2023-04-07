package com.team.view;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.team.biz.dto.MemberVO;
import com.team.biz.dto.ProductVO;
import com.team.biz.dto.ReviewVO;
import com.team.biz.service.ReviewService;

import utils.Criteria;
import utils.PageMaker;

@RestController
@RequestMapping("/reviews")
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping(value="/list", produces="application/json; charset=UTF-8")
	public Map<String, Object> reviewList(ReviewVO vo, Criteria criteria) {
		Map<String, Object> reviewInfo = new HashMap<>();
		// 상품 댓글 목록 조회
		List<ReviewVO> reviewList 
				= reviewService.getReviewListWithPaging(criteria, vo.getProduct_no());
		// 페이지 정보 작성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(reviewService.getCountReviewList(vo.getProduct_no()));
		reviewInfo.put("total", reviewList.size());
		reviewInfo.put("reviewList", reviewList);
		reviewInfo.put("pageInfo", pageMaker);
		return reviewInfo;
	}
	@RequestMapping("/product_detail")
	public String avgReviewScore(ReviewVO vo, Model model , Criteria criteria, ProductVO prodVO) {
		double avg=reviewService.getAvgReviewScore(prodVO.getProduct_no());
		System.out.println("avg"+avg);
		model.addAttribute("productReviewVO",reviewService.getReviewListWithPaging(criteria, vo.getProduct_no()) );
		model.addAttribute("avg", avg);
		return "product/productDetail";
	}
	
	@PostMapping(value="/save")
	public String saveReviewAction(ReviewVO reviewVO, HttpSession session,
	        @RequestParam(value="image",required=false) MultipartFile uploadFile, 
	        @RequestParam(value = "score", required = false) Integer score){
	    MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
	    if (loginUser == null) {
	        return "not_logedin";
	    } else {
	        String fileName = null;
	        if (uploadFile != null && !uploadFile.isEmpty()) {
	            fileName = uploadFile.getOriginalFilename();
	            reviewVO.setReview_image(fileName); // 테이블에 파일명 저장 용도
	            // 전송된 이미지 파일을 이동할 실제 경로 구하기
	            String image_path = session.getServletContext().getRealPath("WEB-INF/resources/review_images/");
	            try {
	                uploadFile.transferTo(new File(image_path + fileName));
	            } catch (IllegalStateException | IOException e) {
	                e.printStackTrace();
	            }
	        }
	        reviewVO.setId(loginUser.getId());    // 사용자 ID 저장
	        if (score != null) {
	            reviewVO.setScore(score);
	        }
	        reviewVO.setReview_image(fileName); // 테이블에 파일명 저장 용도
	        if (reviewService.saveReview(reviewVO) > 0) {
	            return "success";
	        } else {
	            return "fail";
	        }
	    }
	}
	
	@RequestMapping(value="/delete")
	public String deleteNotices(ReviewVO vo,HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "not_logedin";
		} else {
			vo.setId(loginUser.getId());
			reviewService.deleteReview(vo.getReview_no());
			return "success";
		}
	}

	
	
}
