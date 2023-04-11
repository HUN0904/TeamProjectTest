package com.team.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.biz.dto.MemberVO;
import com.team.biz.mail.Email;
import com.team.biz.service.EmailService;
import com.team.biz.service.MemberService;

@Controller
public class MailController {
	@Autowired
	   private EmailService emailService;
	@Autowired
	private MemberService memberService;

	@RequestMapping("find_pwd") // 확인 (메일발송) 버튼을 누르면 맵핑되는 메소드
    public String send(@ModelAttribute Email email, Model model,MemberVO vo) {
        try {
        	//이메일,아이디,이름
        	System.out.println("send(): email="+email);
        	vo.setId(email.getReceiverId());
        	vo.setName(email.getReceiverName());
        	vo.setEmail(email.getReceiver());
        	String result = memberService.selectPwdByIdNameEmail(vo);
        	if(result==null) {
        		model.addAttribute("message", "확인되지않는 정보입니다.");
        	}else {
          		emailService.sendMail(email); // dto (메일관련 정보)를 sendMail에 저장함
        		model.addAttribute("message", "요청하신 이메일로 비밀번호가 전송되었습니다."); // 이메일이 발송되었다는 메시지를 출력시킨다.
        	}
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "member/findIdAndPassword"; // 실패했으므로 다시 findIdAndPassword jsp 페이지로 이동함
    }
	   

}
