package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.spring.domain.PdVo;
import com.spring.mapper.PdMapper;

import lombok.AllArgsConstructor;

@Service // 계층 구조상 주로 비즈니스 영역을 담당하는 객체임을 표시하기 위해 사용함
@AllArgsConstructor
@Repository
public class PdServiceImpl implements PdService {

	@Autowired
	private PdMapper pdmapper;
	
		// 특정 글 조회 작업의 기능 구현
		@Override
		public PdVo read(Long pd_code) {
			return pdmapper.read(pd_code);
		}
		
		// 목록(리스트) 작업의 기능 구현
		@Override
		public List<PdVo> getList() {
			return pdmapper.getList();
		}
		
}
