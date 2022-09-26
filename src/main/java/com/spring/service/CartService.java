package com.spring.service;

import java.util.List;

import com.spring.domain.CartVO;

public interface CartService {

	public List<CartVO> getList();
	
	public int insert();
	
	public int update();
	
	public int delete();
}
