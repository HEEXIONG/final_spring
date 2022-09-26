package com.spring.service;

import java.util.List;

import com.spring.domain.MypageVO;

public interface MypageService {

	public List<MypageVO> getList(String userId);
	public List<MypageVO> mypageIdChk(String userId);
	public List<MypageVO> getUserNo(String userId);
	
	
	public List<MypageVO> getList2(MypageVO vo);
	public List<MypageVO> getList3(MypageVO vo);
	public int merge(String userId);
	
	public int insert(MypageVO vo);
	
	public int update(MypageVO vo);
	
	public int user_update(MypageVO vo);
	public int auth_update(MypageVO vo);
	
	public int delete();
}
