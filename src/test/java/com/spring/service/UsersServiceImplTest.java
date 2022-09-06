package com.spring.service;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.AttachImageVO;
import com.spring.domain.UsersVO;
import com.spring.mapper.UsersMapperTest;

import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UsersServiceImplTest {
	
	@Autowired
	private UsersService service;

	@Test
	public void userimagetest() {
		UsersVO vo = new UsersVO();
		vo.setUSER_ID("테스터33");
		vo.setUSER_PW("테스터33");
		vo.setUSER_NICKNAME("테스터33");
		vo.setUSER_PHONE("010-7897-435642");
		vo.setUSER_EMAIL("etetetet@wt3ete.com2");
		vo.setUSER_POST("테스터33");
		vo.setUSER_ADDR1("테스터33");
		vo.setUSER_ADDR2("테스터33");
		
		List<AttachImageVO> imageList = new ArrayList<AttachImageVO>();
		AttachImageVO image1 = new AttachImageVO();
		AttachImageVO image2 = new AttachImageVO();
		image1.setFileName("test1");
		image1.setUploadPath("test1");
		image1.setUuid("test1");
		
		image2.setFileName("test2");
		image2.setUploadPath("test2");
		image2.setUuid("test2");
		
		vo.setImageList(imageList);
		
		service.userInsert(vo);
		
		log.info("vo: "+vo);
		
	}

}
