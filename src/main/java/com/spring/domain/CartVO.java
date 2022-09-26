package com.spring.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CartVO {
	private Long qno;
	private String q_title;
	private String q_content;
	private String q_writer;
	private Date regdate;
	private Date updatedate;
	
	private String CART_CODE;
	private int PD_CODE;
	private String PD_TITLE;
	private String PD_CONTENT;
	private String PD_IMAGE;
	private String ADMIN;
	private int  PD_AMOUNT;
	private String PD_TOTALPRICE;
	private int USER_NO;
	private int PRICE;
	private int CART_PRICE;
	private int CART_COUNT;
}
//코드 가독성 향상 lombok 라이브러리 활용 코드 가독성 향상~


