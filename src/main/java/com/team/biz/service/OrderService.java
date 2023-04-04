package com.team.biz.service;

import com.team.biz.dto.OrderVO;

public interface OrderService {

	int selectMaxOrder_no();
	
	int orderInsert(OrderVO vo);

	void orderDetailInsert(OrderVO vo);
}