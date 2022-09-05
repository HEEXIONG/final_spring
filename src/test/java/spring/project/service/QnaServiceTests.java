package spring.project.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.QnaVO;
import com.spring.service.QnaService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class QnaServiceTests {

	@Setter(onMethod_ = @Autowired)
	private QnaService service;
	
	
	@Test
	public void test() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		QnaVO board = new QnaVO();
		board.setQ_title("새로 작성하는 글");
		board.setQ_content("새로 작성하는 내용");
		board.setQ_writer("유저 테스트");
		service.register(board);
		
		log.info("생성된 게시물의 번호" + board.getQno());
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
