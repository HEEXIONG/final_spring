<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html> 
<html>
<head>
<title>글상세보기</title>

<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script>
	function fn_buy() {
		var IMP = window.IMP;
		IMP.init("imp23866008"); // Insert your Code 부분에 자신의 아임포트 "가맹점 식별코드" 입력 바랍니다.
		IMP.request_pay({
			pg : "html5_inicis",
			pay_method : "card",
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : "${read.pd_title}",
			amount : ${read.price},
			buyer_email : "email",  // buyer_email도 수정하기 바랍니다.
			buyer_name : "${userinfo.user.USER_NICKNAME}",
			buyer_tel : "010-1234-5678",
			buyer_addr : "서울특별시 강남구 역삼동",
			buyer_postcode : "11111",
			m_redirect_url : "/paymentDone.do"
		}, function(rsp) {
			if (rsp.success) {
				var paymentInfo = {
						imp_uid : rsp.imp_uid,
						merchant_uid : rsp.merchant_uid,
						paid_amount : rsp.paid_amount,
						apply_num : rsp.apply_num,
						paid_at : new Date()
					};
				$.ajax({
					url : "/iamport/paymentProcess.do",
					method : "POST",
					contentType : "application/json",
					data : JSON.stringify(paymentInfo), 
					success:function (data,textStatus){
				    	 console.log(paymentInfo);
				    	 location.href = "/iamport/paymentDone.do";
				     },
					error : function(e) {
						console.log(e);
					}
				})
			} else {
				alert("결제 실패 : " + rsp.error_msg);
			}
		});
	}
</script>



 <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
      <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
</head>

<body>
     <table style="width: 50%; margin: auto;">
	<tr><th>글 번호</th><td>${read.pd_code}</td></tr>
	<tr><th>글 제목</th><td>${read.pd_title}</td></tr>
	<tr><th>작성자</th><td>${read.admin}</td></tr><br>
	<tr><th>물품등록일</th><td>${read.regdate}</td></tr>
	<tr><th>글 내용</th><td>${read.pd_content}</td></tr>
	<tr><th>가격</th><td>${read.price}</td></tr>
	<button type="button" onclick="fn_buy()">결제하기</button>
	
	</table>
	<p>사용자이름 : <sec:authentication property="principal.user.USER_NICKNAME" /> </p>
<button type="submit" onclick="location.href='/pdregist/list'" formmethod="get">목록</button>

<div id="wrapper">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <div id="page-wrapper">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     
     
      <div class='row'>
  <div class="col-lg-12">    
    <!-- /.panel -->
    <div class="panel panel-default">
    
    	<!-- Page 419 코딩할 때 아래 .panel-heading 영역을 주석 처리해 줍니다. -->
    	<!-- 
       	<div class="panel-heading">
        	<i class="fa fa-comments fa-fw"></i> Reply
      	</div>
      	 -->
      	 
      	 <!-- Page 419 댓글 목록 상단 오른쪽에 버튼을 하나 추가해서
      	            사용자들이 새로운 댓글을 추가할 수 있도록 준비합니다. -->
      	      <div class="panel-heading">
      	      	<i class="fa fa-comments fa-fw"></i> Reply!!!
      	      		<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">New Reply!!!</button>
      	      </div>
      	            	 
      
      	<!-- /.panel-heading -->
      	<div class="panel-body">  
      	    <!-- 댓글의 목록은 ul 태그 내에 li 태그를 이용해서 처리합니다.
      	         각 li 태그는 하나의 댓글을 의미하므로 수정이나 삭제 시 이를 클릭하게 됩니다.
      	         수정이나 삭제 시에는 반드시 댓글 번호(rno)가 필요하므로 'data-rno' 속성을
      	         이용해서 이를 처리합니다. -->      
      	    <ul class="chat">
      	       <!-- start reply -->
      	    	<!-- Page439 코딩할 때 아래 li 태그 주석 처리함 -->
      	    	<!-- 
      	    	<li class="left clearfix" data-rno='12'>
      	    		<div>
      	    		<div class="header">
      	    			<strong class="primary-font">user00</strong>
      	    			<small class="pull-right text-muted">2022-07-31 13:20</small>
      	    		</div>
      	    		<p>Good job!</p>
	      	    	</div>
	      	    </li>
	      	     -->
				<!-- Page414 댓글 목록 처리 get jsp 소스 코딩 끝 -->
	        </ul>
    	</div>
    	<!-- /.panel .chat-panel -->
	      	     <!-- Page439 get jsp 소스 추가 내용 -->
	      	     <div class="panel-footer"></div>
     	</div>	
  </div>
  <!-- ./ end row -->
