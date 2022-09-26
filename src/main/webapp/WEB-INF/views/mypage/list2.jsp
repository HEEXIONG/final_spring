
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
    <title>Checkout example · Bootstrap v5.2</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/checkout/">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<meta name="theme-color" content="#712cf9">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
    </style>

    
    <!-- Custom styles for this template -->
  </head>
  <body class="bg-light">
    
<div class="container">
  <main>
    <div class="py-5 text-center">
      <h2>my page</h2>
    </div>

    <div class="row g-5">
      <div class="col-md-5 col-lg-4 order-md-last">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
          <span class="text-primary">Your cart</span>
          <span class="badge bg-primary rounded-pill">3</span>
        </h4>
        <ul class="list-group mb-3">
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">Product name</h6>
              <small class="text-muted">Brief description</small>
            </div>
            <span class="text-muted">$12</span>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">Second product</h6>
              <small class="text-muted">Brief description</small>
            </div>
            <span class="text-muted">$8</span>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">Third item</h6>
              <small class="text-muted">Brief description</small>
            </div>
            <span class="text-muted">$5</span>
          </li>
          <li class="list-group-item d-flex justify-content-between bg-light">
            <div class="text-success">
              <h6 class="my-0">Promo code</h6>
              <small>EXAMPLECODE</small>
            </div>
            <span class="text-success">−$5</span>
          </li>
          <li class="list-group-item d-flex justify-content-between">
            <span>Total (USD)</span>
            <strong>$20</strong>
          </li>
        </ul>

          <div class="input-group">
            <input type="text" class="form-control" placeholder="Promo code">
            <button type="submit" class="btn btn-secondary">Redeem</button>
          </div>
      </div>
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">회원정보 보기</h4>
        <form id ="mypageForm" >
        	<c:forEach items="${list}" var="MypageVO">
	          <div class="row g-3">
	            <div class="col-sm-6">
	              <label for="firstName" class="form-label">유저 ID</label>
	              <input type="text" class="form-control" id="firstName" name="USER_ID" placeholder="" value="<c:out value="${MypageVO.USER_ID}"/>" required>
	              <div class="invalid-feedback">
	                Valid first name is required.
	              </div>
	            </div>
	
	            <div class="col-sm-6">
	              <label for="lastName" class="form-label">Password</label>
	              <input type="password" class="form-control" id="lastName" name="USER_PW" placeholder="" value="<c:out value="${MypageVO.USER_PW}"/>'" required>
	              <div class="invalid-feedback">
	                Valid last name is required.
	              </div>
	            </div>
	
	            <div class="col-12">
	              <label for="username" class="form-label">Username</label>
	              <div class="input-group has-validation">
	                <input type="text" class="form-control" id="username" name="USER_NICKNAME" placeholder="Username" value="<c:out value="${MypageVO.USER_NICKNAME}"/>">
	              <div class="invalid-feedback">
	                  Your username is required.
	                </div>
	              </div>
	            </div>
	            
	            <div class="col-12">
	              <label for="username" class="form-label">PhoneNumber</label>
	              <div class="input-group has-validation">
	                <input type="text" class="form-control" id="USER_PHONE" name="USER_PHONE" placeholder="Username" value="<c:out value="${MypageVO.USER_PHONE}"/>">
	              <div class="invalid-feedback">
	                  Your username is required.
	                </div>
	              </div>
	            </div>
	
	            <div class="col-12">
	              <label for="email" class="form-label">Email <span class="text-muted">(Optional)</span></label>
	              <input type="email" class="form-control" id="email" name="USER_EMAIL" placeholder="you@example.com" value='<c:out value="${MypageVO.USER_EMAIL}"/>'>
	              <div class="invalid-feedback">
	                Please enter a valid email address for shipping updates.
	              </div>
	            </div>
	            
	            <div class="col-12">
				  <button class="w-100 btn btn-primary btn-lg" type="submit" onclick="execution_daum_address()">주소찾기</button>
	            </div>
	            
	            <div class="col-12">
	              
	              <div class="col-sm-3">
	              <label for="address" class="form-label USER_POST" >addr_num</label>
	              	<input type="text" class="form-control USER_ADDR1" id="USER_POST"  name = "USER_POST" placeholder="addr_num" value='<c:out value="${MypageVO.USER_POST}"/>'>
	              </div>
	              <div class="col-sm-8"> 
	              <label for="address" class="form-label">Address</label>
	              	<input type="text" class="form-control USER_ADDR1" id="address" name="USER_ADDR1" placeholder="1234 Main St" value='<c:out value="${MypageVO.USER_ADDRESS}"/>'>
	              </div>
	            </div>
	
	            <div class="col-12">
	              <label for="address2" class="form-label">Address 2 <span class="text-muted">(Optional)</span></label>
	              <input type="text" class="form-control USER_ADDR2" id="address2" name="USER_ADDR2" placeholder="Apartment or suite">
	            </div>
	
	          </div>
	
	          <hr class="my-4">
	
	          <button id="updateBtn" class="w-100 btn btn-primary btn-lg" type="submit">save</button>
          </c:forEach>
        </form>
      </div>
    </div>
  </main>

  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2017–2022 Company Name</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="#">Privacy</a></li>
      <li class="list-inline-item"><a href="#">Terms</a></li>
      <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
  </footer>
