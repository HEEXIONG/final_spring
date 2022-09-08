package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.Criteria;
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
		log.info("글 조회" + qno);
		return mapper.read(qno);
	}

	@Override
	public boolean modify(QnaVO board) {
		log.info("수정~~~" + board);
		return mapper.update(board)==1;
	}

	@Override
	public boolean remove(Long qno) {
		log.info("삭제"+qno);
		return mapper.delete(qno)==1;
	}


//	@Override
//	public List<QnaVO> getList() {
//		log.info("리스트!!!!");
//		return mapper.getList();
//	}

	@Override
	public List<QnaVO> getList(Criteria cri) {
		log.info("페이징~~~ : " + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("전체 갯수");
		
		return mapper.getTotalCount(cri);
	}
	
	
}
