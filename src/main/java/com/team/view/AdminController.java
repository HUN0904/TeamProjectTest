package com.team.view;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

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


	/* ================================상품(product)================================ */
	
	@GetMapping("/insert_product")
	public String insertProduct(HttpSession session,Model model) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "member/login";
		} else {
			String[] kindList = {"초코" , "바닐라" , "오레오" , "카스테라"};

			model.addAttribute("kindList", kindList);

			return "admin/product/productWrite";
		}
	}
	
	@PostMapping("/admin_insert_product")
	public String adminProductWrite(ProductVO vo, HttpSession session,
			@RequestParam(value="image") MultipartFile uploadFile) {

		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			vo.setProduct_image(fileName); // 테이블에 파일명 저장 용도

			// 전송할 이미지 파일을 이동할 실제 경로 구하기
			String image_path = session.getServletContext().getRealPath("WEB-INF/resources/product_images/");

			try {
				uploadFile.transferTo(new File(image_path+fileName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		productService.insertProduct(vo);
		
		return "redirect:admin_product_list";
	}
	

	@RequestMapping("/admin_product_list")
	public String adminProductList(
			@RequestParam(value="key", defaultValue="") String name,
			@RequestParam(value="pageNum", defaultValue="1") String pageNum,
			@RequestParam(value="rowsPerPage", defaultValue="10") String rowsPerPage,
			Model model) {

		Criteria criteria = new Criteria();
		criteria.setPageNum(Integer.parseInt(pageNum));
		criteria.setRowsPerPage(Integer.parseInt(rowsPerPage));

		// (1) 전체 상품목록 조회
		List<ProductVO> productList = productService.getListProductWithPaging(criteria, name);

		// (2) 화면에 표시할 페이지 버튼 정보 설정(PageMaker 클래스 이용)
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);   // 현재 페이지 정보 저장
		pageMaker.setTotalCount(productService.countProductList(name)); // 전체 게시글의 수 저장

		// (2) model 객체에 상품 목록 저장
		model.addAttribute("productList", productList);
		model.addAttribute("productListSize", productList.size());
		model.addAttribute("pageMaker", pageMaker);

		// (3) 화면 호출: productList.jsp
		return "admin/product/productList";
	}
	
	@GetMapping("/admin_product_detail")
	public String adminProductDetail(ProductVO vo, HttpSession session,Model model) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "member/login";
		} else {		
			String[] kindList = {"", "초코" , "바닐라" , "오레오" , "카스테라"};
			int index = vo.getCategory_no();			
			ProductVO product = productService.getProduct(vo);
			model.addAttribute("productVO",product);
			model.addAttribute("kindList", kindList[index]);
			return "admin/product/adminProductDetail";
		}
	}
	
	@RequestMapping("/admin_product_update_form")
	public String adminProductUpdateView(ProductVO vo,Model model) {
		String[] kindList = {"초코" , "바닐라" , "오레오" , "카스테라"}; 

		ProductVO product = productService.getProduct(vo);
		model.addAttribute("productVO", product);
		model.addAttribute("kindList", kindList);

		return "admin/product/productUpdate";
	}
	
	@PostMapping("/admin_product_update")
	public String adminProductUpdate(ProductVO vo,
			@RequestParam(value="image") MultipartFile uploadFile,
			@RequestParam(value="origin_img") String org_image,
			HttpSession session) {

		if(!uploadFile.isEmpty()) { // 상품 이미지를 수정한 경우
			String fileName = uploadFile.getOriginalFilename();
			vo.setProduct_image(fileName); // 테이블에 파일명 저장 용도

			// 전송할 이미지 파일을 이동할 실제 경로 구하기
			String image_path = session.getServletContext().getRealPath("WEB-INF/resources/product_images/");


			try {
				uploadFile.transferTo(new File(image_path+fileName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		} else { // 상품의 기존 이미지 사용
			vo.setProduct_image(org_image);
		}

		if(vo.getBestyn()==null) {
			vo.setBestyn("n");
		} else {
			vo.setBestyn("y");
		}
		productService.updateProduct(vo);
		
		return "redirect:admin_product_list";
	}
	
	@PostMapping("/product_delete")
	public String deleteProduct(ProductVO vo) {

			productService.deleteProduct(vo.getProduct_no());

			return "redirect:admin_product_list";
		
	}
	/* ================================예약현황(reservationStatus)================================ */
	// 예약 현황 조회
//	@RequestMapping("/reservation_status")
//	public String orderListByDate(
//	        @RequestParam(value="date", defaultValue = "") String date, Model model) {
//	    System.out.println("date 값 ==["+date+"]");
//	    List<OrderVO> orderList = orderService.getOrderListByDate(date);
//
//	    model.addAttribute("orderList",orderList);
//	    return "admin/order/reservationStatus";
//	}
	
	@RequestMapping("/reservation_status")
	public String listOrderWithPagingByDate(
			@RequestParam(value="date", defaultValue="") String date,
			@RequestParam(value="pageNum", defaultValue="1") String pageNum,
			@RequestParam(value="rowsPerPage", defaultValue="10") String rowsPerPage,
			Model model) {
		System.out.println("date 값 ==["+date+"]");
		Criteria criteria = new Criteria();
		criteria.setPageNum(Integer.parseInt(pageNum));
		criteria.setRowsPerPage(Integer.parseInt(rowsPerPage));

		List<OrderVO> orderList = orderService.getListOrderWithPagingByDate(criteria, date);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(orderService.countOrderListByDate(date)); 

		model.addAttribute("orderList",orderList);
		model.addAttribute("orderListSize", orderList.size());
		model.addAttribute("pageMaker", pageMaker);

	    return "admin/order/reservationStatus";
	}

	/* ========================================주문(Order)======================================== */

	
	// 주문 내역 페이징 처리 조회
	@RequestMapping("/admin_order_list")
	public String listOrderWithPaging(
			@RequestParam(value="key", defaultValue="") String name,
			@RequestParam(value="pageNum", defaultValue="1") String pageNum,
			@RequestParam(value="rowsPerPage", defaultValue="10") String rowsPerPage,
			Model model) {

		Criteria criteria = new Criteria();
		criteria.setPageNum(Integer.parseInt(pageNum));
		criteria.setRowsPerPage(Integer.parseInt(rowsPerPage));

		List<OrderVO> orderList = orderService.getListOrderWithPaging(criteria, name);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(orderService.countOrderList(name)); 

		model.addAttribute("orderList",orderList);
		model.addAttribute("orderListSize", orderList.size());
		model.addAttribute("pageMaker", pageMaker);

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
		return "forward:/grade_update";
	}
	
	@RequestMapping(value="grade_update")
	public String gradeUpdate(MemberVO vo) {
		int grade =0;
		int grageUpMaxPrice = 1000000;
		
		for(int i =100000 ;i <= grageUpMaxPrice;i += 100000) {
			
			grade = i/100000;
			System.out.println("grade= ["+grade+"]");
			List<String> sumPriceById = memberService.sumPriceById(i);
						
				for(String id: sumPriceById) {
					
					vo.setId(id);
					vo.setGrade(grade);
					memberService.gradeUpdate(vo);				
				}
		}
		return "redirect:admin_order_list";
	}
	
	
	/* ========================================공지사항(Notices)======================================== */
	// 전체 관리자 공지사항 리스트 
	@RequestMapping("/admin_notices_list")
	public String adminnoticesList(
			@RequestParam(value="key", defaultValue="") String title,
			@RequestParam(value="pageNum", defaultValue="1") String pageNum,
			@RequestParam(value="rowsPerPage", defaultValue="10") String rowsPerPage,
			Model model) {

		Criteria criteria = new Criteria();
		criteria.setPageNum(Integer.parseInt(pageNum));
		criteria.setRowsPerPage(Integer.parseInt(rowsPerPage));

		// (1) 전체 상품목록 조회
		List<NoticesVO> noticesList = noticesService.getListNoticesWithPaging(criteria, title);

		// (2) 화면에 표시할 페이지 버튼 정보 설정(PageMaker 클래스 이용)
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);   // 현재 페이지 정보 저장
		pageMaker.setTotalCount(noticesService.countnoticesList(title)); // 전체 게시글의 수 저장

		// (2) model 객체에 상품 목록 저장
		model.addAttribute("noticesList", noticesList);
		model.addAttribute("noticesListSize", noticesList.size());
		model.addAttribute("pageMaker", pageMaker);

		// (3) 화면 호출: productList.jsp
		return "admin/notices/adminNoticesList";
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




/* ========================================판매 실적(sales)======================================== */




}
















