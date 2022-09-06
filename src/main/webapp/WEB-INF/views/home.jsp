<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link href="/resources/css/bootstrap.css" rel="stylesheet" />
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
	<title>Home</title>
</head>
<body>
<h1>연습용 메인페이지입니다</h1>
<form action="/qna/list">
<div class="login_button_wrap">
<input type="submit" value="Q&A게시판">
</div>
</form>
<form action="/users/insert">
<div class="login_button_wrap">
<input type="submit"  value="회원가입">
</div>	
</form>
<form action="/users/login">
<div class="login_button_wrap">
<input type="submit"  value="로그인">
</div>	
</form>
<div align="center">
  <button class="btn btn-primary" type="button" onclick="location.href='/board/list'">공지사항 게시판</button>
</div>
</body>
</html>