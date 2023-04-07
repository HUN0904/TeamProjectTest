package com.team.view;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.team.biz.dto.MemberVO;
import com.team.biz.dto.NoticesVO;
import com.team.biz.dto.OrderVO;
import com.team.biz.dto.ProductVO;
import com.team.biz.service.MemberService;
import com.team.biz.service.NoticesService;
import com.team.biz.service.OrderService;
import com.team.biz.service.ProductService;

import utils.Criteria;
import utils.PageMaker;

@Controller
@SessionAttributes("admin")
public class AdminController {

	@Autowired
	private ProductService productService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private NoticesService noticesService;


	@GetMapping("/admin_login_form")
	public String adminLoginView() {

		return "admin/main";
	}



	@GetMapping("/admin_logout")
	public String adminLogout(SessionStatus status) {

		status.setComplete();

		return "admin/main";
	}

	// 페이징 처리 전 소스
	/*
	 * @GetMapping("/admin_product_list") public String adminProductList(
	 * 
	 * @RequestParam(value="key", defaultValue="") String name, Model model) { //
	 * (1) 전체 상품목록 조회 List<ProductVO> productList =
	 * productService.getListProduct(name);
	 * 
	 * // (2) model 객체에 상품 목록 저장 model.addAttribute("productList", productList);
	 * model.addAttribute("productListSize", productList.size());
	 * 
	 * // (3) 화면 호출: productList.jsp return "admin/product/productList"; }
	 */

	@RequestMapping("/admin_product_list")
	public String adminProductList(
			@RequestParam(value="pageNum", defaultValue="1") String pageNum,
			@RequestParam(value="rowsPerPage", defaultValue="10") String rowsPerPage,
			@RequestParam(value="key", defaultValue="") String product_name, 
			Model model) {

		Criteria criteria = new Criteria();
		criteria.setPageNum(Integer.parseInt(pageNum));
		criteria.setRowsPerPage(Integer.parseInt(rowsPerPage));

		System.out.println("adminProductList() : criteria="+criteria);

		// (1) 전체 상품목록 조회
		List<ProductVO> productList = productService.getListProductWithPaging(criteria, product_name);

		// (2) 화면에 표시할 페이지 버튼 정보 설정(PageMaker 클래스 이용)
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);   // 현재 페이지 정보 저장
		pageMaker.setTotalCount(productService.countProductList(product_name)); // 전체 게시글의 수 저장

		// (2) model 객체에 상품 목록 저장
		model.addAttribute("productList", productList);
		model.addAttribute("productListSize", productList.size());
		model.addAttribute("pageMaker", pageMaker);

		// (3) 화면 호출: productList.jsp
		return "admin/product/productList";
	}

	/* ================================예약현황(reservationStatus)================================ */
	// 예약 현황 조회
	@RequestMapping("/reservation_status")
	public String orderListByDate(
	        @RequestParam(value="date", defaultValue = "") String date, Model model) {
	    System.out.println("date 값 ==["+date+"]");
	    List<OrderVO> orderList = orderService.getOrderListByDate(date);

	    model.addAttribute("orderList",orderList);
	    return "admin/order/reservationStatus";
	}
	
	

	/* ========================================주문(Order)======================================== */
	// 전체 관리자 주문 내역 조회
	@RequestMapping("/admin_order_list")
	public String adminOrderList(
			@RequestParam(value="key",defaultValue = "") String product_name, Model model) {

		List<OrderVO> orderList = orderService.getAdminOrderList(product_name);

		model.addAttribute("orderList",orderList);
		return "admin/order/adminOrderList";
	}
	
	// 관리자 상세 주문 내역
	@GetMapping("/admin_order_detail")
	public String getAdminOrderDetail(OrderVO vo,Model model,HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "member/login";
		} else {
			vo.setId(loginUser.getId());

			OrderVO order = orderService.getAdminOrderDetail(vo.getOrder_dno());
			model.addAttribute("order", order);			
			return "admin/order/adminOrderDetail";
		}
	}
	
	
	// 체크한 항목만 주문 처리 완료
	@RequestMapping(value="order_result_update")
	public String orderResultUpdate(@RequestParam(value="order_dno") int [] order_dno) {
		
		for(int i=0; i<order_dno.length; i++) {
			orderService.updateOrderResult(order_dno[i]);
		}		
		return "redirect:admin_order_list";
	}
	
	
	/* ========================================공지사항(Notices)======================================== */
	// 전체 관리자 공지사항 리스트
	@GetMapping("/admin_notices_list")
	public String noticesList(Model model,HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "member/login";
		} else {
			List<NoticesVO> noticesList = noticesService.getNoticesList();

			model.addAttribute("noticesList",noticesList);

			return "admin/notices/adminNoticesList";
		}
	}

	// 관리자 공지사항 상세보기
	@GetMapping("/admin_notices_view")
	public String getNotices(NoticesVO vo, Model model,HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "member/login";
		} else {
			NoticesVO notices = noticesService.getNotices(vo.getNotices_no());

			model.addAttribute("noticesVO",notices);

			return "admin/notices/adminNoticesView";
		}
	}

	// 관리자 공지사항 작성페이지 이동
	@GetMapping("/notices_write_form")
	public String insertNotices(HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "member/login";
		} else {
			return "admin/notices/noticesWrite";
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

			return "redirect:admin_notices_list";
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
			return "admin/notices/noticesUpdate";
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

			return "redirect:admin_notices_list";
		}
	}

	// 공지사항 삭제
	@RequestMapping(value="notices_delete")
	public String deleteNotices(NoticesVO vo,HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "member/login";
		} else {
			vo.setId(loginUser.getId());
			noticesService.deleteNotices(vo.getNotices_no());

			return "redirect:admin_notices_list";
		}
	}

}


























