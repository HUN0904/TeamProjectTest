package com.team.biz.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FavoriteVO {
	
	private int favorite_no;
	private String id;
	private int product_no;
	private String product_name;
	private int price;
	private String product_image;
	private Date favorite_regdate;
	private String heart;

}
