package com.spring.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PdVo {

	private Long pdcode;
	
	private String title;
	
	private String admin;

	private String content;
	
	private Date regdate;
	
	private Long price;
	
	private String filename;
	
	private String amount;
	
	private int replyCnt;
}
