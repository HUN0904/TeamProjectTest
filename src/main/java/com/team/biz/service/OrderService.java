package com.team.biz.service;

import java.util.List;

import com.team.biz.dto.OrderVO;

import utils.Criteria;

public interface OrderService {

	int selectMaxOrder_no();
	
	int orderInsert(OrderVO vo);

	void orderDetailInsert(OrderVO vo);
	
	int countOrderList(String name);
	
	int countOrderListById(String id);
	
	int countOrderListByDate(String date);
	
	List<OrderVO> getListOrderWithPaging(Criteria criteria, String name);
	
	List<OrderVO> getListOrderWithPagingById(Criteria criteria, String id);
	
	List<OrderVO> getOrderListById(String id);
	
	List<OrderVO> getListOrderWithPagingByDate(Criteria criteria, String date);
	
	OrderVO getOrderDetail(OrderVO vo);
	
	OrderVO getAdminOrderDetail(int order_dno);
	
	List<OrderVO> getAdminOrderList(String product_name);
	
	void updateOrderResult(int order_dno);
	
	List<OrderVO> getListProductSales(OrderVO vo);
}