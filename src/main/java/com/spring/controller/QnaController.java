package com.spring.controller;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.Criteria;
import com.spring.domain.PageDTO;
import com.spring.domain.QnaVO;
import com.spring.domain.ReplyVO;
import com.spring.service.QnaService;
import com.spring.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/qna/*")
@AllArgsConstructor
public class QnaController {

	private QnaService service;
	
	private ReplyService replyService;
	
//	@GetMapping("/list")
//	public void list(Model model) {
//		log.info("list");
//		model.addAttribute("list", service.getList());
//		System.out.println("리스트");
//	}
	
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("list" + cri);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, 50));
		
		int total = service.getTotal(cri);
		log.info("총 개수" + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String register(QnaVO board, RedirectAttributes rttr) {
		log.info("글 등록 : " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getQno());
		
		return "redirect:/qna/list";
		
	}
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/register")
	public void register() {
	}
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("qno") Long qno,@ModelAttribute("cri") Criteria cri ,Model model) {
		log.info("/get or modify");
		model.addAttribute("board", service.get(qno));
		
		List<ReplyVO> replyList = replyService.getList(cri, qno);
		model.addAttribute("replyList", replyList);
	}	
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/modify")
	public String modify(QnaVO board, @ModelAttribute("cri") Criteria cri ,RedirectAttributes rttr) {
		log.info("글 수정 : " + board);
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/qna/list";
		
	}
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/remove")
	public String remove(@RequestParam("qno") Long qno,@ModelAttribute("cri") Criteria cri ,RedirectAttributes rttr) {
		log.warn("삭제 매서드 입니다.");
		log.warn("글 삭제 :" + qno);
		if(service.remove(qno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
	
		return "redirect:/qna/list";
	}
	
}
