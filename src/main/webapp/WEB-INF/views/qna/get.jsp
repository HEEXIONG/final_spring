<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

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
          <sec:authentication property="principal" var ="userinfo"/>
          <sec:authorize access="isAuthenticated()">
          
          <c:if test="${userinfo.user.USER_NICKNAME eq board.q_writer }">
    <button data-oper='modify' class="" onclick="location.href='/qna/modify?qno=<c:out value="${board.qno}"/>'">수정</button>   
 </c:if>
 </sec:authorize>
	<button data-oper='list' class="" onclick="location.href='/qna/list'">리스트</button>
 <form id='operForm' action="/qna/modify" method="get">
	<input type='hidden' id='qno' name='qno' value='<c:out value="${board.qno}"/>'>
	<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
	<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
</form>    


<div id="reply">
  <ul class="replyList">
    <c:forEach items="${replyList}" var="replyList">
      <li>
        <p>
        작성자 : ${replyList.replyer}<br />
        작성 날짜 :  <fmt:formatDate value="${replyList.replyDate}" pattern="yyyy-MM-dd" />
        </p>

        <p>댓글 내용: ${replyList.reply}</p>
      </li>
    </c:forEach>   
  </ul>
</div>

<!-- <div class='row'>
  <div class="col-lg-12">    
    /.panel
     <div class="panel panel-default">
   
			<div class="panel-heading">
      	      	<i class="fa fa-comments fa-fw"></i> 댓글
      	      	
      	      		<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">댓글작성</button>
      	      </div>


      	/.panel-heading
      	<div class="panel-body">  
      	
      	    <ul class="chat">
      	       start reply
      	    	<li class="left clearfix" data-rno='12'>
      	    		<div>
      	    		<div class="header">
      	    			<strong class="primary-font">user00</strong>
      	    			<small class="pull-right text-muted">2022-07-31 13:20</small>
      	    		</div>
      	    		<p>Good job!</p>
	      	    	</div>
	      	    </li>
				Page414 댓글 목록 처리 get jsp 소스 코딩 끝
	        </ul>
    	</div>
    	/.panel .chat-panel
     </div>	
  </div>
  ./ end row
</div>

 -->


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>      
<script type="text/javascript" src="/resources/js/reply.js"></script>

<script type="text/javascript">
 	$(document).ready(function(){
		var bnoValue = '<c:out value="${board.qno}"/>';
		var replyUL = $(".chat");
		console.log("1");
		showList(1);
		
		function showList(page){
			replyService.getList({qno:bnoValue, page: page|| 1}, function(list) {
				console.log(list);
				console.log("show list : " + page);
				var str = "";
				if(list == null || list.length == 0){
					replyUL.html("");
					return;
				}
				for (var i = 0, len = list.length || 0; i < len; i++){
					str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
					
					str +="	<div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
					
					str +="		<small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
					
					str +="			<p>"+list[i].reply+"</p></div></li>";
		}
				replyUL.html(str);
				console.log(list);
		
	});
			
	}
		
	});	
	 

</script>

<script type="text/javascript">
	console.log("=========================");
	console.log("js test");
	
	var bnoValue = '<c:out value="${board.qno}"/>';

/* 	replyService.getList({qno:bnoValue, page:1},function(list){
		for(var i = 0, len = list.length||0; i < len; i++){
			console.log(list[i]);
		}
	}); */

/* 	replyService.remove(13, function(count){
		
		console.log(count);
		
		if(count == "success"){
			alert("삭제!!!");
		}
	}, function(err){
		alert("에러~~");
	}); */

	/*  replyService.update({
		rno : 14,
		qno : bnoValue,
		reply : "댓글 수정 테스트"
	}, function(result){
		alert("수정완료");
	}); */ 
	
	/* replyService.get(14, function(data){
		console.log(data)
	}) */
	
</script>



</body>
</html>