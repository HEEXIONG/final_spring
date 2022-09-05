package spring.project.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.QnaVO;
import com.spring.mapper.QnaMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class QnaMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private QnaMapper mapper;

	@Test
	public void Mappertest() {
		mapper.getList().forEach(board -> log.info(board));
	}
	
	@Test
	public void testInsert() {
		QnaVO board = new QnaVO();
		board.setQ_title("테스트 제목222");
		board.setQ_content("테스트 내용33");
		board.setQ_writer("테스트 작성자44");
		mapper.insert(board);
		log.info(board);
	}
	@Test
	public void testRead() {
		QnaVO board = mapper.read(6L);
		log.info(board);
	}
	
	@Test
	public void testDelete() {
		log.info("Delete count : " + mapper.delete(6L));
		
	}
	
	@Test
	public void testUpdate() {
		QnaVO board = new QnaVO();
		board.setQno(9L);
		board.setQ_title("수정 제목");
		board.setQ_content("수정 내용");
		board.setQ_writer("수정 작성자");
		
		int count = mapper.update(board);
		log.info("update : " + count);
		
	}
	
	

}
