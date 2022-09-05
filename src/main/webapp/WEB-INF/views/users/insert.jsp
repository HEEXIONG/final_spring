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
	/* 중복아이디 존재하는 경우 */
	.id_exist{
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


비밀번호:<input name="USER_PW"><br/>
닉네임 : <input name="USER_NICKNAME"><br/>
핸드폰 : <input name="USER_PHONE"><br/>
이메일 : <input name="USER_EMAIL"><br/>
우편번호 : <input name="USER_POST"><br/>
주소:<input name="USER_ADDR1"><br/>
상세 주소:<input name="USER_ADDR2"><br/>
<input type="submit">

</form>






<script type="text/javascript">
$(".USER_ID").on("propertychange change keyup paste input",function(){
	//console.log("중복 테스트")
	var userId = $('.USER_ID').val();
	var data = {userId:userId} //'컨트롤에 넘길 데이터 이름 : 실제 데이터'
	$.ajax({
		type:"post",
		url: "/users/userIdChk",
		data:data
	}); 
});
</script>
</body>
</html>