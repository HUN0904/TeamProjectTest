package com.team.biz.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String address;
	private String nickname;
	private String phone;
	private String admin;
	private Date regdate;
	private int grade;
	private int sum_price;
}
