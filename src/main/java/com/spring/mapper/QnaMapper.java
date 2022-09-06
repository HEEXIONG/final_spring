package com.spring.mapper;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.QnaVO;

public interface QnaMapper {

	//@Select("select * from qna_board where qno > 0")
	public List<QnaVO> getList();
	
	public void insert(QnaVO board);
	public void insertSelectKey(QnaVO board);
	
	public QnaVO read(Long qno);
	
	public int delete(Long qno);
	
	public int update(QnaVO board);
	
	
	//페이징
	public List<QnaVO> getListWithPaging(Criteria cri);
	
	//전체개수
	public int getTotalCount(Criteria cri);
	
	
	
}
