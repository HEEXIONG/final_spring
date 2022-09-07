package com.spring.domain;

import lombok.Data;

@Data
public class AttachImageVO {
	//파일 저장 경로
	private String uploadPath;
	//uuid
	private String uuid;
	//파일 이름
	private String fileName;
	//유저 번호
	private Long USER_NO;
}
	
