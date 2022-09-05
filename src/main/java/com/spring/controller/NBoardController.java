package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.domain.Criteria;
import com.spring.domain.PageDTO;
import com.spring.service.NBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class NBoardController {
	
	private NBoardService nservice;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.warn("리스트 진입");
		model.addAttribute("list", nservice.getList(cri));
		int total = nservice.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("nbno") Long nbno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("board", nservice.get(nbno));
	}
}
