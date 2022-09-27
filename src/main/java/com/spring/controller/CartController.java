package com.spring.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.CartVO;
import com.spring.domain.Criteria;
import com.spring.domain.MypageVO;
import com.spring.domain.PageDTO;
import com.spring.service.CartService;
import com.spring.service.MypageService;
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
	
	private MypageService mypage_service;
	
	@GetMapping("/list")
	public String list(Model model,Principal principal) {
		try {
			String userId = principal.getName();
			
			List<MypageVO> mypageList = mypage_service.getList(userId);
			int userNo = mypageList.get(0).getUser_no();
			
			model.addAttribute("list", service.getList(userNo));
		}catch(NullPointerException e) {
			e.printStackTrace();
		}
		return "/cart/list";
	}
	
	@PostMapping("/list")
	@ResponseBody
	public List<CartVO> list(@ModelAttribute CartVO vo,Principal principal) {
		try {
			String userId = principal.getName();
			
			List<MypageVO> mypageList = mypage_service.getList(userId);
			int userNo = mypageList.get(0).getUser_no();
			
			vo.setUserNo(userNo);
		}catch(NullPointerException e) {
			e.printStackTrace();
		}
		return service.getList2(vo);
	}
	
	@PostMapping(value ="/insert",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public int insert() {
		System.out.println("insert in?");
		return 0;
	}
	
	@PostMapping(value ="/updateCart",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public int updateCart(@ModelAttribute CartVO vo) {
		System.out.println("update in?");
		System.out.println(vo);
		service.updateCart(vo);
		return 0;
	}
	
	@PostMapping(value ="/delete",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public int delete() {
		System.out.println("delete in?");
		return 0;
	}
}
// 이건 깃허브 테스트 입니다 아무 문제 없이 병합되는지 커밋 테스트 해봅니다~