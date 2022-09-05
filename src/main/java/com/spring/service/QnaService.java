package com.spring.service;

import java.util.List;

import com.spring.domain.QnaVO;

public interface QnaService {

	public void register(QnaVO board);
	
	public QnaVO get(Long qno);
	
	public boolean modify(QnaVO board);
	
	public boolean remove(Long qno);
	
	public List<QnaVO> getList();
	
	
	
	
	
}
