package com.spring.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {

	private Long qno;
	private String q_title;
	private String q_content;
	private String q_writer;
	private Date regdate;
	private Date updatedate;
	
	
}
