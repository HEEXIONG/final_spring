package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.BoardAttachVO;
import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.mapper.BoardAttachMapper;
import com.spring.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service 
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	
	private BoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;
	
	
	@Transactional
	@Override
	public void register(BoardVO board) {
		log.info("register... 등록 기능 활성화~ ^-^/" + board);
		
		mapper.insertSelectKey(board);		
		
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}		
		board.getAttachList().forEach(attach -> {
			attach.setGr_bno(board.getGr_bno());
			attachMapper.insert(attach);
		});		
	}

	@Override
	public BoardVO get(Long gr_bno) {
		log.info("get... 특정 글 내용을 조회 합니다!" + gr_bno);
		return mapper.read(gr_bno);
	}
	
	
	
	@Transactional
	@Override
	public boolean modify(BoardVO board) {
		log.info("modify... 게시글을 수정 처리 합니다!" + board);
		
		attachMapper.deleteAll(board.getGr_bno());
		boolean modifyResult = mapper.update(board) == 1;
		if(modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0) {
			board.getAttachList().forEach(attach -> {
				attach.setGr_bno(board.getGr_bno());
				attachMapper.insert(attach);
			});
		}
		return mapper.update(board) == 1;
	}
	
	@Transactional
	@Override
	public boolean remove(Long gr_bno) {
		log.info("remove... 게시글을 삭제 처리 합니다!" + gr_bno);
		attachMapper.deleteAll(gr_bno);
		return mapper.delete(gr_bno) == 1;
	}
	
	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("getList with criteria : 페이징 기능 추가!" + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count : 전체 개수 카운트!");
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public List<BoardAttachVO> getAttachList(Long gr_bno) {
		log.info("get Attach list by gr_bno" + gr_bno);
		return attachMapper.findByBno(gr_bno);
	}
	
	

}



