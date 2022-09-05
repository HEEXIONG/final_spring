package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.UsersVO;
import com.spring.service.UsersService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/users/*")
@Log4j
public class UsersController {
	
	@Autowired
	UsersService userserivce;
	
	//테스트 메인페이지
	@GetMapping("/testMain")
	public void testmain(){
		
	}
	
	
	
	//회원가입페이지(get)
	@GetMapping("/insert")
	public void insertget() {
		log.warn("warn");
		log.info("info");
	}
	//회원가입페이지(post)
	@PostMapping("/insert")
	public String insertpost(UsersVO uservo) {
		log.info("stp");
		userserivce.userInsert(uservo);
		log.warn("회원가입 완료");
		return "redirect:/";
	}
	//아이디중복확인
	@PostMapping("/userIdChk")
	@ResponseBody
	public String userIdChk(String userId) {
		//log.warn("useridchk 진입");
		int result = userserivce.idCheck(userId);
		if(result != 0) {
			return "fail";
		} else {
			return "success";
		}
	}//아이디 중복 확인 종료
	//닉네임 중복 확인
	@PostMapping("/usernickChk")
	@ResponseBody
	public String usernickChk(String usernick) {
		//log.warn("useridchk 진입");
		int result = userserivce.nickCheck(usernick);
		if(result != 0) {
			return "fail";
		} else {
			return "success";
		}
	}

}
