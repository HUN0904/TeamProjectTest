package com.team.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.biz.dao.OrderDAO;
import com.team.biz.dto.CartVO;
import com.team.biz.dto.OrderVO;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private CartService cartService;
	
	@Override
	public int selectMaxOrder_no() {
		
		return orderDAO.selectMaxOrder_no();
	}
	
	@Override
	public int orderInsert(OrderVO vo) {
		
		int order_no = selectMaxOrder_no();
		
		orderDAO.orderInsert(vo);
		
		List<CartVO> cartList = cartService.cartList(vo.getId());
		
		for(CartVO cart : cartList) {
			OrderVO order = new OrderVO();
			
			order.setOrder_no(order_no);
			order.setProduct_no(cart.getProduct_no());
			order.setQuantity(cart.getQuantity());
			
			orderDetailInsert(order);
			
			cartService.updateCart(cart.getCart_no());
		}
		
		return order_no;
	}
	
	@Override
	public void orderDetailInsert(OrderVO vo) {
		
		orderDAO.orderDetailInsert(vo);
	}

}
