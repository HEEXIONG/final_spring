package com.spring.mapper;

import com.spring.domain.AttachImageVO;
import com.spring.domain.UsersVO;

public interface UsersMapper {
	
	
	
	
	//회원가입
	public void userInsert(UsersVO uservo);
	//아이디 중복 검사
	public int idCheck(String USER_ID);
	//닉네임 중복 검사
	public int nickCheck(String USER_NICKNAME);
	//이미지 주소 저장
	public void imageInsert(AttachImageVO vo);
	
	
	

}