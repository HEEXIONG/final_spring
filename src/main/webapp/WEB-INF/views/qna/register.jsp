<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<style>
.aaa{
	padding-top: 150px;
}
</style>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<article class="aaa">
		<div class="container" role="main">
			<h2>Q&A</h2>
			<form role="form" action="/qna/register" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 

				<div class="mb-3">
					<label for="title">제목</label> <input class="form-control"
						name='q_title' id="title" >
				</div>

				<div class="mb-3">
					<label for="reg_id">작성자</label> 
					<input class="form-control"
						name='q_writer' value='<sec:authentication property="principal.user.USER_NICKNAME"/>' readonly="readonly">
				</div>

				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name='q_content'
						>
					<c:out value="${get.q_content}" />
					</textarea>
				</div>
				<div>
				<button type="submit" class="btn btn-sm btn-primary">글 등록
            			</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList"
					onclick="location.href='/qna/list'">취소</button>
				</div>

			</form>
		</div>
	</article>








</body>
</html>