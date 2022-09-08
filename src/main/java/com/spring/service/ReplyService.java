package com.spring.service;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.ReplyPageDTO;
import com.spring.domain.ReplyVO;

public interface ReplyService {

	public int register(ReplyVO vo);
	public ReplyVO get(Long rno);
	public int modify(ReplyVO vo);
	public int remove(Long rno);
	
	public List<ReplyVO> getList(Criteria cri, Long qno);
	
	// Page434 상단 ReplyService 인터페이스에 getListPage() 추상 메서드 정의
	public ReplyPageDTO getListPage(Criteria cri, Long qno);
	
}
