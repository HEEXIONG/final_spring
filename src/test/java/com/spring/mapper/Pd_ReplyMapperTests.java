package com.spring.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.Criteria;
import com.spring.domain.Pd_ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class Pd_ReplyMapperTests {

	// 테스트 전에 아래 번호의 게시물이 존재하는지 반드시 확인하시기 바랍니다.
	private Long[] pd_codeArr = {44L, 45L, 46L, 47L, 48L};	
	
	@Setter(onMethod_ = @Autowired)
	private Pd_ReplyMapper mapper;

	@Test // testMapper() 메서드를 통해 ReplyMapper 타입의 객체가 정상적으로 사용이 가능한지 확인합니다.
	public void testMapper() {
		log.info(mapper);
	}
	
	@Test
	public void testCreate() {
		// rangeClosed 메서드는 종료값을 포함해서 반환합니다.
		IntStream.rangeClosed(1, 10).forEach(i -> {
			Pd_ReplyVO vo = new Pd_ReplyVO();
			
			// 게시물의 번호
			vo.setPd_code(pd_codeArr[i%5]);
			vo.setReply("댓글 테스트 " + i);
			vo.setReplyer("replyer" + i);
			
			mapper.insert(vo);
		});
	}
	
	@Test
	public void testRead() {
		Long targetRno = 62L;  // 5번 댓글을 조회 확인함
		Pd_ReplyVO vo = mapper.read(targetRno);
		
		log.info(vo);
	}
	
	@Test
	public void testDelete() {
		Long targetRno = 63L;  // DB에서 rno 1번 삭제를 확인 바랍니다.
		mapper.delete(targetRno);
	}
	
	@Test
	public void testUpdate() {
		Long targetRno = 64L;  // rno 10번 reply 글을 수정 처리 합니다!
		Pd_ReplyVO vo = mapper.read(targetRno);
		vo.setReply("장나라 테스트 ");
		int count = mapper.update(vo);
		
		log.info("UPDATE COUNT : " + count);
	}
	
	// 테스트 코드에서는 현재 데이터베이스에 추가되어 있는 댓글들의 게시물 번호로 확인합니다.
	@Test
	public void testList() {
		Criteria cri = new Criteria();
		// bnoArr[0] = 위에 private Long[] bnoArr의 요소인 721003L을 확인합니다.
		List<Pd_ReplyVO> replies = mapper.getListWithPaging(cri, pd_codeArr[0]);
		replies.forEach(reply -> log.info(reply));
	}
	
	// Page 431 ReplyMapperTests 
	@Test
	public void testList2() {
		
		Criteria cri = new Criteria(2, 10);
		// 18L
		List<Pd_ReplyVO> replies = mapper.getListWithPaging(cri, 18L);
		replies.forEach(reply -> log.info(reply));
	}

}
