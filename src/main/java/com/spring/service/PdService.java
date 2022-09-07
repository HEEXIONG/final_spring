package com.spring.service;

import java.util.List;

import com.spring.domain.PdVo;

public interface PdService {
	
	// 특정한 게시물 정보를 가져오는 get() 추상 메소드 정의
		public PdVo get(Long pd_code);
	
	// 전체 리스트 정보를 가져오는 getList() 추상 메소드 정의
		public List<PdVo> getList();
	
}
