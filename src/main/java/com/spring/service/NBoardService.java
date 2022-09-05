package com.spring.service;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.NBoardVO;

public interface NBoardService {
	public NBoardVO get(Long nbno);
	public List<NBoardVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
}
