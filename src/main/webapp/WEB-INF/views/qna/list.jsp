<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="page-wrapper">
    <div class="container-fluid">
        <div class="col-lg-8"><!--게시판 넓이 -->
            <div class="col-lg-12">
                <h1 class="page-header">Q&A 게시판</h1>
            </div>
            <div class="row">
                  <div class="col-lg-12">
                      <button type="button" class="btn btn-outline btn-primary pull-right" >
                          <i class="fa fa-edit fa-fw"></i> Q&A 작성
                      </button>
                  </div>
              </div>
            <div class="panel panel-default">
                <div class="panel-heading"> Q&A </div>
                <div class="panel-body">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>No.1</th>
                                <th>제목</th>
                                <th>내용</th>
                              
                                <th>작성자</th>
                                <th>작성일자</th>
                                <th>수정일자</th>
                            </tr>
                        </thead>
                        
                        <tbody>
                        <c:forEach items="${list}" var="QnaVO">
                            <tr>
                                <td><c:out value="${QnaVO.qno}"/></td>
                                <td><a href='/qna/get?qno=<c:out value="${QnaVO.qno}"/>'>
                                <c:out value="${QnaVO.q_title}"/></a></td>
                                <td><c:out value="${QnaVO.q_content}"/></td>
                                <td><c:out value="${QnaVO.q_writer}"/></td>
                               
                                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${QnaVO.regdate}"/></td>
                                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${QnaVO.updatedate}"/></td>
                            </tr>
                         </c:forEach>   
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>