package com.team.view;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.team.biz.dto.MemberVO;
import com.team.biz.service.MemberService;



@Controller
@SessionAttributes("loginUser")
public class MemberController {

	@Autowired
	private MemberService memberService;
	

	
	@GetMapping("/login_form")
	public String loginView() {
		return "member/login";
	}
	
	@PostMapping("/login")
	public String loginAction(MemberVO vo, Model model) {
		int result=memberService.loginID(vo);
		if(result==1) {//로그인 성공
			model.addAttribute("loginUser", memberService.getMember(vo.getId()));
			return "redirect:index";
		}else if(result==2) {
			model.addAttribute("loginUser", memberService.getMember(vo.getId()));
			return "redirect:admin_product_list";
		}else {
			return "member/login_fail";
		}
	}

	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		status.setComplete();  // 세션 해지
		
		return "member/login";
	}
////////
	//id 중복체크 화면 표시
	@GetMapping(value="/id_check_form")
	public String idCheckView(MemberVO vo, Model model) {
		int result=memberService.confirmID(vo.getId());
		model.addAttribute("id", vo.getId());
		model.addAttribute("message", result);
		return "member/idcheck";
	}
	//중복 액션
	@PostMapping("/id_check_form")
	public String idCheckAction(MemberVO vo, Model model) {
		int result=memberService.confirmID(vo.getId());
		model.addAttribute("id", vo.getId());
		model.addAttribute("message", result);
		return "member/idcheck";
	}
	
	
	@GetMapping(value="/email_check_form")
	public String emailCheckView(MemberVO vo, Model model) {
		int result=memberService.confirmMail(vo.getEmail());
		model.addAttribute("email", vo.getEmail());
		model.addAttribute("message", result);
		return "member/emailcheck";
	}
	//중복 액션
	@PostMapping("/email_check_form")
	public String emailCheckAction(MemberVO vo, Model model) {
		int result=memberService.confirmMail(vo.getEmail());
		model.addAttribute("email", vo.getEmail());
		model.addAttribute("message", result);
		return "member/emailcheck";
	}
	
	@GetMapping(value="/joinnickname_check_form")
	public String joinnicknameCheckView(MemberVO vo, Model model) {
		int result=memberService.joinconfirmNickname(vo.getNickname());
		model.addAttribute("nickname", vo.getNickname());
		model.addAttribute("message", result);
		return "member/joinnicknamecheck";
	}
	
	@PostMapping("/joinnickname_check_form")
	public String joinnicknameCheckViewAction(MemberVO vo, Model model) {
		int result=memberService.joinconfirmNickname(vo.getNickname());
		model.addAttribute("nickname", vo.getNickname());
		model.addAttribute("message", result);
		return "member/joinnicknamecheck";
	}
	
	
	@GetMapping(value="/modifynickname_check_form")
	public String modifynicknameCheckView(MemberVO vo, Model model) {
		int result=memberService.modifyconfirmNickname(vo);
		model.addAttribute("nickname", vo.getNickname());
		model.addAttribute("message", result);
		return "member/modifynicknamecheck";
	}
	
	@PostMapping("/modifynickname_check_form")
	public String modifynicknameCheckAction(MemberVO vo, Model model) {
		
		int result=memberService.modifyconfirmNickname(vo);

		model.addAttribute("nickname", vo.getNickname());
		model.addAttribute("message", result);
		return "member/modifynicknamecheck";
	}
	
	
	@GetMapping("/join")
	public String joinView() {
		
		return "member/join";
	}
	
	@PostMapping("/join")
	public String joinAction(MemberVO vo,
			@RequestParam(value="addr1", defaultValue="") String addr1,
			@RequestParam(value="addr2", defaultValue="") String addr2,
			@RequestParam(value="phone1", defaultValue="") String phone1,
			@RequestParam(value="phone2", defaultValue="") String phone2,
			@RequestParam(value="phone3", defaultValue="") String phone3) {
		
		vo.setAddress(addr1 + " " + addr2);
		vo.setPhone(phone1 + "-" + phone2+ "-" + phone3);
		memberService.insertMember(vo);
		
		return "member/login";
	}

	@GetMapping("/find_id_form")
	public String findIdFormView() {
		
		return "member/findIdAndPassword";
	}
		
	@PostMapping("/find_id")
	public String findIdAction(MemberVO vo, Model model) {
		
		String id = memberService.selectIdByNameEmail(vo);
		
		if (id != null) {  // 아이디 조회 성공
			model.addAttribute("message", 1);
			model.addAttribute("id", id);
		} else {
			model.addAttribute("message", -1);
		}
		
		return "member/findResult";  // 아이디 조회결과 화면표시
	}
	
	@RequestMapping("/modify_member_form")
	public String modifyMember() {
		
		return "member/modify";
	}
	@RequestMapping("/modify_member")
	public String modifyMemberAction(MemberVO vo, HttpSession session,Model model,
		@RequestParam(value="addr1", defaultValue="") String addr1,
		@RequestParam(value="addr2", defaultValue="") String addr2,
		@RequestParam(value="phone1", defaultValue="") String phone1,
		@RequestParam(value="phone2", defaultValue="") String phone2,
		@RequestParam(value="phone3", defaultValue="") String phone3) {
		vo.setAddress(addr1 + " " + addr2);
		vo.setPhone(phone1 + "-" + phone2+ "-" + phone3);
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		vo.setId(loginUser.getId());
		memberService.modifyMember(vo);
		model.addAttribute("loginUser", memberService.getMember(vo.getId()));
		return "redirect:/index";
	}
}
