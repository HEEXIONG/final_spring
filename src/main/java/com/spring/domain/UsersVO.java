package com.spring.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;
@Data
public class UsersVO {
	private Long USER_NO;
	private String USER_ID;
	private String USER_PW;
	private String USER_NICKNAME;
	private String USER_PHONE;
	private String USER_EMAIL;
	private Date USER_REGDATE;
	private String USER_POST;
	private String USER_ADDR1;
	private String USER_ADDR2;
	private String ENABLED;
	private List<AttachImageVO> imageList;
	private List<AuthVO> authList; 
	
	
	
	

}