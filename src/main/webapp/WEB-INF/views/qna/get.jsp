<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

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
body {
	  padding-top: 100px;
	  padding-bottom: 30px;
}
</style>

<body>

	<!-- 게시글 읽기 -->
	<article>
		<div class="container" role="main">
			<h2>Q&A</h2>
			<form name="form" id="form" role="form">

				<div class="mb-3">
					<label for="tag">NO.</label> <input type="text"
						class="form-control" name='qno' id="tag"
						value='<c:out value="${board.qno}" />' readonly="readonly">
				</div>


				<div class="mb-3">
					<label for="title">제목</label> <input class="form-control"
						name='q_title' id="title"
						value='<c:out value="${board.q_title}" />' readonly="readonly">
				</div>

				<div class="mb-3">
					<label for="reg_id">작성자</label> <input class="form-control"
						name='q_writer' id="reg_id"
						value='<c:out value="${board.q_writer}" />' readonly="readonly">
				</div>

				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name='q_content'
						id="content" readonly="readonly">
					<c:out value="${board.q_content}" />
					</textarea>
				</div>

			</form>

			<div>
				<button type="button" class="btn btn-sm btn-primary" id="btnList"
					onclick="location.href='/qna/list'">목록</button>

				<sec:authentication property="principal" var ="userinfo"/>
     	<sec:authorize access="isAuthenticated()">
          <c:if test="${userinfo.user.USER_NICKNAME eq board.q_writer }"> 
				<button data-oper='modify' class="btn btn-sm btn-primary"
					onclick="location.href='/qna/modify?qno=<c:out value="${board.qno}"/>'">수정</button>
				</c:if>
 		</sec:authorize> 

			</div>
		</div>
	</article>



	<form id='operForm' action="/qna/modify" method="get">
		<input type='hidden' id='qno' name='qno'
			value='<c:out value="${board.qno}"/>'> <input type='hidden'
			name='pageNum' value='<c:out value="${cri.pageNum}"/>'> <input
			type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
		<input type='hidden' name='keyword'
			value='<c:out value="${cri.keyword}"/>'> <input type='hidden'
			name='type' value='<c:out value="${cri.type}"/>'>
	</form>


	<br><br>

	<div class="container" role="main">
	<h6 class="border-bottom pb-2 mb-0">댓글</h6>

	<c:forEach items="${replyList}" var="replyList">
		<div class="reply">
			<div class="media text-muted pt-3">
				<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32"
					xmlns="http://www.w3.org/2000/svg"
					preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
					aria-label="Placeholder:32x32">
				    <title>Placeholder</title>
				     <image href="/resources/img/icon.png" width=100% height=100%></image>
				     </svg>
				<p
					class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">
					<span class="d-block"> <strong class="text-gray-dark">
							${replyList.replyer} </strong> <span
						style="padding-left: 7px; font-size: 9pt"> </span>
					</span> ${replyList.reply}
				</p>
			</div>

		</div>

	</c:forEach>

</div>













</body>
</html>