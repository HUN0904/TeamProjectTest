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
		
		vo.setOrder_no(order_no);
		orderDAO.orderInsert(vo);
		
		List<CartVO> cartList = cartService.getCartList(vo.getId());
		OrderVO order = new OrderVO();
		for(CartVO cart : cartList) {
			
			order.setOrder_no(order_no);
			order.setProduct_no(cart.getProduct_no());
			order.setCart_no(cart.getCart_no());
			
			orderDetailInsert(order);
			
			cartService.updateCart(cart.getCart_no());
		}
		
		return order_no;
	}
	
	@Override
	public void orderDetailInsert(OrderVO vo) {
		
		orderDAO.orderDetailInsert(vo);
	}

	@Override
	public List<OrderVO> getOrderListById(String id){
		
		return orderDAO.orderListById(id);
	}
	
	@Override
	public List<OrderVO> getOrderListByDate(String date){
		
		return orderDAO.orderListByDate(date);
	}
	
	@Override
	public OrderVO getOrderDetail(OrderVO vo) {
		
		return orderDAO.getOrderDetail(vo);
	}
	
	@Override
	public OrderVO getAdminOrderDetail(int order_dno) {
		
		return orderDAO.getAdminOrderDetail(order_dno);
	}
	
	@Override
	public List<OrderVO> getAdminOrderList(String product_name){
		
		return orderDAO.adminOrderList(product_name);
	}
	
	@Override
	public void updateOrderResult(int order_dno) {
		
		orderDAO.updateOrderResult(order_dno);
	}
}
