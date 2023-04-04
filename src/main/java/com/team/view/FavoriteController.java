package com.team.view;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.team.biz.dto.FavoriteVO;
import com.team.biz.dto.MemberVO;
import com.team.biz.service.FavoriteService;

@Controller
public class FavoriteController {
   
	@Autowired
	private FavoriteService favoriteService;
	
	@PostMapping("/favorite_insert")
	public String insertFavorite(FavoriteVO vo, HttpSession session) {
		MemberVO loginUser= (MemberVO)session.getAttribute("loginUser");
		
		if(loginUser==null) {
			return "member/login";
		}else {
			vo.setId(loginUser.getId());
			favoriteService.insertFavorite(vo);
			
			return "redirect:favorite_list";
		}
	}
}
