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

	
	
	
	
	@Override
	public int idCheck(String USER_ID) {
		return mapper.idCheck(USER_ID);
	}

	@Override
	public int nickCheck(String USER_NICKNAME) {
		return mapper.nickCheck(USER_NICKNAME);
	}

}
