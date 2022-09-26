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
import com.spring.domain.Pd_ReplyPageDTO;
import com.spring.domain.Pd_ReplyVO;
import com.spring.service.Pd_ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class Pd_ReplyController {

	// @Setter 주입을 이용하거나, 스프링 4.3 버전 이상에서는 위에
	// @AllArgsConstructor를 이용해서 ReplyService 타입의 객체를
	// 필요로 하는 생성자를 만들어서 사용합니다.	
	private Pd_ReplyService service;
	
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	// create() 메서드는 @PostMapping으로 POST 방식으로만 동작하도록 설계합니다.
	// consumes와 produces를 이용해서 JSON 방식의 데이터만 처리하도록 하고,
	// 문자열을 반환하도록 설계 적용 합니다.
	// create() 메서드는 기존 글에 댓글을 등록(register)하는 역할을 합니다.
	// create() 메서드의 파라미터는 @RequestBody를 적용해서 JSON 데이터를
	// ReplyVO 타입으로 변환하도록 지정합니다.
	// 앞서 게시물 번호에 댓글 등록 작업과 테스트 : REST POST 테스트 구현
	public ResponseEntity<String> create(@RequestBody Pd_ReplyVO vo){
		log.info("ReplyVO~ ♥-♥ : " + vo);
		int insertCount = service.register(vo);
		log.info("Reply INSERT COUNT~ ＠-＠ : " + insertCount);
		
		// create() 메서드는 내부적으로 ReplyServiceImpl을 호출해서
		// register() 메서드를 호출하고, 댓글이 추가된 숫자를 확인해서 브라우저에
		// '200 OK' 혹은 '500 Internal Server Error'를 반환하도록 합니다.
		// return문은 insertCount 변수에 삼항 연산자 처리 결과를 적용하여 반환합니다.
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// Page435 : ReplyController에서는 ReplyService에 새롭게 추가된
	//           getListPage() 메서드를 호출하고 데이터를 전송하는 형태로 수정합니다.
	// Page395 : 특정 게시물의 댓글 목록 확인(앞서 댓글 달려진 게시물 댓글 목록 확인)
	@GetMapping(value = "/pages/{pd_code}/{page}", produces = {
			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	// ReplyController의 getList()는 Criteria를 이용해서 파라미터를 수집합니다.
	// 이때, '/{bno}/{page}'의 'page'값은 Criteria를 생성해서 직접 처리해 줍니다.
	// 즉, 게시물의 번호(bno)는 @PathVariable을 이용해서 파라미터로 처리해 줍니다.
	// 웹브라우저에 http://localhost:9005/replies/pages/720997/1 를 입력해서
	// 확인해 봅니다. 이때, 720997은 게시물의 번호(bno) 변수값이고, 1은 페이지(page)의 변수값입니다.
	public ResponseEntity<Pd_ReplyPageDTO> getList(@PathVariable("page") int page, @PathVariable("pd_code") Long pd_code){
		// Page435 소스 코딩할 때 아래 구문은 주석 처리함
		// log.info("getList...... ☆-☆/ : ");		
		
	Criteria cri = new Criteria(page, 10);
	log.info("get Reply List pd_code : " + pd_code); // 옆에는 Page 435 코딩 내용임
	log.info("cri : " + cri);

	// Page435 : 기존(Page395)과 동일하게 JSON 데이터를 전송하지만 ReplyPageDTO
	// 객체를 JSON으로 전송하게 되므로, 특정 게시물의 댓글 목록을 조회하면
	// 'replyCnt'와 'list' 이름의 속성을 가지는 JSON 문자열 전송을 확인해 봅니다.
	return new ResponseEntity<>(service.getListPage(cri, pd_code), HttpStatus.OK);
	}
	
	// 댓글 조회 처리
	// 실행 확인은 웹브라우저에 http://localhost:9005/replies/99 주소로 확인합니다.
	// 이때, 99는 데이터베이스에서 rno 검색 번호를 넣어준 것이며,
	// 99번이 없으면 다른 데이터베이스에서 검색된 다른 번호를 넣어 주시면 됩니다.
	// 여기서는, 기본 xml 형식으로 rno 99번 정보가 보이게 됩니다.
	// 그리고, 웹브라우저가 서버에 앞서 웹주소를 호출하면 서버의 컨트롤러가 동작하게 되어,
	// Console 창에는 log.info 정보도 나타나게 됩니다. log.info 정보도 확인 바랍니다.
	@GetMapping(value = "/{rno}", produces = {
			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Pd_ReplyVO> get(@PathVariable("rno") Long rno){
		log.info("get...처리 확인~ ◎-◎/ : " + rno);
		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
	}
	
// 댓글 삭제 처리 : 데이터베이스에서 기존 게시물의 번호(bno)를 조회하고,
// ReplyController 클래스에서 remove() 메서드로 처리된
// 특정 rno 데이터를 삭제 처리 확인합니다. 다음은 rno값이 73번인 댓글을 삭제하는 예시입니다.
// YARC에서 URL: 란에 http://localhost:9005/replies/delete/73 입력하고,
// 우측 DELETE 선택 - Headers: 에서 Add New Header 클릭 - Header Name에
// Content-Type 입력, Header Value에 application/json 입력하고
// 아래에 "Send Request" 버튼을 클릭해서 200 OK 메시지 확인하고,
// SQLDEVELOPER 데이터베이스에서 다음의 SQL문으로 rno (댓글) 번호 73 삭제 여부 확인합니다.
// STS에서 Console창에 처리된 메시지를 확인합니다.
	@DeleteMapping(value = "/delete/{rno}", produces = {
			MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno){
		log.info("remove...처리 확인~ ◆-◆/ : " + rno);
		return service.remove(rno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 댓글 수정은 JSON 형태로 전달되는 데이터와 파라미터로 전달되는 댓글 번호(rno)를
	// 처리하게 합니다.
	// 댓글 수정은 'PUT' 방식이나 'PATCH' 방식을 이용하도록 처리하고,
	// 실제 수정되는 데이터는 JSON 포맷이므로 @RequestBody를 이용해서 처리합니다.
	// @RequestBody로 처리되는 데이터는 일반 파라미터나 @PathVariable 파라미터를
	// 처리할 수 없기 때문에 직접 처리해 주는 부분을 주의해야 합니다.
	// YARC에서 Payload 입력할 때 다음의 예시처럼 입력할 때, bno, replyer는 변하지 않습니다.
	// 왜냐하면, ReplyMapper.xml 에서 update 메서드 SQL 쿼리문을 보시면,
	// reply만 수정되게 되어 있기 때문입니다.
	// [다음 예시]
	// {"bno":720997, "reply":"댓글 수정을 확인합니다~ 오늘도 화이팅입니다~!", "replyer":"replyer9"}
	// 또는  Payload에 {"reply":"댓글 수정을 확인합니다~ 오늘도 화이팅입니다~!"} 로 reply만 수정해도 됩니다.
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value = "/request/{rno}", consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody Pd_ReplyVO vo, @PathVariable("rno") Long rno){
		vo.setRno(rno);
		log.info("rno : ▼-▼/ : " + rno);
		log.info("modify : ＆-＆/ : " + vo);
		return service.modify(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
