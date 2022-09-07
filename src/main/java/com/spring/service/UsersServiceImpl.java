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
	public UsersVO userLogin(UsersVO vo) {
		return mapper.userLogin(vo);
	}

	@Override
	public void userInsert(UsersVO vo) {
		mapper.userInsert(vo);
		if(vo.getImageList() != null) {
		vo.getImageList().forEach(attach ->{
			attach.setUSER_NO(vo.getUSER_NO());
			mapper.imageInsert(attach);
		});
		}else{
		}
		
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
