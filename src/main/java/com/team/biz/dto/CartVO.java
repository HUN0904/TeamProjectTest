package com.team.biz.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CartVO {

	private int cart_no;
	private String id;
	private int product_no;
	private String product_name;
	private String message;
	private String content;
	private int quantity;
	private String product_image;
	private String custom_image;
	private int total_price;
	private Date pickup_date;
	private String result;

}
