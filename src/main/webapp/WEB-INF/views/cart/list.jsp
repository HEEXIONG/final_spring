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
  <script src="/jquery-3.3.1.min.js"></script>
<script src="/bootstrap.min.js"></script>
<title>Insert title here</title>

<style>
            #my_modal {
                display: none;
                width: 300px;
                padding: 20px 60px;
                background-color: #fefefe;
                border: 1px solid #888;
                border-radius: 3px;
            }

            #my_modal .modal_close_btn {
                position: absolute;
                top: 10px;
                right: 10px;
            }
        </style>
        
        
</head>
<body>
<div class="page-wrapper">
    <div class="container-fluid">
        <div class="col-lg-8"><!--게시판 넓이 -->
            <div class="col-lg-12">
                <h1 class="page-header">장바구니</h1>
            </div>
            
            <div class="panel panel-default">
                <div class="panel-body">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>장바구니 코드</th>
                                <th>제품코드</th>
                                <th>제품이미지</th>
                              
                                <th>가격</th>
                                <th>가격합계</th>
                            </tr>
                        </thead>
                        
                        <tbody>
                        <c:forEach items="${list}" var="CartVO">
                            <tr class="cart_class">
                                <td><c:out value="${CartVO.CART_CODE}"/></td>
                            
                                <td>
									<c:out value="${CartVO.PD_CODE}" />
								</td>
                                <td><c:out value="${CartVO.PD_IMAGE}"/></td>
                                <td><c:out value="${CartVO.PD_AMOUNT}"/></td>
                                <td><c:out value="${CartVO.PD_TOTALPRICE}"/></td>
                            </tr>
                         </c:forEach>   
                        </tbody>
                    </table>
                </div>
            </div>
            
            
            <!--modal  -->
            <div id="my_modal">
    			<div class="row" >
            
            
                  <div class="col-lg-12">
                      <button type="button" id="deleteBtn" class="btn btn-outline btn-primary pull-right">
                         			 삭제
                      </button>
                       <button type="button" id ="updateBtn" class="btn btn-outline btn-primary pull-right">
                         			 수정
                      </button>
                  </div>
            	</div>
					<a class="modal_close_btn" style="display:none;">닫기</a> 
			</div>

        <script>
            function modal(id) {
                var zIndex = 9999;
                var modal = document.getElementById(id);

                // 모달 div 뒤에 희끄무레한 레이어
                var bg = document.createElement('div');
                bg.setStyle({
                    position: 'fixed',
                    zIndex: zIndex,
                    left: '0px',
                    top: '0px',
                    width: '100%',
                    height: '100%',
                    overflow: 'auto',
                    // 레이어 색갈은 여기서 바꾸면 됨
                    backgroundColor: 'rgba(0,0,0,0.4)'
                });
                document.body.append(bg);

                // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
                modal.querySelector('.modal_close_btn').addEventListener('click', function() {
                    bg.remove();
                    modal.style.display = 'none';
                });

                modal.querySelector('#updateBtn').addEventListener('click', function() {
                    bg.remove();
                    modal.style.display = 'none';
                });
                
                modal.querySelector('#deleteBtn').addEventListener('click', function() {
                    bg.remove();
                    modal.style.display = 'none';
                });
                
                modal.setStyle({
                    position: 'fixed',
                    display: 'block',
                    boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

                    // 시꺼먼 레이어 보다 한칸 위에 보이기
                    zIndex: zIndex + 1,

                    // div center 정렬
                    top: '50%',
                    left: '50%',
                    transform: 'translate(-50%, -50%)',
                    msTransform: 'translate(-50%, -50%)',
                    webkitTransform: 'translate(-50%, -50%)'
                });
            }

            // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
            Element.prototype.setStyle = function(styles) {
                for (var k in styles) this.style[k] = styles[k];
                return this;
            };

            
            $(".cart_class").click(function(){
            	
            	 modal('my_modal');
            });
        </script>
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- Channel Plugin Scripts -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "2b7df929-35a8-43dc-9292-2312922bf727"
  });
</script>
<!-- End Channel Plugin -->

</body>
</html>