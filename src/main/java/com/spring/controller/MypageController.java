package com.spring.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.MypageVO;
import com.spring.service.MypageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage")
@AllArgsConstructor
public class MypageController {

	private MypageService service;
	
	@GetMapping("/list")
	public String list(Model model,Principal principal) {
		try {
			String userId = principal.getName();
			
			//조회하는 쿼리문
			List<MypageVO> list = service.getList(userId);
			System.out.println(list);
			model.addAttribute("list", list);
			model.addAttribute("userId", userId);
			model.addAttribute("user_no", list.get(0).getUser_no());
			
		}catch(NullPointerException e) {
			e.printStackTrace();
		}
		return "/mypage/list";
	}
	
	@PostMapping("/list")
	@ResponseBody
	public List<MypageVO> list(@ModelAttribute MypageVO vo) {
		System.out.println("list");
		System.out.println(vo);
		return service.getList2(vo);
	}
	
	@PostMapping("/list2")
	@ResponseBody
	public List<MypageVO> list3(@ModelAttribute MypageVO vo) {
		System.out.println("list");
		System.out.println(vo);
		return service.getList3(vo);
	}
		
	
	@PostMapping(value ="/insert")
	@ResponseBody
	public int insert(@ModelAttribute MypageVO vo) {
		System.out.println("insert in?");
		System.out.println(vo);
		int result = service.insert(vo);
		return result;
	}
	
	@PostMapping(value ="/update",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public int update(@ModelAttribute MypageVO vo,Principal principal) {
		String userId = principal.getName();
		vo.setUserId(userId);
		System.out.println("update in?");
		System.out.println(vo);
//		int result = service.update(vo);
		
//		int aResult = service.auth_update(vo);
//		System.out.println(aResult);
		service.update(vo);
		
		return 0;
	}
	
	@PostMapping(value ="/delete",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public int delete() {
		System.out.println("delete in?");
		return 0;
	}
}
