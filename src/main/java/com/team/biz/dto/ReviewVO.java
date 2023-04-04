package com.team.biz.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewVO {
	private int review_no;
	private String id;
	private int product_no;
	private String content;
	private Date review_regdate;
	private int score;
	private String review_image;
}
