package com.spring.service;

import java.util.List;

import org.springframework.stereotype.Component;

import com.spring.domain.PdVo;

@Component
public interface PdService {
	
	// 전체 리스트 정보를 가져오는 getList() 추상 메소드 정의
		public List<PdVo> getList();
		
	// 특정게시물 정보
		public PdVo read(Long pd_code) throws Exception;
	
}
