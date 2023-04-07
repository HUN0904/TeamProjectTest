package com.team.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.biz.dto.OrderVO;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int selectMaxOrder_no() {
		
		return mybatis.selectOne("OrderMapper.selectMaxOrder_no");
	}
	
	public void orderInsert(OrderVO vo) {
		
		mybatis.insert("OrderMapper.orderInsert", vo);
	}
	
	public void orderDetailInsert(OrderVO vo) {
		
		mybatis.insert("OrderMapper.orderDetailInsert", vo);
	}
	
	public List<OrderVO> orderListById(String id){
		
		return mybatis.selectList("OrderMapper.orderListById", id);
	}
	
	public List<OrderVO> orderListByDate(String date){
		
		return mybatis.selectList("OrderMapper.orderListByDate", date);
	}
	
	public OrderVO getOrderDetail(OrderVO vo) {
		
		return mybatis.selectOne("OrderMapper.getOrderDetail", vo);
	}
	
	public OrderVO getAdminOrderDetail(int order_dno) {
		
		return mybatis.selectOne("OrderMapper.getAdminOrderDetail", order_dno);
	}
	
	
	public List<OrderVO> adminOrderList(String product_name){
		
		return mybatis.selectList("OrderMapper.orderList", product_name);
	}
	
	public void updateOrderResult(int order_dno) {
		
		mybatis.update("OrderMapper.updateOrderResult",order_dno);
	}
	

}











