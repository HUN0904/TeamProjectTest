package com.team.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.biz.dto.CartVO;

@Repository
public class CartDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<CartVO> cartList(String id){
		return mybatis.selectList("CartMapper.cartList", id);
	}
	
	public CartVO getCart(int cart_no) {
		return mybatis.selectOne("CartMapper.getCart", cart_no);
	}
	
	public void insertCart(CartVO vo) {
		mybatis.insert("CartMapper.insertCart", vo);
	}
	
	public void deleteCart(int cart_no) {
		mybatis.delete("CartMapper.deleteCart", cart_no);
	}
	
	public void updateCart(int cart_no) {
		mybatis.update("CartMapper.updateCart",cart_no);
	}
	
	public List<String> disAbleDates(){
		return mybatis.selectList("CartMapper.disAbleDates");
	}
}
