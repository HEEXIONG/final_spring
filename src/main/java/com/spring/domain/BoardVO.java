package com.spring.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {

	private Long gr_bno;
	private String gr_title;
	private String gr_content; 
	private String gr_writer;
	private Date regdate;
	private Date updateDate;
	
	// page481 댓글의 숫자를 의미하는 인스턴스 변수 한개 추가
	private int replyCnt;
	
	private List<BoardAttachVO> attachList;
	
}
