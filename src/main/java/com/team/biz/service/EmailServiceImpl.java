package com.team.biz.service;


import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.team.biz.mail.Email;

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MemberService memberService;
	
	@Override
	public void sendMail(Email email) {
		
		try {
			MimeMessage msg = mailSender.createMimeMessage();
			
			msg.addRecipient(RecipientType.TO, new InternetAddress(email.getReceiver()));
			msg.addFrom(new InternetAddress[] {new InternetAddress(email.getSenderMail(), email.getSenderName())});
			msg.setSubject("["+email.getReceiverName()+"]"+"님 요청하신 비밀번호 입니다.","UTF-8");
			msg.setText("요청하신 비밀번호는 ["+memberService.getPwdByNameEmail(email.getReceiverName())+"] 입니다.","UTF-8");//TEXT
			mailSender.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}