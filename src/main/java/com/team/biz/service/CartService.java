package com.team.biz.service;

import java.util.Date;
import java.util.List;

import com.team.biz.dto.CartVO;

public interface CartService {

	List<CartVO> getCartList(String id);

	void insertCart(CartVO vo);

	void deleteCart(int cart_no);

	void updateCart(int cart_no);

	CartVO getCart(int cart_no);
	
	List<String> disAbleDates();
}