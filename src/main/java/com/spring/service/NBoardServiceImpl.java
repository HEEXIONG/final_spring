package com.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.domain.Criteria;
import com.spring.domain.NBoardVO;
import com.spring.mapper.NBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class NBoardServiceImpl implements NBoardService {
	
	private NBoardMapper mapper;

	@Override
	public NBoardVO get(Long nbno) {
		log.info("get... 특정 글 내용을 조회 합니다!" + nbno);
		return mapper.read(nbno);
	}

	@Override
	public List<NBoardVO> getList(Criteria cri) {
		log.info("getList with criteria : 페이징 기능 추가!" + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count : 전체 개수 카운트!");
		return mapper.getTotalCount(cri);
	}
}
