<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<div class="form-group">
          <label>NO.</label> <input class="form-control" name='qno'
             value='<c:out value="${board.qno}" />' readonly="readonly">
        </div>

          <div class="form-group">
            <label>Title</label> 
            <input class="form-control" name='q_title'
            value='<c:out value="${board.q_title}" />' readonly="readonly">
          </div>

          <div class="form-group">
          <label>Text area</label>
          <textarea class="form-control" rows="3" name='q_content'
            readonly="readonly"><c:out value="${board.q_content}" /></textarea>
        </div>

          <div class="form-group">
            <label>Writer</label>
       		<input class="form-control" name='q_writer'
       		 value='<c:out value="${board.q_writer}" />' readonly="readonly"
       		>
       
          </div>
    <button data-oper='modify' class="" onclick="location.href='/qna/modify?qno=<c:out value="${board.qno}"/>'">수정</button>   
 
	<button data-oper='list' class="" onclick="location.href='/qna/list'">리스트</button>
 <form id='operForm' action="/qna/modify" method="get">
	<input type='hidden' id='qno' name='qno' value='<c:out value="${board.qno}"/>'>
	<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
	<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
</form>    

       







</body>
</html>