<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>${board.gr_title} 상품 후기</title>

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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
    <div id="wrapper">

        <div id="page-wrapper">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">상품 후기</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">상품 후기를 남겨주세요</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

          <div class="form-group">
          <label>번호</label> <input class="form-control" name='bno'
             value='<c:out value="${board.gr_bno}" />' readonly="readonly">
        </div>

        <div class="form-group">
          <label>제목</label> <input class="form-control" name='title'
             value='<c:out value="${board.gr_title}" />' readonly="readonly">
        </div>

        <div class="form-group">
          <label>내용</label>
          <textarea class="form-control" rows="3" name='content'
            readonly="readonly"><c:out value="${board.gr_content}" /></textarea>
        </div>

        <div class="form-group">
          <label>작성자</label> <input class="form-control" name='writer' value='<c:out value="${board.gr_writer}" />'
             readonly="readonly">
        </div>


<button data-oper='modify' class="btn btn-default" onclick="location.href='/group/modify?bno=<c:out value="${board.gr_bno}" /> '">수정하기</button>

<button data-oper='list' class="btn btn-info" onclick="location.href='/group/list'">돌아가기</button>

<!-- page 317 jsp 소스 코딩 시작 : Page345 조회 페이지에서 검색 처리 jsp 소스 추가 코딩 시작 -->
<form id='operForm' action="/group/modify" method="get">
	<input type='hidden' id='gr_bno' name='gr_bno' value='<c:out value="${board.gr_bno}"/>'>
	<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
	<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
<!-- page 317 jsp 소스 코딩 끝 : Page345 조회 페이지에서 검색 처리 jsp 소스 추가 코딩 끝 -->

</form>
      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

  <div class='row'>
  <div class="col-lg-12">    
    <!-- /.panel -->
    <div class="panel panel-default">
    
    	<!-- Page 419 코딩할 때 아래 .panel-heading 영역을 주석 처리해 줍니다. -->
    	<!-- 
       	<div class="panel-heading">
        	<i class="fa fa-comments fa-fw"></i> Reply
      	</div>
      	 -->
      	 
      	 <div class='bigPictureWrapper'>
  <div class='bigPicture'>
  </div>
</div>

<style>
.uploadResult {
  width:100%;
  background-color: gray;
}
.uploadResult ul{
  display:flex;
  flex-flow: row;
  justify-content: center;
  align-items: center;
}
.uploadResult ul li {
  list-style: none;
  padding: 10px;
  align-content: center;
  text-align: center;
}
.uploadResult ul li img{
  width: 100px;
}
.uploadResult ul li span {
  color:white;
}
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
  background:rgba(255,255,255,0.5);
}
.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}

.bigPicture img {
  width:600px;
}

</style>



<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">파일</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
        
        <div class='uploadResult'> 
          <ul>
          </ul>
        </div>
      </div>
      <!--  end panel-body -->
    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
      	 
      	 
      	 <!-- Page 419 댓글 목록 상단 오른쪽에 버튼을 하나 추가해서
      	            사용자들이 새로운 댓글을 추가할 수 있도록 준비합니다. -->
      	      <div class="panel-heading">
      	      	<i class="fa fa-comments fa-fw"></i> 댓글
      	      		<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">댓글 달기</button>
      	      </div>
      	            	 
      
      	<!-- /.panel-heading -->
      	<div class="panel-body">  
      	    <!-- 댓글의 목록은 ul 태그 내에 li 태그를 이용해서 처리합니다.
      	         각 li 태그는 하나의 댓글을 의미하므로 수정이나 삭제 시 이를 클릭하게 됩니다.
      	         수정이나 삭제 시에는 반드시 댓글 번호(rno)가 필요하므로 'data-rno' 속성을
      	         이용해서 이를 처리합니다. -->      
      	    <ul class="chat">
      	       <!-- start reply -->
      	    	<!-- Page439 코딩할 때 아래 li 태그 주석 처리함 -->
      	    	<!-- 
      	    	<li class="left clearfix" data-rno='12'>
      	    		<div>
      	    		<div class="header">
      	    			<strong class="primary-font">user00</strong>
      	    			<small class="pull-right text-muted">2022-07-31 13:20</small>
      	    		</div>
      	    		<p>Good job!</p>
	      	    	</div>
	      	    </li>
	      	     -->
				<!-- Page414 댓글 목록 처리 get jsp 소스 코딩 끝 -->
	        </ul>
    	</div>
    	<!-- /.panel .chat-panel -->
	      	     <!-- Page439 get jsp 소스 추가 내용 -->
	      	     <div class="panel-footer"></div>
     	</div>	
  </div>
  <!-- ./ end row -->
