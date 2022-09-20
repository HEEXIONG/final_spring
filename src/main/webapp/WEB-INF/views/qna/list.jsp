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
       <!--  <div class="col-lg-8">게시판 넓이 -->
            <div class="col-lg-12">
                <h1 class="page-header">Q&A 게시판</h1>
            </div>
            <div class="row">
                  <div class="col-lg-12">
                      <button type="button" class="btn btn-outline btn-primary pull-right" onclick="location.href='/qna/register'">
                          Q&A 작성
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
                                <!-- <th>내용</th> -->
                              
                                <th>작성자</th>
                                <th>작성일자</th>
                                <!-- <th>수정일자</th> -->
                            </tr>
                        </thead>
                        
                        <tbody>
                        <c:forEach items="${list}" var="QnaVO">
                            <tr>
                                <td><c:out value="${QnaVO.qno}"/></td>
                            
                                <td><a class='move' href='<c:out value="${QnaVO.qno}"/>'>
									<c:out value="${QnaVO.q_title}" />
									
                               <%--  <td><a href='/qna/get?qno=<c:out value="${QnaVO.qno}"/>'> --%>
                               <%--  <c:out value="${QnaVO.q_title}"/></a></td> --%>
                               <%--  <td><c:out value="${QnaVO.q_content}"/></td> --%>
                                <td><c:out value="${QnaVO.q_writer}"/></td>
                               
                                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${QnaVO.regdate}"/></td>
                              <%--   <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${QnaVO.updatedate}"/></td> --%>
                            </tr>
                         </c:forEach>   
                        </tbody>
                    </table>
                    
                    
                  <div class='pull-right'>
					<ul class="pagination">
					
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active" : ""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>
					<!-- Page310 위에 소스 코딩 끝 -->

					</ul>
				</div>
                    
                    
                </div>
           <form id='actionForm' action="/qna/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	

			<!-- Page 344 중간 jsp 소스 코딩 추가 시작 : 소스 문제 없는데 붉은색 표시나면 구문 잘라내기 후에 다시 붙여넣기 저장해 보시기 바랍니다. -->
			<!-- 다음의 구문 코딩 후에 웹브라우저 실행해서, 검색 이후에 페이지를 이동해서 동일한
			     검색 조건과 키워드가 유지되는지 확인 바랍니다. -->
				<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
				<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
			<!-- Page 344 중간 jsp 소스 코딩 추가 끝 -->

			</form>
            </div>
        </div>
    <!-- </div> -->
</div>




<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	// Page 246 소스 코딩 시작
	// 새로운 게시물의 번호는 BoardController의 addFlashAttribute() 메서드로
	// 저장되었기 때문에 한 번도 사용된 적이 없다면 사용자가 "/board/list"를 호출하거나,
	// '새로고침'을 통해서 호출하는 경우 아무런 내용이 없게 됩니다.
	// 또한, addFlashAttribute() 메서드를 이용해서 일회성으로만 데이터를 사용할 수 
	// 있으므로 이를 이용하여 경고창이나 모달창 등을 보여주는 방식으로 처리할 수 있습니다.
	$(document).ready(function() {
		var result = '<c:out value="${result}"/>';
	// }); Page 246 소스 코딩 끝 
	
						// Page 248 아래 자바스크립트 소스 코딩 시작
						// 모달창 관련 자바스크립트 소스 코딩(시작)	
						// checkModal() 함수는 파라미터에 따라서 모달창을 보여주거나 내용을 수정한 뒤
						// 보이도록 처리합니다. checkModal()에서는 새로운 게시글이 작성되는 경우
						// RedirectAttributes로 게시물의 번호가 전송되므로 이를 이용해서 모달창의 내용을
						// 수정 처리합니다. $("#modal").modal('show')를 호출하면 모달창이 보이게 됩니다.
						// 실행 확인은 웹 프로젝트 실행 후 '/board/register'를 이용해서 새로운 게시물을 작성하고
						// 나면 자동으로 '/board/list'로 이동하면서 모달창이 보이게 됩니다.
						checkModal(result);

						// Page257 중간 window.history 객체, replaceState() 메서드 소스 추가 코딩
						history.replaceState({}, null, null);

						function checkModal(result) {

							if (result === '' || history.state) {
								return;
							}

							if (parseInt(result) > 0) {
								$(".modal-body").html(
										"게시글 " + parseInt(result)
												+ " 번이 등록되었습니다.");
							}

							$("#myModal").modal("show");
							// 모달창 관련 자바스크립트 소스 코딩(종료)
						}
						
						// }); Page 248 아래 자바스크립트 소스 코딩 끝

						// Page 250 아래 자바스크립트 소스 코딩 시작
						// list.jsp에서  Register New Board 버튼 클릭하면
						// 게시물의 등록 웹페이지로 이동 처리 합니다.
						$("#regBtn").on("click", function() {
							self.location = "/qna/register";
						});
						// Page 250 아래 자바스크립트 소스 코딩 끝

						// Page 312 위에 자바스크립트 소스 코딩 시작
						var actionForm = $("#actionForm");

						$(".paginate_button a").on(
								"click",
								function(e) {

									e.preventDefault();

									console.log('click');
									// }); Page 312 위에 자바스크립트 소스 코딩 끝
									
									// Page 312 아래 자바스크립트 소스 코딩 시작
									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit(); // actionForm 자체를 submit() 처리 시켜줍니다.
								});
								// Page 312 아래 자바스크립트 소스 코딩 끝						

						// Page 315 자바스크립트 소스 코딩 시작
						$(".move").on("click",function(e) {
								e.preventDefault();
								actionForm.append("<input type='hidden' name='qno' value='"
															+ $(this).attr("href") + "'>");
								actionForm.attr("action","/qna/get");
								actionForm.submit();
								});
						// Page 315 자바스크립트 소스 코딩 끝

						// Page 342 자바스크립트 소스 코딩 시작
						var searchForm = $("#searchForm");
						
						$("#searchForm button").on("click", function(e) {
							if(!searchForm.find("option:selected").val()){
								alert("검색 종류를 선택해 주시기 바랍니다!");
								return false;
							}
							
							if(!searchForm.find("input[name='keyword']").val()){
								alert("키워드를 입력해 주시기 바랍니다!");
								return false;
							}
							
							// 여러 문제들 중에서 검색 버튼을 클릭하면 검색은
							// 1페이지를 하도록 수정 처리합니다.
							searchForm.find("input[name='pageNum']").val("1");
							// 브라우저에서 검색 버튼을 클릭하면 form 태그의
							// 전송은 막고, 페이지의 번호는 1이 되도록 처리합니다.
							// 화면에서 키워드가 없다면 검색을 하지 않도록 제어합니다.
							e.preventDefault();
							searchForm.submit();			
						});
					});
						// Page 342 자바스크립트 소스 코딩 끝
</script>



</body>
</html>