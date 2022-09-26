package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.Criteria;
import com.spring.domain.Gr_ReplyPageDTO;
import com.spring.domain.Gr_ReplyVO;
import com.spring.domain.Pd_ReplyPageDTO;
import com.spring.domain.Pd_ReplyVO;
import com.spring.mapper.BoardMapper;
import com.spring.mapper.Gr_ReplyMapper;
import com.spring.mapper.PdMapper;
import com.spring.mapper.Pd_ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class Gr_ReplyServiceImpl implements Gr_ReplyService {
   
    @Setter(onMethod_ = @Autowired)
   private Gr_ReplyMapper mapper;
    
    // Page485 다음 2줄 소스 추가 코딩
    @Setter(onMethod_ = @Autowired)
    private BoardMapper boardMapper;

    // Page485 ReplyServiceImpl의 댓글 등록과 삭제를 담당하는 메서드는
    // @Transactional의 처리를 해줍니다.
   @Transactional
   @Override
   public int register(Gr_ReplyVO vo) {
      log.info("register.... register 처리!" + vo);
      // Page485 다음 1줄 소스 추가 코딩
      boardMapper.updateReplyCnt(vo.getGr_bno(), 1);
      
      
      return mapper.insert(vo);
   }

   @Override
   public Gr_ReplyVO get(Long rno) {
      log.info("get.... get 처리!" + rno);
      return mapper.read(rno);
   }

   @Override
   public int modify(Gr_ReplyVO vo) {
      log.info("modify.... modify 처리!" + vo);
      return mapper.update(vo);
   }
   
   // Page485 ReplyServiceImpl의 댓글 등록과 삭제를 담당하는 메서드는
    // @Transactional의 처리를 해줍니다.
   @Transactional
   @Override
   public int remove(Long rno) {
      log.info("remove.... remove 처리!" + rno);
      
      // Page485 다음 2줄 소스 추가 코딩
      Gr_ReplyVO vo = mapper.read(rno); 
      boardMapper.updateReplyCnt(vo.getGr_bno(), -1);
      
      return mapper.delete(rno);
   }

   @Override
   public List<Gr_ReplyVO> getList(Criteria cri, Long gr_bno) {
      log.info("get Reply List of a Board~! " + gr_bno);
      return mapper.getListWithPaging(cri, gr_bno);
   }

   @Override
   public Gr_ReplyPageDTO getListPage(Criteria cri, Long gr_bno) {
      return new Gr_ReplyPageDTO(mapper.getCountByBno(gr_bno), mapper.getListWithPaging(cri, gr_bno));
   }
   
}