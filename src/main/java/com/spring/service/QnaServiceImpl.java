package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.QnaVO;
import com.spring.mapper.QnaMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class QnaServiceImpl implements QnaService{

	@Setter(onMethod_ = @Autowired)
	private QnaMapper mapper;
	
	
	@Override
	public void register(QnaVO board) {

		log.info("글 등록 : " + board);
		mapper.insert(board);
	}

	@Override
	public QnaVO get(Long qno) {

		return null;
	}

	@Override
	public boolean modify(QnaVO board) {

		return false;
	}

	@Override
	public boolean remove(Long qno) {

		return false;
	}

	@Override
	public List<QnaVO> getList() {

		return null;
	}

}
