<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<div class="wrapper">
	<div class="wrap">
		<div class="top_gnb_area">
		 <ul class="list">
            <sec:authorize access="isAnonymous()">
                <li ><a href="/customLogin">로그인</a></li>
                <li><a href="/users/insert">회원가입</a></li>
                <li> 고객센터</li>
 		  </sec:authorize>          
               
          <sec:authorize access="isAuthenticated()">
                <li > 회원 : <sec:authentication property="principal.user.USER_ID" /></li>
                <li>  닉네임 :<sec:authentication property="principal.user.USER_NICKNAME" /></li>
                <li><a href="/customLogout">로그아웃</a></li>
                
 		  </sec:authorize>          
            </ul>  
			<div class="clearfix"></div>			
		</div>
	</div>
</div>
<h1 style="text-align: center;">연습용 메인페이지입니다</h1>
<form action="/qna/list">
<div class="login_button_wrap">
<input type="submit" value="Q&A게시판">
</div>
</form>
<div align="center">
  <button class="btn btn-primary" type="button" onclick="location.href='/board/list'">공지사항 게시판</button>
</div>

<div>
	<button class="btn btn primary" type="button" onclick="location.href='/group/list'">상품 후기 게시판</button>
</div>

<form action = "regist" method = "get">
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
        <td><a href='/read?pdcode=${PdVo.pd_code}'>${PdVo.pd_title}</a></td>
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