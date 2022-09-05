package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.UsersVO;
import com.spring.mapper.UsersMapper;
@Service
public class UsersServiceImpl implements UsersService {
	
	@Autowired
	UsersMapper mapper;
	

	@Override
	public void userInsert(UsersVO vo) {
		mapper.userInsert(vo);
		
	}

}
