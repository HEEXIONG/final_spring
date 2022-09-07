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
<form>
<p><label>글번호</label> <input type="text" name ="bno" value ="${pdvo.bno}" readonly="readonly"></p>
<p><label>제목</label> <input type="text" name ="title" style="background-color:#B0E0E6;" value ="${pdvo.title}" readonly="readonly"></p>
<p><label>작성자</label> <input type="text" name="writer" size="15" value = "${pdvo.writer}"readonly="readonly"><p>
<label>내용</label> <textarea name=content rows ="10" cols="70"  style="background-color:#B0E0E6;"    readonly="readonly">${pdvo.content}</textarea><br>
<p><label>가격</label> <input type="text" name="writer" size="15" value = "${pdvo.writer}"readonly="readonly"><p>
<p><label>작성일</label> <input type="text" name="writer" size="15" value = "${pdvo.writer}"readonly="readonly"><p>
<button type="submit" formaction="listAll" formmethod="get">목록</button>
</form>
</body>
</html>