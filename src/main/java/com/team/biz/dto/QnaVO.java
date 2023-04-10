package com.team.biz.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QnaVO {
	private int qna_no;
	private String id;
	private String secret_yn;
	private Date qna_regdate;
	private int product_no;
	private String title;
	private String content;
	private int reply;
	private Date reply_date;

}
