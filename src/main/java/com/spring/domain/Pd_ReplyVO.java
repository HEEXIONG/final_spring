package com.spring.domain;

import java.util.Date;

import lombok.Data;

// Ajax 댓글 처리 기능 구현
// REST 방식을 가장 많이 사용하는 형태는 웹브라우저나 모바일 App 등에서 Ajax를 이용해서
// 호출하는 것입니다. 우리는 Ajax의 호출을 가정하고 웹페이지에서 사용하는 댓글 기능을 구현해 봅니다.
// 데이터베이스 상에서 댓글은 전형적인 1:N의 관계로 구성합니다. 하나의 게시물에 여러 개의 댓글을
// 추가하는 형태로 구성하고, 화면은 조회 화면상에서 별도의 화면 이동 없이 처리하기 때문에
// Ajax를 이용해서 호출합니다.
@Data
public class Pd_ReplyVO {

	private Long rno;
	private Long pd_code;
	
	private String reply;
	private String replyer;
	private Date replyDate;
	private Date updateDate;
}
