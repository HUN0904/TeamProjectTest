package com.team.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.team.biz.dto.ProductVO;
import com.team.biz.service.MemberService;
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
	
	/*
	 * 상품등록 화면 표시
	 */
	@PostMapping("/admin_product_write_form")
	public String adminProductWriteView(Model model) {
		String[] kindList = {"힐", "부츠", "샌달", "슬리퍼", "스니커즈", "세일"};
		
		model.addAttribute("kindList", kindList);
		
		return "admin/product/productWrite";
	}
	
	/*
	 * 상품 등록 처리
	 */


	
	@RequestMapping("/admin_product_update_form")
	public String adminProductUpdateView(ProductVO vo, Model model) {
		String[] kindlist = {"힐", "부츠", "샌달", "슬리퍼", "스니커즈", "세일"};
		
		ProductVO product = productService.getProduct(vo);
		
		model.addAttribute("productVO", product);
		model.addAttribute("kindList", kindlist);
		
		return "admin/product/productUpdate";
	}
	
	@RequestMapping("/admin_product_detail")
	public String adminProductDetailAction(ProductVO vo, Model model) {
		String[] kindList = {"", "힐", "부츠", "샌달", "슬리퍼", "스니커즈", "세일"};
		
		ProductVO product = productService.getProduct(vo);
		
		model.addAttribute("productVO", product);
		int index = product.getCategory_no();
		model.addAttribute("kind", kindList[index]);
		
		return "admin/product/productDetail";
	}
}


























