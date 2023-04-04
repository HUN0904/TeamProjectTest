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
	private String id;
	private int product_no;
	private int quantity;
	private Date indate;
	private String result;
	
}
