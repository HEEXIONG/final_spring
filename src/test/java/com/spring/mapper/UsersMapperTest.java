package com.spring.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.AttachImageVO;
import com.spring.domain.UsersVO;

import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UsersMapperTest {
	
	@Autowired
	private UsersMapper mapper;
	@Autowired
	private LoginMapper Lmapper;
	

	@Test
	public void inserttest() {
		UsersVO vo = new UsersVO();
		for(int i = 50; i<100 ; i++) {
			
		vo.setUSER_ID("sdfsdfsdfsdfsdfsdf");
		vo.setUSER_PW("tester"+i);
		vo.setUSER_NICKNAME("tester"+i);
		vo.setUSER_PHONE("tester"+i);
		vo.setUSER_EMAIL("tester"+i);
		vo.setUSER_POST("tester"+i);
		vo.setUSER_ADDR1("tester"+i);
		vo.setUSER_ADDR2("tester"+i);
		mapper.userInsert(vo);
		}
		
	}
	@Test
	public void idchk() {
		/*
		 * String id = "테스트4"; String id2 = "하이하이";
		 * 
		 * mapper.idCheck(id); mapper.idCheck(id2);
		 */
		UsersVO vo = Lmapper.read("test2");
		log.info(vo);
	}
	@Test
	public void imagetest() {
		AttachImageVO vo = new AttachImageVO();
		
		vo.setUSER_NO(27L);
		vo.setFileName("test1");
		vo.setUploadPath("test1");
		vo.setUuid("test1");
		mapper.imageInsert(vo);
	}
	
	

}
