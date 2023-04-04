package com.team.biz.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticesVO {
	private int notices_no;
	private String id;
	private String title;
	private String content;
	private Date notices_date;
	private int hits;
}