</div>


<!-- Page420~Page421 get jsp 내의 모달창 소스 코딩 시작 -->
<!-- 댓글의 추가는 모달창을 이용해서 진행합니다. -->
<!-- Modal -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label>댓글 내용</label> 
                <input class="form-control" name='reply' value='New Reply!!!!'>
              </div>      
              <div class="form-group">
                <label>댓글 작성자</label> 
                <input class="form-control" name='replyer' value='replyer'>
              </div>
              <div class="form-group">
                <label>Reply Date</label> 
                <input class="form-control" name='replyDate' value='2018-01-01 13:13'>
              </div>
      
            </div>
<div class="modal-footer">
        <button id='modalModBtn' type="button" class="btn btn-warning">수정하기</button>
        <button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제하기</button>
        <button id='modalRegisterBtn' type="button" class="btn btn-primary">등록하기</button>
        <button id='modalCloseBtn' type="button" class="btn btn-default">닫기</button>
      </div>          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
<!-- Page420~Page421 get jsp 내의 모달창 소스 코딩 끝 -->

        
      
<script type="text/javascript" src="/resources/js/Gr_reply.js"></script>

<script>
$(document).ready(function() {
	var gr_bnoValue = '<c:out value="${board.gr_bno}"/>';
	var replyUL = $(".chat");
	
	showList(1);
	
	function showList(page) {
		
		console.log("show list " + page);
		
			replyService.getList({gr_bno:gr_bnoValue, page: page|| 1}, function(replyCnt, list) {
				console.log("replyCnt : " + replyCnt);
				console.log("list : " + list);
				console.log(list);
				
				if(page == -1){
					pageNum = Math.ceil(replyCnt/10.0);
					showList(pageNum);
					return;
				}
				var str = "";
				
				if(list == null || list.length == 0){
					return;
				}
				
				
			for(var i = 0, len = list.length || 0; i < len; i++){
				str += "<li class='left clearfix' data-rno='" + list[i].rno + "'>";
				str +=" <div><div class='header'><strong class='primary-font'>"+ list[i].replyer+"</strong>";
								
				str +=" <small class='pull-right text-muted'>" + replyService.displayTime(list[i].replyDate) + "</small></div>";				
				
				str +=" <p>" + list[i].reply + "</p></div></li>";
			}
			replyUL.html(str);
			
			showReplyPage(replyCnt);
			
		}); 
	} 

	
	var pageNum = 1;
	var replyPageFooter = $(".panel-footer");
	
	function showReplyPage(replyCnt) {
		var endNum = Math.ceil(pageNum/10.0) * 10;
		var startNum = endNum - 9;		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 10 >= replyCnt){
			endNum = Math.ceil(replyCnt/10.0);
		}
		
		if(endNum * 10 < replyCnt){
			next = true;
		}
		
		var str = "<ul class='pagination pull-right'>";
		
		if(prev){
			str += "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
		}
		for(var i = startNum; i <= endNum; i++){
			var active = pageNum == i? "active" : "";
			str += "<li class='page-item " + active + " '><a class='page-link' href='" + i + "'>" + i +"</a></li>";
		}
		if(next){
			str += "<li class='page-item'><a class='page-link' href='" +(endNum + 1) + "'>Next</a></li>";
		}
		str += "</ul></div>";
		console.log(str);		
		replyPageFooter.html(str);
		}
	replyPageFooter.on("click", "li a", function(e) {
		e.preventDefault();
		console.log("page click");
		var targetPageNum = $(this).attr("href");
		console.log("targetPageNum : " + targetPageNum);
		
		pageNum = targetPageNum;
		showList(pageNum);
	});
	
	var modal = $(".modal");
	var modalInputReply = modal.find("input[name='reply']");
	var modalInputReplyer = modal.find("input[name='replyer']");
	var modalInputReplyDate = modal.find("input[name='replyDate']");
	
	var modalModBtn = $('#modalModBtn');
	var modalRemoveBtn = $('#modalRemoveBtn');
	var modalRegisterBtn = $('#modalRegisterBtn');
	
	$("#addReplyBtn").on("click", function(e) {
		modal.find("input").val("");
		modalInputReplyDate.closest("div").hide();
		modal.find("button[id != 'modalCloseBtn']").hide();
		
		modalRegisterBtn.show();
		$(".modal").modal("show");
	});
	
	modalRegisterBtn.on("click", function(e) {
		var reply = {
				reply : modalInputReply.val(),
				replyer : modalInputReplyer.val(),
				gr_bno : gr_bnoValue
		};
		replyService.add(reply, function(result) {
			alert(result);
			modal.find("input").val("");
			modal.modal("hide");
			showList(-1); 
		});
	});
	
	$(".chat").on("click", "li", function(e) {
		var rno = $(this).data("rno");
		replyService.get(rno, function(reply) {
			modalInputReply.val(reply.reply);
			modalInputReplyer.val(reply.replyer);
			modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
			modal.data("rno", reply.rno);
			modal.find("button[id != 'modalCloseBtn']").hide();
			modalModBtn.show();
			modalRemoveBtn.show();
			
			$(".modal").modal("show");
		});
	});
	
	modalModBtn.on("click", function(e) {
		var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
		replyService.update(reply, function(result) {
			alert(result);
			modal.modal("hide");			
			showList(pageNum);
		});					   
	});
	// Page427 댓글의 삭제 이벤트 처리
	// 댓글의 삭제 시 작업이 모두 끝나면, 다시 댓글 목록을 갱신해 줘야 합니다.
	// 댓글 삭제 역시 모달창에 있는 'data-rno'값을 이용해서 처리합니다.
	modalRemoveBtn.on("click", function(e) {
		var rno = modal.data("rno");
		replyService.remove(rno, function(result) {
			alert(result);
			modal.modal("hide");
			// Page442 페이징이 적용된 댓글의 수정할 때 아래 1줄 코딩은 주석 처리해줌.
			// showList(1);
			showList(pageNum); // Page442 showList() 메서드를 호출할 때
			                   // 현재 보고 있는 댓글 페이지의 번호를 호출합니다.
		});
	});
	
});

