<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Single Product</title>

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

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Colo Shop Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/resources/elesco/styles/bootstrap4/bootstrap.min.css">
<link href="/resources/elesco/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/resources/elesco/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/resources/elesco/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/resources/elesco/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" href="/resources/elesco/plugins/themify-icons/themify-icons.css">
<link rel="stylesheet" type="text/css" href="/resources/elesco/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="/resources/elesco/styles/single_styles.css">
<link rel="stylesheet" type="text/css" href="/resources/elesco/styles/single_responsive.css">
</head>

<body>

<div class="super_container">

	<!-- Header -->

	<header class="header trans_300">
<!-- Main Navigation -->

		<div class="main_nav_container">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-right">
						<div class="logo_container">
							<a href="/main">Eles<span style="color: #a39292">co</span></a>
						</div>
						
						
						<nav class="navbar">
							<ul class="navbar_menu">
								<li><a href="/main">home</a></li>
								<li><a href="#">shop</a></li>
								<li><a href="#">notice</a></li>
								<li><a href="/qna/list">Q&A</a></li>
								<li><a href="#">Review</a></li>
								<li><a href="/contact">Contact</a></li>
								 <sec:authorize access="isAnonymous()">
								<li><a href="/customLogin1">Login</a></li>
								</sec:authorize>
								 <sec:authorize access="isAuthenticated()">
								<li><a href="/customLogout">Logout</a></li>
								</sec:authorize>
								
							</ul>
							<ul class="navbar_user">
								<li><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></li>
								<sec:authorize access="isAnonymous()">
								<li><a href="/mypage/list"><i class="fa fa-user" aria-hidden="true"></i></a></li>
								</sec:authorize>
								<sec:authorize access="isAuthenticated()">
								<li><a href="/mypage/list"><i class="fa fa-user" aria-hidden="true"></i></a></li>
								</sec:authorize>
								<sec:authorize access="isAnonymous()">
								<li class="checkout"><a href="/customLogin1"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
								</sec:authorize>
								<sec:authorize access="isAuthenticated()">
								<li class="checkout"><a href="/cart/list"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
								</sec:authorize>
							</ul>
							<div class="hamburger_container">
								<i class="fa fa-bars" aria-hidden="true"></i>
							</div>
						</nav>
						
						
						
					</div>
				</div>
			</div>
		</div>

	</header>

	<div class="fs_menu_overlay"></div>
	<div class="hamburger_menu">
		<div class="hamburger_close"><i class="fa fa-times" aria-hidden="true"></i></div>
		<div class="hamburger_menu_content text-right">
			<ul class="menu_top_nav">
				
				<li class="menu_item has-children">
					<a href="#">
						My Account
						<i class="fa fa-angle-down"></i>
					</a>
					<ul class="menu_selection">
						<sec:authorize access="isAnonymous()">
						<li><a href="/customLogin1"><i class="fa fa-sign-in" aria-hidden="true"></i>Login</a></li>
						<li><a href="/users/insert"><i class="fa fa-user-plus" aria-hidden="true"></i>Register</a></li>
						</sec:authorize>
						 <sec:authorize access="isAuthenticated()">
						 <li><a href="/customLogout"><i class="fa fa-sign-in" aria-hidden="true"></i>Logout</a></li>
						 </sec:authorize>
					</ul>
				</li>
				<li class="menu_item"><a href="/main">home</a></li>
				<li class="menu_item"><a href="#">shop</a></li>
				<li class="menu_item"><a href="#">notice</a></li>
				<li class="menu_item"><a href="/qna/list">Q&A</a></li>
				<li class="menu_item"><a href="/contact">contact</a></li>
			</ul>
		</div>
	</div>
	<div class="container single_product_container">
		<div class="row">
			<div class="col">

				<!-- Breadcrumbs -->

				<div class="breadcrumbs d-flex flex-row align-items-center">
					<ul>
						<li><a href="/main">Elesco</a></li>
						<li class="active"><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>Single Product</a></li>
					</ul>
				</div>

			</div>
		</div>

		<div class="row">
			<div class="col-lg-7">
				<div class="single_product_pics">
					<div class="row">
						<div class="col-lg-3 thumbnails_col order-lg-1 order-2">
							<!--<div class="single_product_thumbnails">
								<ul>
									<li><
 src="images/single_1_thumb.jpg" alt="" data-image="images/single_1.jpg"></li>
									<li class="active"><img src="images/single_2_thumb.jpg" alt="" data-image="images/single_2.jpg"></li>
									<li><img src="images/single_3_thumb.jpg" alt="" data-image="images/single_3.jpg"></li>
								</ul>
							</div>-->
							<div class="single_product_image">
								<img src="../resources/img/UploadVZcGzlOBYl5wX4ceijClYXPYDpJ042dN.png" height="550px" width="650px">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-5">
				<div class="product_details">
					<div class="product_details_title">
						<h2>${read.pd_title}</h2>
						<p>${read.pd_content}</p>
					</div>
					<div class="free_delivery d-flex flex-row align-items-center justify-content-center">
					<span>${read.admin}</span>
					</div>
					<div class="product_price">가격 : ${read.price}</div>
					<button class="red_button add_to_cart_button" style="color: #fff" type="button" onclick="fn_buy()">결제하기</button>
					<div class="product_color">
					<div class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
					<div class="product_price">수량 : ${read.amount}</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		
		
		<div id="wrapper container">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     
     
      <div>
  <div class="col-lg-12">    
    <!-- /.panel -->
    <div class="panel panel-default" >
    
      	      <div class="panel-heading" style="border-bottom: 2px #a39292 solid; margin-bottom: 1rem">
      	      	<i class="fa fa-comments fa-fw"></i> Reply!!!
      	      	<div class="d-flex w-100 flex-row-reverse mb-3">
      	      		<button id="addReplyBtn" class="btn btn-primary btn-sm">New Reply!!!</button>
    	      	</div>
      	      </div>
      	            	 
      
      	<!-- /.panel-heading -->
      	<div class="panel-body">  
      	    <ul class="chat">
	        </ul>
    	</div>
    	<!-- /.panel .chat-panel -->
	      	     <div class="panel-footer mb-2" style="border-top: 2px #a39292 solid;" ></div>
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
				str += "<li class='' data-rno='" + list[i].rno + "'>";
				str +=" <div><div class=''><strong class='primary-font'>"+ list[i].replyer+"</strong>";
				str +=" <small class='text-muted'>" + replyService.displayTime(list[i].replyDate) + "</small></div>";				
				
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
		
		var str = "<ul class='pagination pull-right mt-3'>";
		
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
     .
     </script>  
     </div>
     <!-- /#wrapper -->
    <footer class="footer">
       <div class="container">
          <div class="row">
             <div class="col-lg-6">
                <div class="footer_nav_container d-flex flex-sm-row flex-column align-items-center justify-content-lg-start justify-content-center text-center">
                   <ul class="footer_nav">
                      <li><a href="#">Blog</a></li>
                      <li><a href="/board/faq">FAQs</a></li>
                      <li><a href="contact.html">Contact us</a></li>
                   </ul>
                </div>
             </div>
             <div class="col-lg-6">
                <div class="footer_social d-flex flex-row align-items-center justify-content-lg-end justify-content-center">
                   <ul>
                      <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                      <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                      <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                      <li><a href="#"><i class="fa fa-skype" aria-hidden="true"></i></a></li>
                      <li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                   </ul>
                </div>
             </div>
          </div>
          <div class="row">
             <div class="col-lg-12">
                <div class="footer_nav_container">
                   <div class="cr">©2022 All Rights Reserverd. Made with Elesco</div>
                </div>
             </div>
          </div>
       </div>
    </footer>

 </div>

 <script src="/resources/elesco/js/jquery-3.2.1.min.js"></script>
 <script src="/resources/elesco/styles/bootstrap4/popper.js"></script>
 <script src="/resources/elesco/styles/bootstrap4/bootstrap.min.js"></script>
 <script src="/resources/elesco/plugins/Isotope/isotope.pkgd.min.js"></script>
 <script src="/resources/elesco/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
 <script src="/resources/elesco/plugins/easing/easing.js"></script>
 <script src="/resources/elesco/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
 <script src="/resources/elesco/js/single_custom.js"></script>
 </body>

 </html>