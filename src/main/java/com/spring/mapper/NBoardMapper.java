package com.spring.mapper;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.NBoardVO;

public interface NBoardMapper {
	public List<NBoardVO> getList();
	public List<NBoardVO> getListWithPaging(Criteria cri);
	public NBoardVO read(Long nbno);
	public int getTotalCount(Criteria cri);
}
