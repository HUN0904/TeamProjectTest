package com.team.biz.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.biz.dto.OrderVO;

import utils.Criteria;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int selectMaxOrder_no() {
		
		return mybatis.selectOne("OrderMapper.selectMaxOrder_no");
	}
	
	public int countOrderList(String name) {
		
		return mybatis.selectOne("OrderMapper.countOrderList", name);
	}
	
	public int countOrderListByDate(String date) {
		
		return mybatis.selectOne("OrderMapper.countOrderListByDate", date);
	}
	
	public int countOrderListById(String id) {
		
		return mybatis.selectOne("OrderMapper.countOrderListById", id);
	}
	
	public List<OrderVO> listOrderWithPaging(Criteria criteria, String name) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("name", name);
		
		return mybatis.selectList("OrderMapper.listOrderWithPaging", map);
	}
	
	public List<OrderVO> listOrderWithPagingByDate(Criteria criteria, String date){
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("pickup_date", date);
		
		return mybatis.selectList("OrderMapper.listOrderWithPagingByDate", map);
	}
	
	public List<OrderVO> listOrderWithPagingById(Criteria criteria, String id) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		map.put("id", id);
		
		return mybatis.selectList("OrderMapper.listOrderWithPagingById", map);
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











