package com.spring.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/test/*")
@Controller
public class TestController {

	@GetMapping("/all")
	public void doAll() {
		log.info("all can access everybody");
	}
	
	@GetMapping("/member")
	public void doMember() {
		log.info("member login");
	}
	
	@PreAuthorize("hasAnyRole('ROLE_USER')")
	@GetMapping("annoMember")
	public void membertest() {
		log.info("어노테이션 테스트......");
	}
}
