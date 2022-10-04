package com.spring.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.BoardAttachVO;
import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.domain.PageDTO;
import com.spring.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller 
@Log4j
@RequestMapping("/group/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	
	@GetMapping("/list")  // @GetMapping() GET 방식 URL 메핑
	public void list(Criteria cri, Model model) {
		log.info("list : " + cri);
		model.addAttribute("list", service.getList(cri));
		

		int total = service.getTotal(cri);
		log.info("total : 전체 카운트 개수 = " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping(value = "/getAttachList", produces = {			
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody 
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long gr_bno){
		log.info("getAttachList~!! " + gr_bno);
		return new ResponseEntity<>(service.getAttachList(gr_bno), HttpStatus.OK);
	}
	
	
	@PostMapping("/register") 
	public String register(BoardVO board, RedirectAttributes rttr) {
		
		log.info("==========================");
		log.info("register : ==> " + board);
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		
		log.info("==========================");
		
		
		service.register(board);
		rttr.addFlashAttribute("result", board.getGr_bno());
		
		return "redirect:/group/list";
	}
	
	@GetMapping({"/get", "/modify"})

	public void get(@RequestParam("gr_bno") Long gr_bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("board",service.get(gr_bno));
	}
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify: 수정 처리 " + board);
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}	
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/group/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("gr_bno") Long gr_bno, Criteria cri, RedirectAttributes rttr) {
		log.info("remove: 삭제 처리 " + gr_bno);
		
		List<BoardAttachVO> attachList = service.getAttachList(gr_bno);
		
		if (service.remove(gr_bno)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}	
		
		return "redirect:/group/list" + cri.getListLink();
	}
	
private void deleteFiles(List<BoardAttachVO> attachList) {
	    
	    if(attachList == null || attachList.size() == 0) {
	      return;
	    }
	    
	    log.info("delete attach files...................");
	    log.info(attachList);
	    
	    attachList.forEach(attach -> {
	      try {        
	        Path file  = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\" + attach.getUuid()+"_"+ attach.getFileName());
	        
	        Files.deleteIfExists(file);
	        
	        if(Files.probeContentType(file).startsWith("image")) {
	        
	          Path thumbNail = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\s_" + attach.getUuid()+"_"+ attach.getFileName());
	          
	          Files.delete(thumbNail);
	        }
	
	      }catch(Exception e) {
	        log.error("delete file error" + e.getMessage());
	      }//end catch
	    });//end foreachd
	  }
	
}



