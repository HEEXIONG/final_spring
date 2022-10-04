package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.FileVO;
import com.spring.domain.PdVo;
import com.spring.service.FileService;
import com.spring.service.PdService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller // @Controller어노테이션을 추가해서 스프링의 빈으로 인식할 수 있게 처리함
@RequestMapping("/pdregist")
@AllArgsConstructor
public class PdController {
	
	@Autowired
	private PdService pdservice;
	
	/*
	 * // 게시글 상세내용 불러오기
	 * @RequestMapping("/read") public void read(Model model) throws Exception {
	 * log.info("pd 게시판 상세보기"); model.addAttribute("read", pdservice.read()); //
	 * model에 데이터 값을 담는다 }
	 */
    
    @GetMapping("/detail")
    public void GetPageGET(Long pd_code, Model model,FileVO filevo) throws Exception {
    	model.addAttribute("read", pdservice.read(pd_code));
    }
	
   @RequestMapping("/main")
   public void ListGET(Model model, PdVo pdboard,FileVO filevo) {
	   List<PdVo> pdlist = pdservice.getList();
        model.addAttribute("list", pdservice.getList());
    }

}
