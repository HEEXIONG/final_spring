package com.spring.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;
@Data
public class UsersVO {
	private Long USER_NO;   //시퀸스
	private String USER_ID; 
	private String USER_PW;  // 받아오고
	private String USER_NICKNAME; 
	private String USER_PHONE;
	private String USER_EMAIL;  //받아오고
	private Date USER_REGDATE; //
	private String USER_POST;
	private String USER_ADDR1;
	private String USER_ADDR2;
	private String ENABLED; //
	private List<AttachImageVO> imageList;
	private List<AuthVO> authList; //
	
	
	
	
	
	

}