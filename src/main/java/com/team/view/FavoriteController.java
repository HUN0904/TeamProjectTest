package com.team.view;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.biz.dto.FavoriteVO;
import com.team.biz.dto.MemberVO;
import com.team.biz.service.FavoriteService;

@Controller
public class FavoriteController {
   
	@Autowired
	private FavoriteService favoriteService;
	
	@GetMapping("/favorite_insert")
	@ResponseBody
	public FavoriteVO insertFavorite(FavoriteVO vo, HttpSession session) {
		MemberVO loginUser= (MemberVO)session.getAttribute("loginUser");
		
		vo.setId(loginUser.getId());
		vo.setHeart("1");//heart 추가
		int fno=favoriteService.insertFavorite(vo);
		System.out.println("좋아요 Insert 후 favorite_no="+vo.getFavorite_no());
		
		return vo;
	}
	
	@GetMapping("/favorite_list")
	public String listFavorite(HttpSession session,Model model,FavoriteVO vo) {
       
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if (loginUser == null) { // 로그인이 안된 경우
			return "member/login";
		} else {
			vo.setId(loginUser.getId());
			List<FavoriteVO> listFavorite= favoriteService.getListByFavorite(vo);
			model.addAttribute("listFavorite",listFavorite);
			return "mypage/favoriteList";
		}
	}
	
	@RequestMapping(value="/delete_favorite")
	public String deleteFavorite(FavoriteVO vo, HttpSession session) {

		favoriteService.deleteByFavorite(vo.getFavorite_no());
		
		return "redirect:favorite_list";

	}
	

}
