package com.spring.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.Criteria;
import com.spring.domain.PageDTO;
import com.spring.service.CartService;
import com.spring.service.QnaService;
import com.spring.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/cart")
@AllArgsConstructor
public class CartController {

	private CartService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list", service.getList());
	}
	
	@PostMapping(value ="/insert",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public int insert() {
		System.out.println("insert in?");
		return 0;
	}
	
	@PostMapping(value ="/update",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public int update() {
		System.out.println("update in?");
		return 0;
	}
	
	@PostMapping(value ="/delete",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public int delete() {
		System.out.println("delete in?");
		return 0;
	}
}
// 이건 깃허브 테스트 입니다 아무 문제 없이 병합되는지 커밋 테스트 해봅니다~