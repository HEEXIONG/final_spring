package com.spring.domain;

import lombok.Data;

@Data
public class BoardAttachVO {

	// Page551 첨부파일의 보관은 UUID가 포함된 이름을 PK로 하는 uuid 칼럼 정의
	private String uuid;
	// 실제 파일이 업로드된 경로를 의미하는 uploadPath를 정의합니다.
	private String uploadPath;
	// 파일 이름을 의미하는 fileName을 정의합니다.
	private String fileName;
	// 이미지 파일 여부를 판단할 수 있는 fileType을 정의합니다.
	private boolean fileType;
	// 해당 게시물 번호를 저장하는 bno 칼럼을 정의합니다.
	private Long gr_bno;
	
}
