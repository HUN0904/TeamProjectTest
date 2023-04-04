package com.team.biz.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductVO {
	private int product_no;
	private int category_no;
	private String product_name; 
	private String content; 
	private int default_price;
	private int discount_price; 
	private int price;
	private Date product_regdate; 
    private String bestyn; 
    private String product_image; 
    private Double avg_score;
}
