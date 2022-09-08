<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html> 
<html>
<head>
<title>글상세보기</title>
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
<button type="submit" onclick="location.href='/pdregist/list'" formmethod="get">목록</button>
</body>
</html>