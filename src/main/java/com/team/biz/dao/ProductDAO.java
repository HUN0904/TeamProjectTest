package com.team.biz.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.biz.dto.ProductVO;

import utils.Criteria;

@Repository("productDAO")
public class ProductDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	

	public List<ProductVO> getProductScoreList() {
		return mybatis.selectList("ProductMapper.getProductScoreList");
	}
	
	// 상품번호로 하나의 상품정보 얻어오기
	public ProductVO getProduct(ProductVO vo) {
		return mybatis.selectOne("ProductMapper.getProduct", vo);
	}
	
	public int countProductList(String product_name) {
		return mybatis.selectOne("ProductMapper.countProductList", product_name);
	}
	public List<ProductVO> listProduct(String product_name) {
		return mybatis.selectList("ProductMapper.listProduct", product_name);
	}
	
	public List<ProductVO> listProductWithPaging(Criteria criteria, String product_name) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("product_name", product_name);
		
		return mybatis.selectList("ProductMapper.listProductWithPaging", map);
	}
	
	public void insertProduct(ProductVO vo) {
		
		mybatis.insert("ProductMapper.insertProduct", vo);
	}
	
	public void updateProduct(ProductVO vo) {
		
		mybatis.update("ProductMapper.updateProduct",vo);
	}

	public void deleteProduct(int product_no) {
		
		mybatis.delete("ProductMapper.deleteProduct",product_no);
	}
}

