package com.team.biz.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderVO {
	
	private int order_no;
	private int order_dno;
	private int cart_no;
	private int product_no;
	private String id;
	private String product_name;
	private String image;
	private String name;
	private String message;
	private String content;
	private String product_image;
	private String custom_image;
	private int quantity;
	private int total_price;
	private Date pickup_date;
	private Date indate;
	private String cresult;
	private String odresult;
	
}