</div>


<!-- Page420~Page421 get jsp 내의 모달창 소스 코딩 시작 -->
<!-- 댓글의 추가는 모달창을 이용해서 진행합니다. -->
<!-- Modal -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label>Reply</label> 
                <input class="form-control" name='reply' value='New Reply!!!!'>
              </div>      
              <div class="form-group">
                <label>Replyer</label> 
                <input class="form-control" name='replyer' value='replyer'>
              </div>
              <div class="form-group">
                <label>Reply Date</label> 
                <input class="form-control" name='replyDate' value='2018-01-01 13:13'>
              </div>
      
            </div>
<div class="modal-footer">
        <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
        <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
        <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
        <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
      </div>          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
<!-- Page420~Page421 get jsp 내의 모달창 소스 코딩 끝 -->

        
      
<script type="text/javascript" src="/resources/js/Pd_reply.js"></script>

<script>
// 특정 게시물의 댓글 관련 이벤트 처리 : 게시글의 조회 페이지가 열리면 자동으로 댓글 목록을 가져와서
// li 태그를 구성해야 합니다. 이에 대한 처리는 $(documnet).ready() 내에서 이루어지게 합니다.
// Page415 이벤트 처리를 위한 자바스크립트 소스 코딩 시작
$(document).ready(function() {
	var pdcodeValue = '<c:out value="${read.pd_code}"/>';
	var replyUL = $(".chat");
	
	// showList() 메서드는 페이지 번호를 파라미터로 받도록 하며,
	// 만일 파라미터가 없는 경우에는 자동으로 1페이지가 되도록 설정합니다.
	// 웹브라우저에서 DOM 처리가 끝나면 자동으로 showList() 메서드가 호출되면서
	// ul 태그 내에 내용으로 처리됩니다. 만약 1페이지가 아닌 경우라면
	// 기존 ul태그에 li태그들이 추가되는 형태입니다.
	showList(1);
	
	// Page438 : showList() 함수는 파라미터로 전달되는 page 변수를 이용해서
	//           원하는 댓글 페이지를 가져오게 됩니다.
	function showList(page) {
		
		// Page 438 아래 구문 1줄을 추가 코딩함
		console.log("show list " + page);
		
	    /* Page 438 코딩할 때 아래 getList() 메서드는 주석 처리해 줍니다.
		replyService.getList({pd_code:pd_codeValue, page: page|| 1}, function(list) {
			var str = "";
			if(list == null || list.length == 0){
				replyUL.html("");
				return;
			}
			*/
			// Page 438 getList() 메서드 소스 코딩
			replyService.getList({pd_code:pd_codeValue, page: page|| 1}, function(replyCnt, list) {
				console.log("replyCnt : " + replyCnt);
				console.log("list : " + list);
				console.log(list);
				
			// 위에서 showList() 함수가 파라미터로 전달되는 page 변수를
			// 이용해서 원하는 댓글 페이지를 가져오게 되면, 이때, 만약
			// page 번호가 '-1'로 전달되면 마지막 페이지를 찾아서 다시 호출하게 됩니다.			
				if(page == -1){
					pageNum = Math.ceil(replyCnt/10.0);
					showList(pageNum);
					return;
				}
				var str = "";
				
				if(list == null || list.length == 0){
					// Page 438 소스 코딩할 때 아래 1줄 구문은 주석 처리함
					// replyUL.html("");
					return;
				}
				
				
			for(var i = 0, len = list.length || 0; i < len; i++){
				str += "<li class='left clearfix' data-rno='" + list[i].rno + "'>";
				str +=" <div><div class='header'><strong class='primary-font'>"+ list[i].replyer+"</strong>";
				// Page418~Page419 소스 코딩할 때 아래 내용은 주석 처리해 줍니다.
				/*
				str +=" <small class='pull-right text-muted'>" + list[i].replyDate+"</small></div>";
				*/
				
				// Page418~Page419 get.jsp 소스 코딩 수정 적용 시작				
				str +=" <small class='pull-right text-muted'>" + replyService.displayTime(list[i].replyDate) + "</small></div>";				
				// Page418~Page419 get.jsp 소스 코딩 수정 적용 끝
				
				str +=" <p>" + list[i].reply + "</p></div></li>";
			}
			replyUL.html(str);
			
			// Page441 아래 1줄 소스 추가함.
			showReplyPage(replyCnt);
			
		}); // end function
	} // end showList

	// Page440 get jsp 소스 코딩 : 앞서 div class='panel-footer'에 댓글
	// 페이지 번호를 출력하는 로직인 showReplyPage() 메서드를 정의해 줍니다.
	var pageNum = 1;
	var replyPageFooter = $(".panel-footer");
	
	function showReplyPage(replyCnt) {
		var endNum = Math.ceil(pageNum/10.0) * 10;
		var startNum = endNum - 9;		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 10 >= replyCnt){
			endNum = Math.ceil(replyCnt/10.0);
		}
		
		if(endNum * 10 < replyCnt){
			next = true;
		}
		
		var str = "<ul class='pagination pull-right'>";
		
		if(prev){
			str += "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
		}
		for(var i = startNum; i <= endNum; i++){
			var active = pageNum == i? "active" : "";
			str += "<li class='page-item " + active + " '><a class='page-link' href='" + i + "'>" + i +"</a></li>";
		}
		if(next){
			str += "<li class='page-item'><a class='page-link' href='" +(endNum + 1) + "'>Next</a></li>";
		}
		str += "</ul></div>";
		console.log(str);		
		replyPageFooter.html(str);
		}
	// Page 441 : 마지막 처리는 replyPageFooter를 활용해서 
	//            페이지의 번호를 클릭했을 때 새로운 댓글을 가져오도록 합니다.
	replyPageFooter.on("click", "li a", function(e) {
		// 댓글의 페이지 번호는 a 태그 내에 존재하므로 이벤트 처리에서는
		// a 태그의 기본 동작을 제한하고(preventDefault()) 댓글 페이지 번호를
		// 변경한 후에 해당 페이지의 댓글을 가져오도록 합니다.
		e.preventDefault();
		console.log("page click");
		var targetPageNum = $(this).attr("href");
		console.log("targetPageNum : " + targetPageNum);
		
		pageNum = targetPageNum;
		showList(pageNum);
	});
	
// Page415 이벤트 처리를 위한 자바스크립트 소스 코딩 끝
// Page422 get jsp 자바스크립트 내에 댓글 추가 시작 시 버튼 이벤트 처리 소스 코딩 시작
// 새로운 댓글의 추가 시, 버튼 이벤트 처리 : 댓글 목록 상단의 'New Reply'를 클릭하면
// 화면에서는 모달창을 보여줘서 처리합니다. 모달과 관련된 객체들은 여러 함수에서 사용할 것이므로
// 바깥쪽으로 빼두어 매번 jQuery를 호출하지 않도록 합니다.
	var modal = $(".modal");
	var modalInputReply = modal.find("input[name='reply']");
	var modalInputReplyer = modal.find("input[name='replyer']");
	var modalInputReplyDate = modal.find("input[name='replyDate']");
	
	var modalModBtn = $('#modalModBtn');
	var modalRemoveBtn = $('#modalRemoveBtn');
	var modalRegisterBtn = $('#modalRegisterBtn');
	
	// 사용자가 'New Reply' 버튼을 클릭하면 입력에 필요없는 항목들은 안 보이게 처리하고,
	// 모달창을 보이게 합니다.
	$("#addReplyBtn").on("click", function(e) {
		modal.find("input").val("");
		// 아래 hide() 메서드가 포함된 구문을 주석 처리 후 실행 확인해 보시기 바랍니다.
		modalInputReplyDate.closest("div").hide();
		// 아래 hide() 메서드가 포함된 구문을 주석 처리 후 실행 확인해 보시기 바랍니다.
		modal.find("button[id != 'modalCloseBtn']").hide();
		
		modalRegisterBtn.show();
		$(".modal").modal("show");
	});
	// Page422 get jsp 자바스크립트 내에 댓글 추가 시작 시 버튼 이벤트 처리 소스 코딩 끝
	
	// Page 423 : 댓글 등록 및 목록 갱신 소스 코딩 시작
	// 새로운 댓글의 추가는 필요한 댓글의 내용(Reply)과 댓글의 작성(Replyer) 항목만으로
	// 추가해서 모달창 아래쪽의 'Register' 버튼을 클릭해서 처리하게 합니다.
	modalRegisterBtn.on("click", function(e) {
		var reply = {
				reply : modalInputReply.val(),
				replyer : modalInputReplyer.val(),
				pd_code : pd_codeValue
		};
		// 댓글이 정상적으로 추가되면 경고창(alert)을 이용해서 성공했다는 사실을 알려주고,
		// 등록한 내용으로 다시 등록할 수 없도록 입력항목을 비우고 모달창을 닫아줍니다.
		replyService.add(reply, function(result) {
			alert(result);
			modal.find("input").val("");
			modal.modal("hide");
			// 댓글이 정상적으로 처리되었지만 목록 자체는 갱신된 적이 없으므로
			// 화면에서 새로 등록된 댓글이 보이지 않습니다. 이러한 문제 때문에
			// 댓글을 추가한 후에는 다시 댓글의 목록(showList(1)) 갱신 처리를 해줍니다.
			// 아래와 같이 showList(1)을 추가해 줘서 댓글이 추가된 후
			// 그 사이에 추가되었을지 모르는 새로운 댓글도 가져오도록 합니다.
			// 웹프로젝트 실행 후 New Reply!!! 버튼 클릭하고, 댓글 입력 후
			// 댓글 리스트 하단에 댓글 추가 내용과 우측 댓글 추가 시간을 확인하시기 바랍니다.
		// showList(1); // 옆에 showList(1)은 Page439 적용 시 주석 처리 합니다.
			showList(-1); // Page438, Page439 : 위에서 사용자가 새로운 댓글을
			              // 추가하면 showList(-1);을 호출하여 우선 전체 댓글의
		              // 숫자를 파악하게 합니다. 이후에 다시 마지막 페이지를 호출해서
		              // 이동시키는 방식으로 동작하게 됩니다. 이러한 방식은 여러 번
		              // 서버를 호출해야 하는 단점이 있기는 하지만, 댓글의 등록 행위가
		              // 댓글 조회나 페이징에 비해서 적기 때문에 심각한 문제는 아닙니다.
		});
	});
	// Page 423 : 댓글 등록 및 목록 갱신 소스 코딩 끝
	
	// Page 425 : 댓글 조회 클릭 이벤트 처리
	// 특정한 댓글 조회 클릭 이벤트 처리
	// Ajax로 댓글을 조회한 후 수정/삭제를 처리하게 합니다.
	// 댓글을 가져온 후에는 필요한 항목들을 채우고 수정과 삭제가 필요한 댓글 번호(rno)는
	// 'data-rno' 속성을 만들어서 추가해 둡니다.
	$(".chat").on("click", "li", function(e) {
		var rno = $(this).data("rno");
		replyService.get(rno, function(reply) {
			modalInputReply.val(reply.reply);
			modalInputReplyer.val(reply.replyer);
			modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
			modal.data("rno", reply.rno);
			modal.find("button[id != 'modalCloseBtn']").hide();
			modalModBtn.show();
			modalRemoveBtn.show();
			
			$(".modal").modal("show");
		});
	});
	
	// Page426~ Page427 댓글의 수정 이벤트 처리
	// 댓글의 수정 시 작업이 모두 끝나면, 다시 댓글 목록을 갱신해 줘야 합니다.
	// 댓글의 수정은 댓글(reply)만 수정이 가능합니다. 왜냐하면 ReplyMapper.xml에서
	// update 처리가 댓글(reply)만 수정 적용하게 되어 있기 때문입니다.
	modalModBtn.on("click", function(e) {
		var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
		replyService.update(reply, function(result) {
			alert(result);
			modal.modal("hide");			
			// Page442 페이징이 적용된 댓글의 수정할 때 아래 1줄 코딩은 주석 처리해줌.
			// showList(1);
			showList(pageNum); // Page442 showList() 메서드를 호출할 때
		});					   // 현재 보고 있는 댓글 페이지의 번호를 호출합니다.
	});
	// Page427 댓글의 삭제 이벤트 처리
	// 댓글의 삭제 시 작업이 모두 끝나면, 다시 댓글 목록을 갱신해 줘야 합니다.
	// 댓글 삭제 역시 모달창에 있는 'data-rno'값을 이용해서 처리합니다.
	modalRemoveBtn.on("click", function(e) {
		var rno = modal.data("rno");
		replyService.remove(rno, function(result) {
			alert(result);
			modal.modal("hide");
			// Page442 페이징이 적용된 댓글의 수정할 때 아래 1줄 코딩은 주석 처리해줌.
			// showList(1);
			showList(pageNum); // Page442 showList() 메서드를 호출할 때
			                   // 현재 보고 있는 댓글 페이지의 번호를 호출합니다.
		});
	});
	
});

