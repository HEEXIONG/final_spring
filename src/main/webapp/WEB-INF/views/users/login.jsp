<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.login_warn{
margin-bottom : 10px;
text-align: left;
color: red;
}
</style>
<title>Insert title here</title>
</head>
<body>

<div class="wrapper">
	
	<div class="wrap">
	<form action="/users/login" method="post">
		<div class="logo_wrap">
			<span>Login</span>
		</div>
		<div class="login_wrap"> 
			<div class="id_wrap">
					<div class="id_input_box">
					ID<input class="id_input" name="USER_ID">
				</div>
			</div>
			<div class="pw_wrap">
				<div class="pw_input_box">
					PW<input class="pw_iput" name="USER_PW">
				</div>
			</div>
			<c:if test="${result == 0}">
			<div class="login_warn">ID또는PW를 잘못 입력 하셨습니다.</div>
			</c:if>
			<div class="login_button_wrap">
				<input type="submit" class="login_button" value="로그인">
			</div>			
		</div>
		
		</form>
	</div>

</div>

</body>
</html>
