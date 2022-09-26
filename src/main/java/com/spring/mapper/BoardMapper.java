package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;

public interface BoardMapper {

	
	public List<BoardVO> getList();
	
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long gr_bno);
	
	public int delete(Long gr_bno);
	
	public int update(BoardVO board);
	
	public int getTotalCount(Criteria cri);
	
	
	
	public void updateReplyCnt(@Param("gr_bno") Long bno, @Param("amount") int amount);
	
}




