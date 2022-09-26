package com.spring.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

// ReplyService 인터페이스와 ReplyServiceImpl 클래스에는
// ReplyPageDTO를 반환하는 메서드를 추가합니다.
@Data
// ReplyPageDTO 객체 생성 시 @AllArgsConstructor를 이용해서
// replyCnt와 list를 생성자의 파라미터로 처리합니다.
@AllArgsConstructor  
@Getter
public class Pd_ReplyPageDTO {

	private int replyCnt;    // 댓글 수 필드 정의
	private List<Pd_ReplyVO> list;  // 댓글 목록 정보 필드 정의
	
}
