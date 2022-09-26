package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.Criteria;
import com.spring.domain.Gr_ReplyVO;
import com.spring.domain.Pd_ReplyVO;

public interface Gr_ReplyMapper {

	public int insert(Gr_ReplyVO vo);
	
	public Gr_ReplyVO read(Long rno);
	
	public int delete(Long rno);  
	
	public int update(Gr_ReplyVO reply);
	
	public List<Gr_ReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("gr_bno") Long gr_bno);
	
	public int getCountByBno(Long gr_bno);
	
	
	
}