</div>



      <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	
	var userId = $("#userId").val();
	var user_no = $("#user_no").val();
	user_no*=1;
	
	function returnList(url,formData){
		$.ajax({
		      url: url,
		      data: formData ,
		      type: 'post',
		      dataType:'json',
		      beforeSend : function(xhr)
		        {   
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		        },
		      success: function(data){
		    	  alert('회원님의 정보가 저장되었습니다');
		      }
		}); 
		
	}
	//저장버튼 클릭
	$("#updateBtn").click(function(){
		var conf = confirm("저장하시겠습니까?");
		if (conf){
			
			var formData = $("#mypageForm").serialize();
			formData.userId = userId;
			formData.no = user_no;
			
			console.log('go_to_update')
			console.log(formData);
			$.ajax({
			      url: '/mypage/update',
			      data: formData ,
			      type: 'post',
			      dataType:'json',
			      beforeSend : function(xhr)
			        {   
			            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			        },
			      success: function(data){
			    	  console.log("AAA")
			          console.log(data); 
			    	  returnList('/mypage/list',formData);
			      },error:function(result){
			    	  console.log(result);
			      }
			}); 
			}
	});
	
	//주소 api 시작////////////////////////////////////////////////////////
	function execution_daum_address(){
		new daum.Postcode({
			 oncomplete: function(data) {
	             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	             // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	             var addr = ''; // 주소 변수
	             var extraAddr = ''; // 참고항목 변수

	             //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	             if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                 addr = data.roadAddress;
	             } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                 addr = data.jibunAddress;
	             }

	             // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	             if(data.userSelectedType === 'R'){
	                 // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                 // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                 if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                     extraAddr += data.bname;
	                 }
	                 // 건물명이 있고, 공동주택일 경우 추가한다.
	                 if(data.buildingName !== '' && data.apartment === 'Y'){
	                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                 }
	                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                 if(extraAddr !== ''){
	                     extraAddr = ' (' + extraAddr + ')';
	                 }
	                 // 조합된 참고항목을 해당 필드에 넣는다.
	                // document.getElementById("sample6_extraAddress").value = extraAddr;
	                 addr += extraAddr
	             
	             } else {
	                 //document.getElementById("sample6_extraAddress").value = '';
	                 addr += ' '
	             }

	             // 우편번호와 주소 정보를 해당 필드에 넣는다.
	             //document.getElementById('sample6_postcode').value = data.zonecode;
	             $(".USER_POST").val(data.zonecode);
	            // document.getElementById("sample6_address").value = addr;
	             $(".USER_ADDR1").val(addr)
	             // 커서를 상세주소 필드로 이동한다.
	            // document.getElementById("sample6_detailAddress").focus();
	             $(".USER_ADDR2").attr("readonly",false);
	             $(".USER_ADDR2").focus();
	         }
	     }).open();
	    
	}
</script>
  </body>
</html>
