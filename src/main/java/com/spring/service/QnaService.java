package com.spring.service;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.QnaVO;

public interface QnaService {

	public void register(QnaVO board);
	
	public QnaVO get(Long qno);
	
	public boolean modify(QnaVO board);
	
	public boolean remove(Long qno);
	
	//public List<QnaVO> getList();
	public List<QnaVO> getList(Criteria cri);
	
	
	public int getTotal(Criteria cri);
	
	
	
}
