<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		
		<form role="form" action="/qna/modify" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
	  
		
		<div class="form-group">
          <label>NO.</label> <input class="form-control" name='qno'
             value="${board.qno}" readonly="readonly">
        </div>

          <div class="form-group">
            <label>Title</label> 
            <input class="form-control" name='q_title'
            value="${board.q_title}" >
          </div>

          <div class="form-group">
		  <label>Text area</label>		  
		  <textarea class="form-control" rows="3" name='q_content' >
		  	${board.q_content}
		  </textarea>
		</div>

          <div class="form-group">
            <label>Writer</label>
       		<input class="form-control" name='q_writer'
       		 value="${board.q_writer}"  readonly="readonly"
       		>
       
          </div>
    <button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
   <button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>    
	<button data-oper='list' onclick="location.href='/qna/list'">리스트</button>
       
	</form>
	
</body>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
				$(document).ready(function() {
					var formObj = $("form");
					
					$('button').on("click", function(e) {
						// form 태그의 모든 버튼은 기본적으로 submit으로 처리하기 때문에
						// e.preventDefault()로 기본 동작을 막고 마지막에 직접 submit()을 수행합니다.
						e.preventDefault();
						// 자바스크립트에서는 button 태그의 'data-oper' 속성을 이용해서
						// 원하는 기능을 동작하도록 처리합니다.
						var operation = $(this).data("oper");
						
						console.log(operation);
						
						if(operation === 'remove'){
							formObj.attr("action", "/qna/remove");
						} else if(operation === 'list'){
							console.log("@@@@@@@@@@@@@@");
							// move to list
							// 수정된 내용은 클릭한 버튼이 List인 경우 action 속성과 method 속성을
							// 변경합니다. '/board/list'로의 이동은 아무런 파라미터가 없기 때문에
							// form 태그의 모든 내용은 삭제한 상태에서 submit()을 진행합니다.			
						   formObj.attr("action", "/qna/list").attr("method", "get");
						
						   var pageNumTag = $("input[name='pageNum']").clone();
							var amountTag = $("input[name='amount']").clone();			
						    // Page 321 자바스크립트 소스 추가 끝
						    
						    // Page 347 자바스크립트 소스 추가 시작
						    var keywordTag = $("input[name='keyword']").clone();
						    var typeTag = $("input[name='type']").clone();
						    // Page 347 자바스크립트 소스 추가 끝
						    
						    formObj.empty();	
						    
						    // Page 321 자바스크립트 소스 추가 시작
						    formObj.append(pageNumTag);
						    formObj.append(amountTag);
						    // Page 321 자바스크립트 소스 추가 끝
						    
						    // Page 347 자바스크립트 소스 추가 시작
						    formObj.append(keywordTag);
						    formObj.append(typeTag);
							
						}
						formObj.submit();		
					});
				});
</script>  
</html>