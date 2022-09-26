package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.CartVO;
import com.spring.domain.Criteria;
import com.spring.domain.QnaVO;
import com.spring.mapper.CartMapper;
import com.spring.mapper.QnaMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CartServiceImpl implements CartService{

	@Setter(onMethod_ = @Autowired)
	private CartMapper mapper;
	
	@Override
	public List<CartVO> getList() {
		return mapper.getList();
	}
	
	@Override
	public int insert() {
		return mapper.insert();
	}
	
	@Override
	public int update() {
		return mapper.update();
	}
	
	@Override
	public int delete() {
		return mapper.delete();
	}
}
