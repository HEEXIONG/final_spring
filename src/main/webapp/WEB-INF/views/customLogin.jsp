<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="java.util.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>




<h1>로그인 페이지 커스텀</h1>
<h2> <c:out value="${error}"/> </h2>
<h2> <c:out value="${logout}"/> </h2>
<form action="/login" method="post">
<div>
<input type="text" name="username" value="user">
</div>
<div>
<input type="password" name="password" value="user">
</div>
<input type="checkbox" name="remember-me">Remember Me
<div>
<input type="submit">
</div>
<div>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<a href="/">메인으로</a>
</div>



</form>
</body>
</html>