</script>






<script type="text/javascript">
	//Page404 연습할때 아래 구문은 주석 처리합니다.
	// $(document).ready(function () {
		// console.log(replyService);
	// });
	
	console.log("====================");
	console.log("Javascript TEST");
	
	var pd_codeValue = '<c:out value = "${read.pd_code}" />';
	
	// Page 407 소스 코딩할 때 아래 내용은 주석 처리해 줍니다.	
	/*
	replyService.add(
		{reply: "Javascript TEST", replyer: "tester", pd_code: pd_codeValue}
		,
		function(result) {
			alert("RESULT : " + result);
		}
	);
	*/	
	
	// Page 407 getList() 메서드 자바스크립트 소스 코딩 시작
	// Page 409 댓글 삭제 확인할 때 아래 소스는 주석 처리 바랍니다.
	/*
	replyService.getList({pd_code:pd_codeValue, page:1}, function(list) {
				for(var i = 0, len = list.length || 0; i < len; i++){
					console.log(list[i]);
				}
			});
	*/
	// Page 407 getList() 메서드 자바스크립트 소스 코딩 끝
	
	// Page 409 댓글 삭제 테스트 : sqldeveloper 이용해서
	// select * from tbl_reply; 검색해서 특정 번호를 확인해 봅니다.
	// 여기서는 RNO 칼럼 23번 댓글을 삭제해 봅니다.
	// Page 409 댓글 삭제 코딩할 때, getList() 메서드는 주석 처리 바랍니다.
	// Page 411 댓글 수정 코딩할 때, 아래 remove 메서드는 주석 처리 바랍니다.
	// Page 409 댓글 삭제 테스트 소스 코딩 시작	
	/*
	replyService.remove(23, function(count) {
		console.log(count);
		if(count === "success"){
			alert("REMOVED");
			}
		}, function(err) {
			alert('ERROR가 발생했습니다!');
		});	
	*/
	// Page 409 댓글 삭제 테스트 소스 코딩 끝
	
	// Page410 : SQLDEVELOPER 데이터베이스에서 RNO 22번 댓글을 수정해 보겠습니다.
	// 웹프로젝트 구동 후 http://localhost:9005/board/list 웹 주소 입력 
	// 'board/list' 웹에서 임의의 특정글 제목 클릭하면 get 페이지 열리면서,
	// update alert "수정이 제대로 처리 되었습니다!" 메시지 나타나면 정상 동작입니다.
	// 그리고, SQLDEVELOPER 데이터베이스에서 RNO 22번 댓글이 제대로 수정되었는지
	// 확인해 보시기 바랍니다.	
	// Page 413 소스 코딩할 때 아래 update() 메서드 소스는 주석 처리를 해줍니다.
	/* 
	replyService.update({
		rno : 22,
		pd_code : pd_codeValue,
		reply : "＠-＠ 댓글 수정입니다!"		
		}, function(result) {
			alert("수정이 제대로 처리 되었습니다!");
		});	
	*/
	
	// Page 413 소스 코딩 : 댓글 번호 22번(특정 댓글) 조회 확인을 합니다.
	// SQLDEVELOPER 데이터베이스에서 RNO 22번 댓글 내용을 확인해 봅니다.
	// 웹프로젝트 구동 후 http://localhost:9005/board/list 웹 주소 입력 
	// 'board/list' 웹에서 임의의 특정글 제목 클릭하면 get 페이지 열리는데,
	// 개발자도구(F12) - 콘솔(Console)탭에서 console log로 표현된
	// 22번 댓글 내용을 확인해 봅니다.
	// 아래 get() 메서드는 테스트용이었기 때문에, 실행 결과 확인 후 주석 처리 줍니다.
	/*
	replyService.get(22, function(data) {
		console.log(data);
	});
	*/
	
