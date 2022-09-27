<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/jquery-3.3.1.min.js"></script>
<script src="/bootstrap.min.js"></script>
<title>Insert title here</title>

<style>
#my_modal {
	display: none;
	width: 300px;
	padding: 20px 60px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}

#my_modal .modal_close_btn {
	position: absolute;
	top: 10px;
	right: 10px;
}

.table2{
	width:390px;
	height:320px;
}
</style>

</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="page-wrapper" style="margin-top:7%;margin-left:18%;margin-bottom:17%;">
		<div class="container">
			<div class="col-lg-8">
				<!--게시판 넓이 -->
				<div class="py-5 text-center">
      				<h2>장바구니</h2>
    			</div>

				<div class="panel panel-default">
					<div class="panel-body">
						<table id="cart_table" class="table table-hover">
							<thead>
								<tr>
									<th>장바구니 코드</th>
									<th>제품코드</th>
									<th>제품이미지</th>
									<th>가격</th>
									<th>수량</th>
									<th>가격합계</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${list}" var="CartVO">
									<tr class="cart_class">
										<td><c:out value="${CartVO.CART_CODE}" /></td>
										<td><c:out value="${CartVO.PD_CODE}" /></td>
										<td><c:out value="${CartVO.PD_IMAGE}" /></td>
										<td><c:out value="${CartVO.PRICE}" /></td>
										<td><c:out value="${CartVO.PD_AMOUNT}" /></td>
										<td><c:out value="${CartVO.PD_TOTALPRICE}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-12">
			  		<button class="w-100 btn btn-primary btn-lg">구매하러 가기</button>
           		</div>
			</div>
		</div>


		<!--modal  -->
		<div id="my_modal">
			<form id ="cartForm">
				<div class="row">
					<table class="table table-hover">
							<tr>
	                            <td>상품이름<td>
	                            <td><input type="text" id="cart_code" name="CART_CODE" readonly><td>
							</tr>
							<tr>
	                            <td>상품가격<td>
	                            <td><input type="text"  id="cart_price" name="CART_PRICE" readonly><td>
							</tr>
							<tr>
	                            <td>상품수량<td>
	                            <td><input type="number"  id="cart_count" name="CART_COUNT" ><td>
							</tr>
							<tr>
	                            <td>결제금액<td>
	                            <td><input type="text"  id="cart_totalPrice" name="CART_TOTALPRICE" ><td>
							</tr>
					</table>

					<div class="col-lg-12" style="margin-right:32%;">
						<button type="button" id="deleteBtn"
							class="btn btn-outline btn-primary pull-right">닫기</button>
						<button type="button" id="updateBtn"
							class="btn btn-outline btn-primary pull-right">수정</button>
					</div>
				</div>
				<a class="modal_close_btn" style="display: none;">닫기</a>
			</form>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<!-- Channel Plugin Scripts -->
	<script type="text/javascript">
	
	function returnList(url,formData){
		$.ajax({
		      url: url,
		      data: formData ,
		      type: 'post',
		      dataType:'json',
		      success: function(data){
		    	  alert('장바구니 정보가 저장되었습니다');
		    	  window.location.href = "/cart/list";
		      },error:function(data){
		    	  console.log("SSSDASDASD")
		      }
		}); 
		
	}
		function modal(id,cart_code,cart_price,cart_count,cart_totalPrice) {
			var zIndex = 9999;
			var modal = document.getElementById(id);
			
			$("#cart_code").val(cart_code);
			$("#cart_price").val(cart_price);
			$("#cart_count").val(cart_count);
			$("#cart_totalPrice").val(cart_totalPrice);

			// 모달 div 뒤에 희끄무레한 레이어
			var bg = document.createElement('div');
			bg.setStyle({
				position : 'fixed',
				zIndex : zIndex,
				left : '0px',
				top : '0px',
				width : '100%',
				height : '100%',
				overflow : 'auto',
				// 레이어 색갈은 여기서 바꾸면 됨
				backgroundColor : 'rgba(0,0,0,0.4)'
			});
			document.body.append(bg);

			modal.querySelector('#updateBtn').addEventListener(
					'click', function() {
						var formData = $("#cartForm").serialize();
						var conf = confirm("저장하시겠습니까?");
						
						if (conf){
							
							$.ajax({
							      url: '/cart/updateCart',
							      data: formData ,
							      type: 'post',
							      dataType:'json',
							      success: function(data){
							    	  
							    	  bg.remove();
							    	  
							      },error:function(result){
							    	  bg.remove();
							      }
							}); 
							
						}else{
							bg.remove();
						}
						
						modal.style.display = 'none';
						
						returnList("/cart/list",formData);
					});

			modal.querySelector('#deleteBtn').addEventListener(
					'click', function() {
						bg.remove();
						modal.style.display = 'none';
					});

			modal
					.setStyle({
						width	: '500px',
						height	: '500px',
						position : 'fixed',
						display : 'block',
						boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

						// 시꺼먼 레이어 보다 한칸 위에 보이기
						zIndex : zIndex + 1,

						// div center 정렬
						top : '50%',
						left : '50%',
						transform : 'translate(-50%, -50%)',
						msTransform : 'translate(-50%, -50%)',
						webkitTransform : 'translate(-50%, -50%)'
					});
		}

		// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
		Element.prototype.setStyle = function(styles) {
			for ( var k in styles)
				this.style[k] = styles[k];
			return this;
		};

		/* $(".cart_class").click(function() {

			modal('my_modal');
		}); */
		
		$("#cart_table").on('click','tr',function(e) {
			var test = e.target.cellIndex;
			var td = $(this).children();
			
			var cart_code = td.eq(0).text();
			var cart_price = td.eq(3).text();
			var cart_count = td.eq(4).text();
			var cart_totalPrice = td.eq(5).text();
			
			modal('my_modal',cart_code,cart_price,cart_count,cart_totalPrice);
		});
		
		(function() {
			var w = window;
			if (w.ChannelIO) {
				return (window.console.error || window.console.log || function() {
				})('ChannelIO script included twice.');
			}
			var ch = function() {
				ch.c(arguments);
			};
			ch.q = [];
			ch.c = function(args) {
				ch.q.push(args);
			};
			w.ChannelIO = ch;
			function l() {
				if (w.ChannelIOInitialized) {
					return;
				}
				w.ChannelIOInitialized = true;
				var s = document.createElement('script');
				s.type = 'text/javascript';
				s.async = true;
				s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
				s.charset = 'UTF-8';
				var x = document.getElementsByTagName('script')[0];
				x.parentNode.insertBefore(s, x);
			}
			if (document.readyState === 'complete') {
				l();
			} else if (window.attachEvent) {
				window.attachEvent('onload', l);
			} else {
				window.addEventListener('DOMContentLoaded', l, false);
				window.addEventListener('load', l, false);
			}
		})();
		ChannelIO('boot', {
			"pluginKey" : "2b7df929-35a8-43dc-9292-2312922bf727"
		});
	</script>
	<!-- End Channel Plugin -->

</body>
	<!-- Footer -->
</html>