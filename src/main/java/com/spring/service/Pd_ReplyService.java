package com.spring.service;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.Pd_ReplyPageDTO;
import com.spring.domain.Pd_ReplyVO;

public interface Pd_ReplyService {

	public int register(Pd_ReplyVO vo);
	public Pd_ReplyVO get(Long rno);
	public int modify(Pd_ReplyVO vo);
	public int remove(Long rno);
	public List<Pd_ReplyVO> getList(Criteria cri, Long pd_code);
	
	// Page434 상단 ReplyService 인터페이스에 getListPage() 추상 메서드 정의
	public Pd_ReplyPageDTO getListPage(Criteria cri, Long pd_code);
	
}
