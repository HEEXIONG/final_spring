package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.Criteria;
import com.spring.domain.Pd_ReplyPageDTO;
import com.spring.domain.Pd_ReplyVO;
import com.spring.mapper.PdMapper;
import com.spring.mapper.Pd_ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class Pd_ReplyServiceImpl implements Pd_ReplyService {
   
    @Setter(onMethod_ = @Autowired)
   private Pd_ReplyMapper mapper;
    
    // Page485 다음 2줄 소스 추가 코딩
    @Setter(onMethod_ = @Autowired)
    private PdMapper boardMapper;

    // Page485 ReplyServiceImpl의 댓글 등록과 삭제를 담당하는 메서드는
    // @Transactional의 처리를 해줍니다.
   @Transactional
   @Override
   public int register(Pd_ReplyVO vo) {
      log.info("register.... register 처리!" + vo);
      // Page485 다음 1줄 소스 추가 코딩
      boardMapper.updateReplyCnt(vo.getPd_code(), 1);
      
      
      return mapper.insert(vo);
   }

   @Override
   public Pd_ReplyVO get(Long rno) {
      log.info("get.... get 처리!" + rno);
      return mapper.read(rno);
   }

   @Override
   public int modify(Pd_ReplyVO vo) {
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
      Pd_ReplyVO vo = mapper.read(rno); 
      boardMapper.updateReplyCnt(vo.getPd_code(), -1);
      
      return mapper.delete(rno);
   }

   @Override
   public List<Pd_ReplyVO> getList(Criteria cri, Long pd_code) {
      log.info("get Reply List of a Board~! " + pd_code);
      return mapper.getListWithPaging(cri, pd_code);
   }

   @Override
   public Pd_ReplyPageDTO getListPage(Criteria cri, Long pd_code) {
      return new Pd_ReplyPageDTO(mapper.getCountByBno(pd_code), mapper.getListWithPaging(cri, pd_code));
   }
   
}