package com.spring.service;

import java.util.List;

import com.spring.domain.BoardAttachVO;
import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;

public interface BoardService {

	public void register(BoardVO board);
	
	public BoardVO get(Long gr_bno);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long gr_bno);
	

	public List<BoardVO> getList(Criteria cri);
	
	
	public int getTotal(Criteria cri);	
	
	public List<BoardAttachVO> getAttachList(Long gr_bno);
	
}
