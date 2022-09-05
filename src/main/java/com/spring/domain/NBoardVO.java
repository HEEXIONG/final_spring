package com.spring.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NBoardVO {
	private Long nbno;
	private String ntitle;
	private String ncontent;
	private String nwriter;
	private Date nregdate;
	private Date nupdatedate;
}
