package com.spring.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	
	@Setter (onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(board -> log.info(board));
	}
	
	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setGr_title("다섯번째 새로 작성하는 글입니다!");
		board.setGr_content("다섯번째 새로 작성하는 내용입니다!");
		board.setGr_writer("장나라");
		
		mapper.insert(board);
		
		log.info(board);
	}
	
	@Test
	public void testInsertSelectKey() {
		BoardVO board = new BoardVO();
		board.setGr_title("select key~ 네번째 새로 작성하는 글입니다!");
		board.setGr_content("select key~ 네번째 새로 작성하는 내용입니다!");
		board.setGr_writer("김희선");
		
		mapper.insertSelectKey(board);
		
		log.info(board);
	}
	
	@Test
	public void testRead() {
		// 존재하는 게시물 번호로 테스트 확인 : 8번글 확인
		BoardVO board = mapper.read(8L);
		log.info(board);
	}	
	
	@Test
	public void testDelete() {
		// 존재하는 게시물 번호로 테스트 확인 : 9번글 삭제 처리
		log.info("DELETE COUNT : " + mapper.delete(9L));
	}	
	
	@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		// 실행 전에 존재하는 번호인지 확인 합니다. 즉, 5번글이 존재하는지 확인합니다.
		board.setGr_bno(5L);
		board.setGr_title("수정된 제목입니다!");
		board.setGr_content("수정된 내용입니다!");
		board.setGr_writer("김연아");
		
		int count = mapper.update(board);		
		log.info("UPDATE COUNT : " + count);
	}
	
	
	
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		// 10개씩 3페이지 보여주기
		cri.setPageNum(3);
		cri.setAmount(10);
		List<BoardVO> list = mapper.getListWithPaging(cri);
		list.forEach(board -> log.info(board));
	}
	
	
	// testSearch() 메서드는 Criteria 객체의 type과 keyword를 넣어서
	// 원하는 SQL이 생성되는지 확인하기 위해 만들어 줍니다.
	// 여기서 중요한 점은 실행 결과가 아니라 실행할때 만들어지는 SQL 입니다.
	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKeyword("");
		// Page337 검색 조건이 없는 경우 : 아래 cri.setType(""); 입력
		// JUnit 실행 - Console 확인
		// Page337 단일 검색(제목)일 경우 : 아래 cri.setType("T"); 입력
		// JUnit 실행 - Console 확인
		// Page338 다중 검색(제목 OR 내용)일 경우 : 아래 cri.setType("TC"); 입력
		// JUnit 실행 - Console 확인
		cri.setType("TC"); 
		
		List<BoardVO> list = mapper.getListWithPaging(cri);
		list.forEach(board -> log.info(board));
	}
}
