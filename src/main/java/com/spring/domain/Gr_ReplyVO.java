package com.spring.domain;

import java.util.Date;

import lombok.Data;


@Data
public class Gr_ReplyVO {

	private Long rno;
	private Long gr_bno;
	
	private String reply;
	private String replyer;
	private Date replyDate;
	private Date updateDate;
}
