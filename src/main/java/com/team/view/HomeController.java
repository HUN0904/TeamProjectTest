package com.team.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.biz.dto.ProductVO;
import com.team.biz.service.ProductService;
import com.team.biz.service.ReviewService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home(Model model, ProductVO vo) {
		//신상품 조회
		List<ProductVO> ProductList=productService.getProductScoreList();
		

		
		model.addAttribute("ProductList", ProductList);

		return "index";
	}
	
}
