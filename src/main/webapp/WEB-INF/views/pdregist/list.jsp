<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cef989f3a7776ee7b40c53b31db405fa&libraries=services,clusterer"></script>


<link href="/resources/css/bootstrap.css" rel="stylesheet" />
<style type="text/css">
.login_button_wrap {
	margin-top: 40px;
	text-align: center;
}

.login_button {
	width: 84%;
	height: 80px;
	background-color: #6AAFE6;
	font-size: 40px;
	font-weight: 900;
	color: white;
	margin: auto;
}
</style>
<title>Home</title>
</head>
<body>
	<h1>연습용 메인페이지입니다</h1>

	<div id="map" style="width: 100%; height: 350px;"></div>
	<script>
		var mapContainer = document.getElementById('map'), 
		mapOption = {
		center: new kakao.maps.LatLng(33.450701, 126.570667), 
		}; 
		var map = new kakao.maps.Map(mapContainer, mapOption);
	</script>


	<form action="/qna/list">
		<div class="login_button_wrap">
			<input type="submit" value="Q&A게시판">
		</div>
	</form>
	<form action="/users/insert">
		<div class="login_button_wrap">
			<input type="submit" class="login_button" value="유저로그인">
		</div>
	</form>
	<div align="center">
		<button class="btn btn-primary" type="button"
			onclick="location.href='/board/list'">공지사항 게시판</button>
	</div>

	<form action="regist" method="get">
		<table border="1" width="880">
			<tr>
				<td width="77">
					<p align="center">글번호</p>
				</td>

				<td width="327">
					<p align="center">제목</p>
				</td>
				<td width="197">
					<p align="center">작성자</p>
				</td>
				<td width="155">
					<p align="center">상품등록일</p>
				</td>
				<td width="90">
					<p align="center">가격</p>
				</td>
			</tr>

			<c:forEach items="${list}" var="PdVo">
				<tr>
					<td>${PdVo.pd_code}</td>
					<td><a href='./read?pd_code=${PdVo.pd_code}'>${PdVo.pd_title}</a></td>
					<td>${PdVo.admin}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${PdVo.regdate}" /></td>
					<td><span class="badge bg-red">${PdVo.price}</span></td>
				</tr>
			</c:forEach>
		</table>
	</form>

</body>
</html>