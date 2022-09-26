package com.spring.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.domain.Criteria;
import com.spring.domain.Gr_ReplyPageDTO;
import com.spring.domain.Gr_ReplyVO;
import com.spring.service.Gr_ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replie/")
@RestController
@Log4j
@AllArgsConstructor
public class Gr_ReplyController {

	private Gr_ReplyService service;
	
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody Gr_ReplyVO vo){
		log.info("ReplyVO~ ♥-♥ : " + vo);
		int insertCount = service.register(vo);
		log.info("Reply INSERT COUNT~ ＠-＠ : " + insertCount);
		
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping(value = "/pages/{gr_bno}/{page}", produces = {
			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Gr_ReplyPageDTO> getList(@PathVariable("page") int page, @PathVariable("gr_bno") Long gr_bno){
		
	Criteria cri = new Criteria(page, 10);
	log.info("get Reply List gr_bno : " + gr_bno); 
	log.info("cri : " + cri);

	return new ResponseEntity<>(service.getListPage(cri, gr_bno), HttpStatus.OK);
	}
	
	@GetMapping(value = "/{rno}", produces = {
			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Gr_ReplyVO> get(@PathVariable("rno") Long rno){
		log.info("get...처리 확인~ ◎-◎/ : " + rno);
		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
	}
	
	@DeleteMapping(value = "/delete/{rno}", produces = {
			MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno){
		log.info("remove...처리 확인~ ◆-◆/ : " + rno);
		return service.remove(rno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value = "/request/{rno}", consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody Gr_ReplyVO vo, @PathVariable("rno") Long rno){
		vo.setRno(rno);
		log.info("rno : ▼-▼/ : " + rno);
		log.info("modify : ＆-＆/ : " + vo);
		return service.modify(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
