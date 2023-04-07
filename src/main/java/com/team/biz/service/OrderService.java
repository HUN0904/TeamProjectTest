package com.team.biz.service;

import java.util.List;

import com.team.biz.dto.OrderVO;

public interface OrderService {

	int selectMaxOrder_no();
	
	int orderInsert(OrderVO vo);

	void orderDetailInsert(OrderVO vo);
	
	List<OrderVO> getOrderListById(String id);
	
	List<OrderVO> getOrderListByDate(String date);
	
	OrderVO getOrderDetail(OrderVO vo);
	
	OrderVO getAdminOrderDetail(int order_dno);
	
	List<OrderVO> getAdminOrderList(String product_name);
	
	void updateOrderResult(int order_dno);
}