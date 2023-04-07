package com.team.view;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.biz.dto.FavoriteVO;
import com.team.biz.dto.MemberVO;
import com.team.biz.dto.ProductVO;
import com.team.biz.service.FavoriteService;
import com.team.biz.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private FavoriteService favoriteService;
	
	@RequestMapping(value="/product_detail", method=RequestMethod.GET)
	public String productDetailAction(ProductVO vo, Model model,HttpSession session){
	    MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
	    
			ProductVO product=productService.getProduct(vo);
			model.addAttribute("productVO", product);
			if(loginUser!=null) {
				FavoriteVO fvo =  new FavoriteVO();
				fvo.setId(loginUser.getId());
				fvo.setProduct_no(vo.getProduct_no());
				FavoriteVO favorite= favoriteService.getHeartByProduct(fvo);
				model.addAttribute("favorite", favorite);	
			}
			return "product/productDetail";
	}
	
	// 리스트 이동
	@GetMapping("/product_list")
	public String productList(Model model) {
		List<ProductVO> productList = productService.getProductScoreList();
		
		model.addAttribute("productList",productList);
		
		return "product/productList";
	}
	
	@GetMapping("/product_insert")
	public String productInsert(Model model) {
		List<ProductVO> productList = productService.getProductScoreList();
		
		model.addAttribute("productList",productList);
		
		return "product/product_create";
	}
	

}
