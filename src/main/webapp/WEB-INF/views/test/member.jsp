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
<h1>member</h1>

<p>principal : <sec:authentication property="principal" /> </p>
<p>UsersVO : <sec:authentication property="principal.user" /> </p>
<p>사용자이름 : <sec:authentication property="principal.user.USER_NICKNAME" /> </p>
<p>사용자아이디 : <sec:authentication property="principal.username" /> </p>
<p>사용자아이디 : <sec:authentication property="principal.user.USER_ID" /> </p>
<p>사용자 권한 리스트 : <sec:authentication property="principal.user.authList" /> </p> 
 



<a href="/customLogout">Logout</a>
</body>
</html>