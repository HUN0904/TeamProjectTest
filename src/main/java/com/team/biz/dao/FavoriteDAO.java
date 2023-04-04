package com.team.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.biz.dto.FavoriteVO;

@Repository
public class FavoriteDAO {
    
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertFavorite(FavoriteVO vo) {
		mybatis.insert("FavoriteMapper.insertFavorite",vo);
	}
	
	public List<FavoriteVO> getListByFavorite(FavoriteVO vo){
	   
		return mybatis.selectList("FavoriteMapper.getListByFavorite",vo);
	}
	
	public void deleteByFavorite(int favorite_no) {
		  mybatis.delete("FavoriteMapper.deleteByFavorite",favorite_no);
	}
	
}
