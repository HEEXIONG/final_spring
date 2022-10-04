package com.spring.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PdVo {

	private Long pd_code;
	
	private String pd_title;
	
	private String admin;

	private String pd_content;
	
	private Date regdate;
	
	private Long price;
	
	private String filename;
	
	private String amount;
	
	private int replyCnt;
}
