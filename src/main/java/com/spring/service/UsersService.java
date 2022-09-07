package com.spring.service;

import com.spring.domain.UsersVO;

public interface UsersService {
	//로그인
	public UsersVO userLogin(UsersVO vo);
	//회원 등록
	public void userInsert(UsersVO vo);
	
	
	
	
	
	//아이디 중복 검사
	public int idCheck(String USER_ID);
	//닉네임 중복 검사
	public int nickCheck(String USER_NICKNAME);

}
