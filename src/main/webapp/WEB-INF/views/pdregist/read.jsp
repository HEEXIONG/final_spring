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
	
	</table>
	<button type="button" onclick="fn_buy()">결제하기</button>
	<a href="orderlist">주문내역</a>
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
    
      	      <div class="panel-heading">
      	      	<i class="fa fa-comments fa-fw"></i> Reply!!!
      	      		<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">New Reply!!!</button>
      	      </div>
      	            	 
      
      	<!-- /.panel-heading -->
      	<div class="panel-body">  
      	    <ul class="chat">
	        </ul>
    	</div>
    	<!-- /.panel .chat-panel -->
	      	     <div class="panel-footer"></div>
     	</div>	
  </div>
  <!-- ./ end row -->
</div>


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

        
      
<script type="text/javascript" src="/resources/js/Pd_reply.js"></script>

<script>
$(document).ready(function() {
	var pdcodeValue = '<c:out value="${read.pd_code}"/>';
	var replyUL = $(".chat");
	
	showList(1);
	
	function showList(page) {
		
		console.log("show list " + page);
		
			replyService.getList({pd_code:pd_codeValue, page: page|| 1}, function(replyCnt, list) {
				console.log("replyCnt : " + replyCnt);
				console.log("list : " + list);
				console.log(list);
				
				if(page == -1){
					pageNum = Math.ceil(replyCnt/10.0);
					showList(pageNum);
					return;
				}
				var str = "";
				
				if(list == null || list.length == 0){
					return;
				}
				
				
			for(var i = 0, len = list.length || 0; i < len; i++){
				str += "<li class='left clearfix' data-rno='" + list[i].rno + "'>";
				str +=" <div><div class='header'><strong class='primary-font'>"+ list[i].replyer+"</strong>";
				str +=" <small class='pull-right text-muted'>" + replyService.displayTime(list[i].replyDate) + "</small></div>";				
				
				str +=" <p>" + list[i].reply + "</p></div></li>";
			}
			replyUL.html(str);
			
			showReplyPage(replyCnt);
			
		}); // end function
	} // end showList

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
	replyPageFooter.on("click", "li a", function(e) {
		e.preventDefault();
		console.log("page click");
		var targetPageNum = $(this).attr("href");
		console.log("targetPageNum : " + targetPageNum);
		
		pageNum = targetPageNum;
		showList(pageNum);
	});
	
	var modal = $(".modal");
	var modalInputReply = modal.find("input[name='reply']");
	var modalInputReplyer = modal.find("input[name='replyer']");
	var modalInputReplyDate = modal.find("input[name='replyDate']");
	
	var modalModBtn = $('#modalModBtn');
	var modalRemoveBtn = $('#modalRemoveBtn');
	var modalRegisterBtn = $('#modalRegisterBtn');
	
	$("#addReplyBtn").on("click", function(e) {
		modal.find("input").val("");
		modalInputReplyDate.closest("div").hide();
		modal.find("button[id != 'modalCloseBtn']").hide();
		
		modalRegisterBtn.show();
		$(".modal").modal("show");
	});
	
	modalRegisterBtn.on("click", function(e) {
		var reply = {
				reply : modalInputReply.val(),
				replyer : modalInputReplyer.val(),
				pd_code : pd_codeValue
		};
		replyService.add(reply, function(result) {
			alert(result);
			modal.find("input").val("");
			modal.modal("hide");
			showList(-1); 
		});
	});
	
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
	
	modalModBtn.on("click", function(e) {
		var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
		replyService.update(reply, function(result) {
			alert(result);
			modal.modal("hide");			
			showList(pageNum); 
		});					  
	});
	modalRemoveBtn.on("click", function(e) {
		var rno = modal.data("rno");
		replyService.remove(rno, function(result) {
			alert(result);
			modal.modal("hide");
			showList(pageNum); 
			                   
		});
	});
	
});

</script>






<script type="text/javascript">
	
	console.log("====================");
	console.log("Javascript TEST");
	
	var pd_codeValue = '<c:out value = "${read.pd_code}" />';
	
	
	
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