package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.MypageVO;
import com.spring.mapper.MypageMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MypageServiceImpl implements MypageService{

	@Setter(onMethod_ = @Autowired)
	private MypageMapper mapper;
	
	@Override
	public List<MypageVO> getList(String userId) {
		return mapper.getList(userId);
	}
	@Override
	public List<MypageVO> getList2(MypageVO vo){
		return mapper.getList2(vo);
	}
	@Override
	public List<MypageVO> getList3(MypageVO vo){
		return mapper.getList3(vo);
	}
	@Override
	public List<MypageVO> mypageIdChk(String userId){
		return mapper.mypageIdChk(userId);
	}
	
	@Override
	public List<MypageVO> getUserNo(String userId){
		return mapper.getUserNo(userId);
	}
	
	@Override
	public int merge(String userId){
		return mapper.merge(userId);
	}
	
	@Override
	public int insert(MypageVO vo) {
		return mapper.insert(vo);
	}
	
	@Override
	public int update(MypageVO vo) {
		return mapper.update(vo);
	}
	
	@Override
	public int user_update(MypageVO vo) {
		return mapper.user_update(vo);
	}
	
	@Override
	public int auth_update(MypageVO vo) {
		return mapper.auth_update(vo);
	}
	
	@Override
	public int delete() {
		return mapper.delete();
	}
}
