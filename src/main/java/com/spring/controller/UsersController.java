package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
		log.warn("회원가입 페이지");
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
	
	@PostMapping("/uploadAjaxAction")
	//MultipartFile은 뷰에서 전송한 multipart 타입의 파일을 다룰 수 있게 해줌.
	//파일 이름 , 사이즈 반환 ,파일을 특정경로에  저장할 수 있게 해줌.
	//uploadFile은 view단의 formdata key값이랑 맞춰줌
	//[]유무 : 파일 여러개 받을지
	public void imageuploadAjax(MultipartFile[] uploadFile) {
		//파일 저장 위치 설정
		String uploadFolder = "C:\\";
		for (MultipartFile multipartFile : uploadFile) {
		log.warn("파일 이름" + multipartFile.getOriginalFilename());
		log.warn("파일 타입" + multipartFile.getContentType());
		log.warn("파일 이름" + multipartFile.getSize());
		}
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
