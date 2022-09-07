package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.service.PdService;

import lombok.AllArgsConstructor;

@Controller // @Controller어노테이션을 추가해서 스프링의 빈으로 인식할 수 있게 처리함
@RequestMapping("/pdregist")
@AllArgsConstructor
public class PdController {
	
	private PdService pdservice;
	
	@RequestMapping("/read") // @GetMapping() GET 방식 URL 매핑
	public String list(@RequestParam Long pd_code,Model model) {
		model.addAttribute("pd_code", pdservice.getList());
		
		return "pdregist/read";
	}
	
	@RequestMapping("/list")
	public String get(@RequestParam("pd_code") Long pd_code, Model model) {
		model.addAttribute("PdVo", pdservice.get(pd_code));
		
		return "pdregist/list";
	}

}
