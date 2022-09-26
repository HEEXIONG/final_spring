package com.spring.domain;

import lombok.Data;

// Page516 첨부파일의 정보들을 저장하는 AttachFileDTO 클래스를 작성합니다.
// AttachFileDTO 클래스는 다음의 4가지 필드 정보들을 하나로 묶어서 전달하는 용도로 사용합니다.
@Data
public class AttachFileDTO {

	private String fileName;   // 원본 파일의 이름(fileName) 필드 정의
	private String uploadPath; // 업로드 경로(uploadPath) 필드 정의	
	private String uuid;       // UUID값(uuid) 필드 정의
	private boolean image;     // 이미지 여부(image) 필드 정의
	
}
