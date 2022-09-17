<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="java.util.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <link rel="stylesheet" href="/resources/css/login1.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> <c:out value="${error}"/> </h2>
<h2> <c:out value="${logout}"/> </h2>
    <section class="login-form">
        <h1>Login</h1>
        <form action="/login" method="post">
            <div class="int-area">
                <input type="text" name="username" id="id"  autocomplete="off"  required>
                <label for="id">USER NAME</label>
            </div>
            <div class="int-area">
                <input type="password" name="password" id="pw"  autocomplete="off"  required>
                <label for="pw">PASSWORD</label>
            </div>
            <div class="btn-area">
                <button id="btn" type="submit">LOGIN</button>
            </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        </form>
       <div class="btn-area">
                <button id="btn" type="button" onclick="location.href='/users/insert'">회원가입</button>
            </div>
     
    </section>

    <script>       
        let id = $('#id');
        let pw = $('#pw');
        let btn = $('#btn');
        
        $(btn).on('click', function() {
            if($(id).val() == "") {
                $(id).next('label').addClass('warning');
                setTimeout(function() {
                    $('label').removeClass('warning');
                }, 1500);
            }
            else if($(pw).val() == "") {
                $(pw).next('label').addClass('warning');
                setTimeout(function() {
                    $('label').removeClass('warning');
                }, 1500);
            }
        });
    </script> 

</body>
</html>
