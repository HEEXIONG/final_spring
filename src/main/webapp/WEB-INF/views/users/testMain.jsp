<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.login_button_wrap{
	margin-top: 40px;
	text-align: center;
}
.login_button{
	width: 84%;
    height: 80px;
    background-color: #6AAFE6;
    font-size: 40px;
    font-weight: 900;
    color: white;
    margin : auto;
</style>
<title>Insert title here</title>
</head>
<body>
<h1>연습용 메인페이지입니다</h1>
<form action="/users/insert">
<div class="login_button_wrap">
<input type="submit" class="login_button" value="유저로그인">
</div>	
</form>
</body>
</html>