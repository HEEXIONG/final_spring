package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.CartVO;
import com.spring.mapper.CartMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CartServiceImpl implements CartService{

	@Autowired
	private CartMapper mapper;
	
	@Override
	public List<CartVO> getList(int userNo) {
		return mapper.getList(userNo);
	}
	
	@Override
	public List<CartVO> getList2(CartVO vo){
		return mapper.getList2(vo);
	}
	
	@Override
	public int insert() {
		return mapper.insert();
	}
	
	@Override
	public int updateCart(CartVO vo) {
		return mapper.updateCart(vo);
	}
	
	@Override
	public int delete() {
		return mapper.delete();
	}
}
