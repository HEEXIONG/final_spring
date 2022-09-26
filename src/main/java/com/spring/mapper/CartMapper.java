package com.spring.mapper;

import java.util.List;

import com.spring.domain.CartVO;

public interface CartMapper {

	public List<CartVO> getList();
	
	public int insert();
	
	public int update();
	
	public int delete();
}
