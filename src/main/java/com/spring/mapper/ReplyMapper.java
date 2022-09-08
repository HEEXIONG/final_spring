package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.Criteria;
import com.spring.domain.ReplyVO;


public interface ReplyMapper {
	
	
		public int insert(ReplyVO vo);
		
		public ReplyVO read(Long rno);
		
		public int delete(Long rno);  // rno = 댓글의 번호
		
		public int update(ReplyVO reply);
		
		public List<ReplyVO> getListWithPaging(
				@Param("cri") Criteria cri,
				@Param("qno") Long qno);

		public int getCountByBno(Long qno);
		

}
