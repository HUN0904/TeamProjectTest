package com.team.biz.service;

import java.util.List;

import com.team.biz.dto.FavoriteVO;

public interface FavoriteService {

	int insertFavorite(FavoriteVO vo);

	List<FavoriteVO> getListByFavorite(FavoriteVO vo);

	void deleteByFavorite(int favorite_no);
	
	public FavoriteVO getHeartByProduct(FavoriteVO vo);

}