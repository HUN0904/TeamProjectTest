package com.team.biz.service;

import java.util.List;

import com.team.biz.dto.ProductVO;

import utils.Criteria;

public interface ProductService {
	
	List<ProductVO> getProductScoreList();
	
	int countProductList(String product_name);
	
	ProductVO getProduct(ProductVO vo);

	List<ProductVO> getListProduct(String product_name);
	
	List<ProductVO> getListProductWithPaging(Criteria criteria, String product_name);
	
	void insertProduct(ProductVO vo);
	
	void updateProduct(ProductVO vo);
	
	void deleteProduct(int product_no);
}
