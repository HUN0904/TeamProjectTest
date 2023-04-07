package com.team.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.biz.dao.ProductDAO;
import com.team.biz.dto.ProductVO;

import utils.Criteria;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDAO pDao;
	
	@Override
	public List<ProductVO> getProductScoreList() {
		return pDao.getProductScoreList();
	}

	@Override
	public ProductVO getProduct(ProductVO vo) {
		return pDao.getProduct(vo);
	}

	@Override
	public List<ProductVO> getListProduct(String product_name) {
		return pDao.listProduct(product_name);
	}

	@Override
	public List<ProductVO> getListProductWithPaging(Criteria criteria, String product_name) {
		return pDao.listProductWithPaging(criteria, product_name);
	}

	@Override
	public int countProductList(String product_name) {
		return pDao.countProductList(product_name);
	}

	@Override
	public void insertProduct(ProductVO vo) {
		pDao.insertProduct(vo);
	}
	
	@Override
	public void updateProduct(ProductVO vo) {
		pDao.updateProduct(vo);
	}
	
	@Override
	public void deleteProduct(int product_no) {
		pDao.deleteProduct(product_no);
	}
	
}
