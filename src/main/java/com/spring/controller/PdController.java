package com.spring.controller;

import java.io.File;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.FileVO;
import com.spring.domain.PdVo;
import com.spring.service.FileService;
import com.spring.service.PdService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller // @Controller어노테이션을 추가해서 스프링의 빈으로 인식할 수 있게 처리함
@RequestMapping("/pdregist")
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
   
   @GetMapping("/display")
   public ResponseEntity<byte[]> getFile(String fileName){

       ResponseEntity<byte[]> result = null;

       try{
           String srcFileName = URLDecoder.decode(fileName,"UTF-8");
           File file = new File("C:\\Users\\hi-guro\\git\\Final_Boot2\\src\\main\\resources\\static\\Upload" + fileName);
           HttpHeaders header = new HttpHeaders();

           //MIME 타입 처리
           header.add("Content-Type", Files.probeContentType(file.toPath()));
           //File객체를 Path로 변환하여 MIME 타입을 판단하여 HTTPHeaders의 Content-Type에  값으로 들어갑니다.

           //파일 데이터 처리 *FileCopyUtils.copy 아래에 정리
           //new ResponseEntity(body,header,status)
           result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
           
       }catch (Exception e){
           return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
       }
       return result;
   }
   
   
   @GetMapping("/displayy")
   @ResponseBody
   public ResponseEntity<byte[]> getFilee(String fileName) {
      File file = new File("C:\\Users\\hi-guro\\git\\Final_Boot2\\src\\main\\resources\\static\\Upload" + fileName);
      ResponseEntity<byte[]> result = null;
      try {
         HttpHeaders header = new HttpHeaders();
         header.add("Content-Type", Files.probeContentType(file.toPath()));
         result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
      } catch (Exception e) {
         e.printStackTrace();
      }
      System.out.println("헤더 값이 뭐임?" + result.getHeaders());
      return result;
   }
   
   
   
   
   
}
