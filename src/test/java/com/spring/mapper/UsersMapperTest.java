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
		vo.setUSER_ID("테스터22");
		vo.setUSER_PW("테스터22");
		vo.setUSER_NICKNAME("테스터22");
		vo.setUSER_PHONE("010-7897-45642");
		vo.setUSER_EMAIL("etetetet@wtete.com2");
		vo.setUSER_POST("테스터22");
		vo.setUSER_ADDR1("테스터22");
		vo.setUSER_ADDR2("테스터22");
		mapper.userInsert(vo);
		
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