</script>

<script>
// Page570~Page571 소스 코딩 시작
$(document).ready(function(){
	  
	  (function(){
	  
	    var gr_bno = '<c:out value="${board.gr_bno}"/>';
	    
	      $.getJSON("/group/getAttachList", {gr_bno: gr_bno}, function(arr){
	    
	      console.log(arr);
	      
	      // Page574 소스 코딩 시작
	      var str = "";
	       
	       $(arr).each(function(i, attach){
	       
	         //image type
	         if(attach.fileType){
	           var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
	           
	           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
	           str += "<img src='/display?fileName="+fileCallPath+"'>";
	           str += "</div>";
	           str +"</li>";
	         }else{
	             
	           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
	           str += "<span> "+ attach.fileName+"</span><br/>";
	           str += "<img src='/resources/img/attach.png'></a>";
	           str += "</div>";
	           str +"</li>";
	         }
	       });
	       
	       $(".uploadResult ul").html(str);
	     });//end getjson
	     // Page574 소스 코딩 끝	      

	 })(); // end function
	 // Page570~Page571 소스 코딩 끝.
	
	  // Page575 첨부파일 클릭 시 이벤트 처리 소스 코딩 시작
	  $(".uploadResult").on("click","li", function(e){
	      
		    console.log("view image");
		    
		    var liObj = $(this);
		    
		    var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
		    
		    if(liObj.data("type")){
		      showImage(path.replace(new RegExp(/\\/g),"/"));
		    }else {
		      //download 
		      self.location ="/download?fileName="+path
		    }
		    
		    
		  });
		  
		  function showImage(fileCallPath){
			    
		    alert(fileCallPath);
		    
		    // Page576 첨부파일 이미지를 클릭하면 화면에 이미지를 보여줍니다.
		    $(".bigPictureWrapper").css("display","flex").show();
		    
		    $(".bigPicture")
		    .html("<img src='/display?fileName="+fileCallPath+"' >")
		    .animate({width:'100%', height: '100%'}, 1000);
		  	}
		    // Page575 첨부파일 클릭 시 이벤트 처리 소스 코딩 끝

		  // Page577 화면에 표시된 이미지를 클릭하면 화면 표시 이미지가 사라집니다.
		  $(".bigPictureWrapper").on("click", function(e){
		    $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
		    setTimeout(function(){
		      $('.bigPictureWrapper').hide();
		    }, 1000);
		  });
	
	});


</script>


<script type="text/javascript">

	$(document).ready(function() {
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click", function(e) {
		
			operForm.attr("action", "/group/modify").submit();
		});
		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#gr_bno").remove();
			operForm.attr("action", "/group/list")
			operForm.submit();
		});		
	});

</script>



</div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <!-- 
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
     -->

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    // 아래 jQuery 소스 코드는 jQuery 교체 후 모바일 크기에서 새로 고침 할 경우에 메뉴가 펼쳐지는 문제 해결을 위한 소스 코드 삽입 입니다.
    $(".slidebar-nav")
    	.attr("class", "slidebar-nav navbar-collapse collapse")
    	.attr("aria-expanded", 'false')
    	.attr("style", "height:1px");
    });   
    
    </script>

</body>

</html>

