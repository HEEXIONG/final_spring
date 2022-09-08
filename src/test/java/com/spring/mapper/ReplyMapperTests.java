package com.spring.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.Criteria;
import com.spring.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	// 테스트 전에 아래 번호의 게시물이 존재하는지 반드시 확인하시기 바랍니다.
	private Long[] bnoArr = {67L, 68L, 69L, 70L, 71L};	
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;

	@Test // testMapper() 메서드를 통해 ReplyMapper 타입의 객체가 정상적으로 사용이 가능한지 확인합니다.
	public void testMapper() {
		log.info(mapper);
	}
	
	@Test
	public void testCreate() {
		// rangeClosed 메서드는 종료값을 포함해서 반환합니다.
		IntStream.rangeClosed(1, 10).forEach(i -> {
			ReplyVO vo = new ReplyVO();
			
			// 게시물의 번호
			vo.setQno(bnoArr[i%5]);
			vo.setReply("댓글 테스트 " + i);
			vo.setReplyer("replyer" + i);
			
			mapper.insert(vo);
		});
	}
	
	@Test
	public void testRead() {
		Long targetRno = 12L;  // 5번 댓글을 조회 확인함
		ReplyVO vo = mapper.read(targetRno);
		
		log.info(vo);
	}
	
	@Test
	public void testDelete() {
		Long targetRno = 12L;  // DB에서 rno 1번 삭제를 확인 바랍니다.
		mapper.delete(targetRno);
	}
	
	@Test
	public void testUpdate() {
		Long targetRno = 13L;  // rno 10번 reply 글을 수정 처리 합니다!
		ReplyVO vo = mapper.read(targetRno);
		vo.setReply("Update Reply 댓글 수정 입력 ");
		int count = mapper.update(vo);
		
		log.info("UPDATE COUNT : " + count);
	}
	
	// 테스트 코드에서는 현재 데이터베이스에 추가되어 있는 댓글들의 게시물 번호로 확인합니다.
	@Test
	public void testList() {
		Criteria cri = new Criteria();
		// bnoArr[0] = 위에 private Long[] bnoArr의 요소인 721003L을 확인합니다.
		List<ReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[0]);
		replies.forEach(reply -> log.info(reply));
	}
	
	// Page 431 ReplyMapperTests JUnit 실행 확인 : 2페이지에 해당하는 게시물인지 확인
	@Test
	public void testList2() {
		
		Criteria cri = new Criteria(1, 10);
		// 721003L
		List<ReplyVO> replies = mapper.getListWithPaging(cri, 67L);
		replies.forEach(reply -> log.info(reply));
	}

}
