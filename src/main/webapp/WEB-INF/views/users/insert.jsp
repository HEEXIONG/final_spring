<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
	.id_not_exist{
		color : green;
		display : none;
	}
	
	.id_exist{
		color : red;
		display : none;
	}
	.nick_not_exist{
		color : green;
		display : none;
	}
	
	.nick_exist{
		color : red;
		display : none;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/users/insert" method="post">


아이디:<input class="USER_ID" name="USER_ID"><br/>
<span class="id_not_exist">사용 가능한 아이디입니다</span>
<span class="id_exist">아이디가 이미 존재합니다.</span>
<br />


비밀번호:<input class="USER_PW" name="USER_PW"><br/>
닉네임 : <input class="USER_NICKNAME" name="USER_NICKNAME"><br/>
<span class="nick_not_exist">사용 가능한 닉네임입니다</span>
<span class="nick_exist">닉네임이 이미 존재합니다.</span>
<br />
핸드폰 : <input class="USER_PHONE" name="USER_PHONE"><br/>
이메일 : <input class="USER_EMAIL" name="USER_EMAIL"><br/>
<div class="address_button" onclick="execution_daum_address()">
<span>주소찾기</span>
</div>
우편번호 : <input class="USER_POST" name="USER_POST" readonly="readonly"><br/>
주소:<input class="USER_ADDR1" name="USER_ADDR1" readonly="readonly"><br/>
상세 주소:<input class="USER_ADDR2" name="USER_ADDR2" readonly="readonly"><br/>
<input type="submit">

</form>




<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

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






$(".USER_ID").on("propertychange change keyup paste input",function(){
	//console.log("중복 테스트")
	var userId = $('.USER_ID').val();
	var data = {userId:userId} //'컨트롤에 넘길 데이터 이름 : 실제 데이터'
	$.ajax({
		type :"post",
		url : "/users/userIdChk",
		data : data,
		success : function(result){
			//console.log("성공 여부" + result);
			if(result != 'fail'){
				$(".id_not_exist").css("display","inline-block");
				$(".id_exist").css("display","none");
			}else{
				$(".id_exist").css("display","inline-block");
				$(".id_not_exist").css("display","none");
			}
		}
 	}); //ajax 종료
});
$(".USER_NICKNAME").on("propertychange change keyup paste input",function(){
	//console.log("중복 테스트")
	var usernick = $('.USER_NICKNAME').val();
	var data = {usernick:usernick} //'컨트롤에 넘길 데이터 이름 : 실제 데이터'
	$.ajax({
		type :"post",
		url : "/users/usernickChk",
		data : data,
		success : function(result){
			//console.log("성공 여부" + result);
			if(result != 'fail'){
				$(".nick_not_exist").css("display","inline-block");
				$(".nick_exist").css("display","none");
			}else{
				$(".nick_exist").css("display","inline-block");
				$(".nick_not_exist").css("display","none");
			}
		}
 	}); //ajax 종료
});
</script>
</body>
</html>