# portfolio - 최종 팀 프로젝트(Elesco)


------------------------------------------------------------------------------------------------------------------------------------------

# 개발환경
>front-end
- javascript
- bootstrap 
- jquery 

>back-end
- Java
- Spring
- myBatis
- maven
- springBoot
- JPA
- lombok 
- oracle DB
- tomcat 





------------------------------------------------------------------------------------------------------------------------------------------

# DB 모델링
<div>
  <img src="https://user-images.githubusercontent.com/105841315/191449633-95f059d3-e0d5-47eb-a300-dcb199f2d037.png">
</div>



------------------------------------------------------------------------------------------------------------------------------------------

# 기능별 주요 로직
>  - Back-End SpringMVC Q&A게시판
- 글쓰기
### Q&A 글쓰기 쿼리문 
~~~xml
<insert id="insert">
		insert into qna_board(qno, q_title, q_content, q_writer)
		values (qna_seq.nextval, #{q_title}, #{q_content}, #{q_writer})
	</insert>
	<insert id="insertSelectKey">
		<selectKey keyProperty="qno" order="BEFORE" resultType="long">
			select qna_seq.nextval from dual
		</selectKey>
		insert into qna_board(qno, q_title, q_content, q_writer)
		values (#{qno}, #{q_title}, #{q_content}, #{q_writer})
	</insert>
~~~
### Q&A 글쓰기 컨트롤러
~~~java
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
		log.info("겟매핑!!!!");
	}
~~~
### 글등록
![ezgif com-gif-maker (1)](https://user-images.githubusercontent.com/101411257/191635106-d9764e96-75ba-4ac1-a6ef-a490b7297419.gif)

- 글상세 & 리스트
### Q&A 글상세& 리스트 쿼리문 
~~~xml
<select id="read" resultType="com.spring.domain.QnaVO">
		select * from qna_board where qno = #{qno}
</select>
<select id="getList" resultType="com.spring.domain.QnaVO">
		<![CDATA[
			select * from qna_board where qno > 0
		]]>
</select>
~~~
### Q&A 글상세& 리스트 컨트롤러
~~~java
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
~~~
### 글상세& 리스트
![ezgif com-gif-maker](https://user-images.githubusercontent.com/101411257/191636757-a090430c-6288-45b1-8bb7-a520fc16d394.gif)

  

- 글수정
### Q&A 글수정 쿼리문 
~~~xml
 <update id="update">
		update qna_board
		set q_title=#{q_title},
		q_content=#{q_content},
		q_writer=#{q_writer},
		updatedate = sysdate
		where qno =#{qno}
	</update>
~~~
### Q&A 글수정 컨트롤러
~~~java
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
~~~
### 글수정

![ezgif com-gif-maker (1)](https://user-images.githubusercontent.com/101411257/191635700-5d5a673c-ec98-48ae-91bd-877f73d952b3.gif)


- 글삭제
### Q&A 글삭제 쿼리문 
~~~xml
 <delete id="delete">
		delete from qna_board where qno = #{qno}
	</delete>
~~~
### Q&A 글삭제 컨트롤러
~~~java
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
~~~
### 글삭제

![ezgif com-gif-maker](https://user-images.githubusercontent.com/101411257/191635862-5e2158b8-ef57-42f5-a5af-6531779427ce.gif)


- 페이징
### Q&A 페이징 쿼리문 
~~~xml
<select id="getListWithPaging" resultType="com.spring.domain.QnaVO">
		<![CDATA[
			select
				qno,q_title,q_content,q_writer,regdate,updatedate
			from
				(
				select /*+INDEX_DESC(qna_board pk_board) */
				rownum rn, qno, q_title, q_content, q_writer, regdate, updatedate
				from
				qna_board
				where rownum <= #{pageNum} * #{amount}
				)
				where rn > (#{pageNum} -1) * #{amount}
		]]>
	</select>
	
	<select id="getTotalCount" resultType="int">
		select count(*) from qna_board where qno > 0
	</select>
~~~
### Q&A 페이징 
~~~java
	@Getter @Setter @ToString
public class Criteria {

	private int pageNum; // 페이지 번호(pageNum)
	private int amount; // 한 페이지당 몇개의 데이터(amount)
	
	private String type;
	private String keyword;
		
	// 생성자를 통해 기본값을 1페이지, 한 페이지당 10개의 데이터로 지정해서 처리
	public Criteria() {
		this(1, 10);
	}

	// Criteria 클래스의 용도는 pageNum와 amount 값을 전달
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	

	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}

	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
														   .queryParam("pageNum", this.pageNum)
														   .queryParam("amount", this.getAmount())
														   .queryParam("type", this.getType())
														   .queryParam("keyword", this.getKeyword());
		return builder.toUriString();
	}
}

~~~
### 페이징

![ezgif com-gif-maker (1)](https://user-images.githubusercontent.com/101411257/191640789-423d7710-d699-493d-901a-d3459dc035f6.gif)




>  - SpringBoot 댓글 CRUD 

- Rest API를 적용한 댓글 처리
### ReplyController.java 
~~~java
@RestController
@RequestMapping("/reply")
@Log
public class ReplyController {
	
	
	private final ReplyRepository replyRepository;
	
	@Autowired
	public ReplyController(ReplyRepository replyRepository) {
		this.replyRepository = replyRepository;
	}

	//댓글등록
	@Transactional
	@PostMapping("/{qno}")
	public ResponseEntity<List<ReplyVO>> addReply(@PathVariable("qno") Long qno, @RequestBody ReplyVO reply){
		
		log.info("addReply() called..."); 
		log.info("qno : " + qno);
		log.info("Reply " + reply);
		
		QnaVO qna = new QnaVO();
		qna.setQno(qno);
		reply.setQno(qna);
		replyRepository.save(reply);
		
		return new ResponseEntity<>(getReplyiesofQna(qna), HttpStatus.CREATED);
		
	}
	
	//댓글 목록
	@GetMapping("/{qno}")
	public ResponseEntity<List<ReplyVO>> getReplyiesofQna(@PathVariable("qno") Long qno){
		log.info("replies () called");
		QnaVO qna = new QnaVO();
		qna.setQno(qno);
		return new ResponseEntity<>(getReplyiesofQna(qna), HttpStatus.OK);
	}

	//댓글목록
	private List<ReplyVO> getReplyiesofQna(QnaVO qna) throws RuntimeException{
		log.info("getReplyiesofQna () called...");
		return replyRepository.getReplyiesofQna(qna);
	}
	
	
	//댓글삭제
	@Transactional
	@DeleteMapping("/{qno}/{rno}")
	public ResponseEntity<List<ReplyVO>> remove(@PathVariable("qno") Long qno,
												@PathVariable("rno") Long rno){
		log.info("remove reply :" + rno);
		replyRepository.deleteById(rno);
		
		QnaVO qna = new QnaVO();
		qna.setQno(qno);
		
		return new ResponseEntity<>(getReplyiesofQna(qna),HttpStatus.OK);
		
	}
	
	//댓글수정
	@Transactional
	@PutMapping("/{rno}")
	public ResponseEntity<List<ReplyVO>> modify(@PathVariable("qno") Long qno, @RequestBody ReplyVO reply){
		log.info("modify reply : " + reply);
		
		replyRepository.findById(reply.getRno()).ifPresent(origin -> {
			origin.setReply(reply.getReply());
			replyRepository.save(origin);
		});
		
		QnaVO qna = new QnaVO();
		qna.setQno(qno);
		
		return new ResponseEntity<>(getReplyiesofQna(qna),HttpStatus.CREATED);
		
	}
	
	
~~~

- Ajax를 이용해 데이터 보내기
### Get.jsp
~~~jsp
<script type="text/javascript">
	var replyManager = (function () {

	//댓글목록
    var getAll = function (obj, callback) {
        console.log("get all ...");
        $.getJSON("/reply/" + obj, callback);
    };

    //댓글쓰기
    var add = function (obj, callback) {
        console.log("add ...");
        $.ajax({
            type: "post",
            url: "/reply/" + obj.qno,
            data : JSON.stringify(obj),
            dataType : "JSON",
            contentType : "application/json",
            success:callback
        });
        console.log(obj);
    };
	//댓글 수정
    var modify = function (obj, callback) {
        console.log("modify ...");
        $.ajax({
            type: "put",
            url: "/reply/" + obj.qno,
            data : JSON.stringify(obj),
            dataType : "JSON",
            contentType : "application/json",
            success:callback
        });
    };
	//댓글삭제
    var remove = function (obj, callback) {
        console.log("remove ...");
        $.ajax({
            type: "delete",
            url: "/reply/" + obj.qno + "/" + obj.rno,
            dataType : "JSON",
            contentType : "application/json",
            success:callback
        });
    };

    return {
        getAll : getAll,
        add : add,
        modify : modify,
        remove : remove
    }

})();
</script>
~~~
### 페이징

![ezgif com-gif-maker (2)](https://user-images.githubusercontent.com/101411257/191643689-9a7c4ca0-bbb2-4c95-a719-b3ef0ae4793f.gif)



------------------------------------------------------------------------------------------------------------------------------------------



# 프로젝트를 진행하며 느낀점
- 

