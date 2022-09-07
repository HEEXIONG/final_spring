<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>

<link href="/resources/css/bootstrap.css" rel="stylesheet" /> 
<link href="/resources/css/main.css" rel="stylesheet" />
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
<!-- ================================================================================ -->
<div class="wrapper">
	<div class="wrap">
		<div class="top_gnb_area">
		 <ul class="list">
		 <c:if test="${user == null}">
                <li ><a href="/users/login">로그인</a></li>
                <li><a href="/users/insert">회원가입</a></li>
                <li> 고객센터</li>
                </c:if>
                <c:if test="${user != null}">
                <li > 회원 : ${user.USER_ID}</li>
                <li>  닉네임 : ${user.USER_NICKNAME}</li>
                <li><a href="/users/logout">로그아웃</a></li>
                </c:if>            
            </ul>  
			<div class="clearfix"></div>			
		</div>
	</div>
</div>
<!-- ================================================================================ -->
<h1 style="text-align: center;">연습용 메인페이지입니다</h1>
<form action="/qna/list">
<div class="login_button_wrap">
<input type="submit" value="Q&A게시판">
</div>
</form>
<div align="center">
  <button class="btn btn-primary" type="button" onclick="location.href='/board/list'">공지사항 게시판</button>
</div>
</body>
</html>