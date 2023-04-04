package com.team.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.biz.dao.FavoriteDAO;
import com.team.biz.dto.FavoriteVO;


@Service("favoriteService")
public class FavoriteServiceImpl implements FavoriteService {

	@Autowired
	private FavoriteDAO favoriteDao;
	
	@Override
	public void insertFavorite(FavoriteVO vo) {
		favoriteDao.insertFavorite(vo);

	}

	@Override
	public List<FavoriteVO> getListByFavorite(FavoriteVO vo) {
		
		return favoriteDao.getListByFavorite(vo);
	}

	@Override
	public void deleteByFavorite(int favorite_no) {
		favoriteDao.deleteByFavorite(favorite_no);

	}

}
