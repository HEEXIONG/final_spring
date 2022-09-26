package com.spring.service;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.Gr_ReplyPageDTO;
import com.spring.domain.Gr_ReplyVO;

public interface Gr_ReplyService {

	public int register(Gr_ReplyVO vo);
	public Gr_ReplyVO get(Long rno);
	public int modify(Gr_ReplyVO vo);
	public int remove(Long rno);
	public List<Gr_ReplyVO> getList(Criteria cri, Long gr_bno);
	
	// Page434 상단 ReplyService 인터페이스에 getListPage() 추상 메서드 정의
	public Gr_ReplyPageDTO getListPage(Criteria cri, Long gr_bno);
	
}
