<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/bootstrap.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
	<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header" align="center">공지 사항</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row" align="center">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <h5 class="panel-heading">${board.ntitle}</h5>
      <!-- /.panel-heading -->
      <div class="panel-body">

        
		<!-- 
        <div class="form-group">
          <label></label> <input class="form-control" name='ntitle'
             value='${board.ntitle}' readonly="readonly">
        </div>
         -->
        <div class="form-group">
          <!-- <label>NContent</label> -->
          <textarea class="form-control" rows="3" name='ncontent'
            readonly="readonly">${board.ncontent}</textarea>
        </div>

		<div class="form-group"> 
          <label>글 번호</label> <input class="form-control center" name='nbno'
             value='${board.nbno}' readonly="readonly">
        </div>

        <div class="form-group">
          <label>작성자</label> <input class="form-control center" name='nwriter' value='${board.nwriter}'
             readonly="readonly">
        </div>

<button data-oper='list' class="btn btn-outline-light" onclick="location.href='list'" style="color: black !important;">List</button>

<!-- page 317 jsp 소스 코딩 시작 : Page345 조회 페이지에서 검색 처리 jsp 소스 추가 코딩 시작 -->
<form id='operForm' action="/board/list" method="get">
	<input type='hidden' id='nbno' name='nbno' value='<c:out value="${board.nbno}"/>'>
	<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
	<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
</form>
      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>