</script>

<script type="text/javascript">

	$(document).ready(function() {
		var operForm = $("#operForm");
		
		// 사용자가 버튼을 클릭하면 operForm이라는 id를 가진 form 태그를 전송하게 합니다.
		$("button[data-oper='modify']").on("click", function(e) {
		
			// 사용자가 수정 버튼을 클릭하는 경우에는 pd_code 값을 같이 전달하고,
			// form 태그를 submit 처리 합니다.
			operForm.attr("action", "/board/modify").submit();
		});
		// 만일 사용자가 list로 이동하는 경우에는 아직 아무런 데이터도 필요하지 않으므로
		// form 태그 내의 pd_code 태그를 지우고 submit을 통해서 리스트 페이지로 이동합니다.
		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#pd_code").remove();
			operForm.attr("action", "/board/list")
			operForm.submit();
		});		
	});

</script>


<!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    // 아래 jQuery 소스 코드는 jQuery 교체 후 모바일 크기에서 새로 고침 할 경우에 메뉴가 펼쳐지는 문제 해결을 위한 소스 코드 삽입 입니다.
    $(".slidebar-nav")
    	.attr("class", "slidebar-nav navbar-collapse collapse")
    	.attr("aria-expanded", 'false')
    	.attr("style", "height:1px");
    });   
    
    </script>  
     
     
     
     </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
    
    
    


</body>
</html>