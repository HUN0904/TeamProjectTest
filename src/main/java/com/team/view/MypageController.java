package com.team.view;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.team.biz.dto.CartVO;
import com.team.biz.dto.MemberVO;
import com.team.biz.dto.OrderVO;
import com.team.biz.dto.ProductVO;
import com.team.biz.service.CartService;
import com.team.biz.service.MemberService;
import com.team.biz.service.OrderService;
import com.team.biz.service.ProductService;

@Controller
public class MypageController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private OrderService orderService;
	
	@GetMapping("/mypage")
	public String myPageView(HttpSession session) {
		// 로그인 확인 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if (loginUser == null) { // 로그인이 안된 경우
			return "member/login";
			}else {
				return "mypage/mypage";
		}
	}
	
	
	@GetMapping("/cart_write_form")
	public String cartWriteForm(Model model,HttpSession session,ProductVO vo) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "member/login";
		} else {
		SimpleDateFormat SDF = new SimpleDateFormat("yyyy/MM/dd");
		
		
		
		List<Date> disAbleDates = cartService.disAbleDates();
		//List<String> strDisAbleDates = new ArrayList<>();
		String[] strDisAbleDates = new String[disAbleDates.size()];
		System.out.println(">>>>>>Disable dates");
		for(int i=0; i<disAbleDates.size(); i++) {
			
			String date = SDF.format(disAbleDates.get(i)); 
			System.out.println("date=" + date);
			strDisAbleDates[i] = date;
		}
		
		model.addAttribute("strDisAbleDates",strDisAbleDates);
			
		ProductVO product = productService.getProduct(vo);
		model.addAttribute("product",product);
		
		MemberVO member = memberService.getMember(loginUser.getId());
		model.addAttribute("member",member);
		return "mypage/cartWrite";
		}
	}
	
	@PostMapping("/cart_write")
	public String insertCart(CartVO vo,HttpSession session,
			@RequestParam(value="image",required=false) MultipartFile uploadFile) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "member/login";
		} else {
			if (uploadFile == null) {
				vo.setCustom_image("noImage.jpg");
			} else if(!uploadFile.isEmpty()) {
				String fileName = uploadFile.getOriginalFilename();
				vo.setCustom_image(fileName); // 테이블에 파일명 저장 용도
				
				// 전송할 이미지 파일을 이동할 실제 경로 구하기
				String image_path = session.getServletContext().getRealPath("WEB-INF/resources/custom_images/");
				try {
					uploadFile.transferTo(new File(image_path+fileName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
			if(vo.getMessage() == null) {
				vo.setMessage("X");
			}
			vo.setId(loginUser.getId());
			cartService.insertCart(vo);
			return "redirect:index";
		}
	}
	
	@GetMapping("/cart_list")
	public String cartList(Model model, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "member/login";
		} else {
			List<CartVO> cartList = cartService.getCartList(loginUser.getId());
			model.addAttribute("cartList",cartList);
			return "mypage/cartList";
		}
	}
	
	@GetMapping("/cart_detail")
	public String cartDetail(CartVO vo,Model model,HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "member/login";
		} else {
			
			CartVO cart = cartService.getCart(vo.getCart_no());
			model.addAttribute("cart", cart);			
			return "mypage/cartDetail";
		}
	}
	
	@RequestMapping(value="cart_delete")
	public String deleteNotices(@RequestParam(value="cart_no") int [] cart_no) {

		for(int i=0; i<cart_no.length; i++) {
				cartService.deleteCart(cart_no[i]);
			}
			
			return "redirect:cart_list";
		
	}
	
	@PostMapping("/order_insert")
	public String orderInsert(HttpSession session, OrderVO order, Model model) {
		// 로그인 확인 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if (loginUser == null) { // 로그인이 안된 경우
			return "member/login";
		} else {
			// order 객체에 사용자 ID 설정
			order.setId(loginUser.getId());
			
			int order_no = orderService.orderInsert(order);
			
			model.addAttribute("order_no", order_no);
			
			return "redirect:order_list";
		}
	}
	
	@GetMapping("/order_list")
	public String orderListById(HttpSession session, Model model,OrderVO vo) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "member/login";
		} else {
			List<OrderVO> orderList = orderService.getOrderListById(loginUser.getId());
			model.addAttribute("orderList",orderList);
			return "mypage/orderList";
		}
	}
	
	@GetMapping("/order_detail")
	public String getOrderDetail(OrderVO vo,Model model,HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			return "member/login";
		} else {
			vo.setId(loginUser.getId());

			OrderVO order = orderService.getOrderDetail(vo);
			model.addAttribute("order", order);			
			return "mypage/orderDetail";
		}
	}
	
}
