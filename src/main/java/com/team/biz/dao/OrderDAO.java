package com.team.biz.dao;

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
	
	
}
