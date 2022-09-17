<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/resources/css/login2.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
	.id_not_exist{
		color : green;
		display : none;
	}
	.id_exist{
		color : red;
		display : none;
	}
	.nick_not_exist{
		color : green;
		display : none;
	}
	.nick_exist{
		color : red;
		display : none;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <form action="/users/insert" method="post" enctype="multipart/form-data">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

아이디:<input class="USER_ID" name="USER_ID"><br/>
<span class="id_not_exist">사용 가능한 아이디입니다</span>
<span class="id_exist">아이디가 이미 존재합니다.</span>
<br />


비밀번호:<input class="USER_PW" name="USER_PW"><br/>
닉네임 : <input class="USER_NICKNAME" name="USER_NICKNAME"><br/>
<span class="nick_not_exist">사용 가능한 닉네임입니다</span>
<span class="nick_exist">닉네임이 이미 존재합니다.</span>
<br />
핸드폰 : <input class="USER_PHONE" name="USER_PHONE"><br/>
이메일 : <input class="USER_EMAIL" name="USER_EMAIL"><br/>
<div class="address_button" onclick="execution_daum_address()">
<span>주소찾기</span>
</div>
우편번호 : <input class="USER_POST" name="USER_POST" readonly="readonly"><br/>
주소:<input class="USER_ADDR1" name="USER_ADDR1" readonly="readonly"><br/>
상세 주소:<input class="USER_ADDR2" name="USER_ADDR2" readonly="readonly"><br/>


<input type="submit">

</form> --%>

<section class="login-form">
        <h1>회원가입</h1>
        <form action="/users/insert" method="post" enctype="multipart/form-data">
            <div class="int-area">
                <input type="text"  name="USER_ID" id="id"  autocomplete="off"  required>
                <label for="id">USER NAME</label>
                <span class="id_not_exist">사용 가능한 아이디입니다</span>
<span class="id_exist">아이디가 이미 존재합니다.</span>
            </div>
            <div class="int-area">
                <input type="password" name="USER_PW" id="pw"  autocomplete="off"  required>
                <label for="pw">PASSWORD</label>
            </div>
                <div class="int-area">
                <input type="text" name="USER_NICKNAME"  id="name"   autocomplete="off"  required>
                <label for="NAME">NAME</label>
                <span class="nick_not_exist">사용 가능한 닉네임입니다</span>
				<span class="nick_exist">닉네임이 이미 존재합니다.</span>
            </div>
             <div class="int-area">
                <input type="text" name="USER_PHONE" id="tel"  autocomplete="off"  required>
                <label for="USER_PHONE">PHONE</label>
            </div>
               <div class="int-area">
                <input type="email" name="USER_EMAIL" id="email"  autocomplete="off"  required>
                <label for="USER_EMAIL">EMAIL</label>
            </div>
			    <div class="int-area1">
                <input type="text" name="USER_POST" class="USER_POST"  placeholder="우편번호" readonly="readonly" >
                <input type="text" name="USER_ADDR1" class="USER_ADDR1" placeholder="주소" readonly="readonly"  style="width: 74%;">
            </div>
            <div class="int-area3">
                <input type="text" name="USER_ADDR2"  placeholder="상세주소" class="USER_ADDR2" >
            </div>
               <div class="address_button" onclick="execution_daum_address()">
			<button type="button" class="w-btn w-btn-gray">주소찾기</button>
			</div><br/>
			<div class="form_section">
<div class="form_section_title">
<label>상품 이미지</label>
</div>
<div class="form_section_content">
<!-- 여러개 업로드(multiple) -->
<!--<input type="file" multiple id="fileItem" name="uploadFile" style="height: 30px">  -->
<!-- input 태그를 통해 선택된 파일은 file 객체의 형태로 표현. 이 객체는 filelist객체의 요소로 저장 
	 이 파일객체에 접근하기 위해  input  태그의 file속성에 접근. 스크립트 사용 -->
<!-- 하나 업로드 -->
<input type="file" id="fileItem" name="uploadFile" style="height: 30px">
 <div id="uploadResult">
 <!-- 
 <div id="result_card">
 <div class="imgDeletBtn">x</div>
 <img src="/users/display?fileName=test.png">
 </div>-->
 </div>
</div>
</div>
			
			
      
            
            <div class="btn-area">
                <button id="btn"  type="submit">회원가입</button>
            </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    
        </form>
      
     
    </section>

    <script>       
        let id = $('#id');
        let pw = $('#pw');
        let btn = $('#btn');
        
        $("#btn").on('click', function() {
            if($(id).val() == "") {
                $(id).next('label').addClass('warning');
                setTimeout(function() {
                    $('label').removeClass('warning');
                }, 1500);
            }
            else if($(pw).val() == "") {
                $(pw).next('label').addClass('warning');
                setTimeout(function() {
                    $('label').removeClass('warning');
                }, 1500);
            }
        });
    </script> 




<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$("input[type='file']").on("change",function(e){ //input태그의 파일타입이 무언가 바꼈을때
	if($(".imgDeleteBtn").length > 0){
		deleteFile();
	}
	//첨부파일을 서버로 전송하기 위해 formdata 객체 사용(화면의 이동 없이 첨부파일을 서버로 전송하기 위해)
	//formdata 객체를 생성하고 객체안에 첨부파일을 넣어 formdata객체 자체를 서버로 전송
	let formData = new FormData();//formdata객체생성
	
	let fileInput = $('input[name="uploadFile"]')//파일 객체 불러오기
	let fileList = fileInput[0].files; //filelist 접근
	console.log("filelist 접근 : "+ fileList)
	let fileObj = fileList[0]; //filelist안에 있는 file 객체 접근
	console.log("file 객체 접근:" + fileObj )
	
	//파일 인터페이스가 가진속성을 이용해 확인(name,size,type)
	//파일체크(타입,사이즈)
/* 	if(!fileCheck(fileObj.name, fileObj.size)){
		return false;
	} */
	
	//한개의 파일을 업로드할 경우
	//FormData.append(key, value) //서버로 첨부파일을 전송하기 위해 사용 
	formData.append("uploadFile",fileObj)//fileObj=filelist안의 파일객체
	
	/* 여러개의 파일을 업로할 경우
	for(let i = 0 ; i<fileList.length; i++){
		fromData.append("uploadFile",fileObj)
	}*/
	
	$.ajax({
		url : '/users/uploadAjaxAction',
		enctype:'multipart/form-data',
		processData : false, //서버에 쿼리스트링으로  데이터 전달할지
		contentType : false, //서버로 전송되는 데이터의 contentType
		data : formData, // form데이터 객체를 보냄
		beforeSend : function(xhr)
        {   
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		type : 'POST', //서버 요청 타입
		dataType: 'json', // 서버로부터 반환받을 데이터 타입
		success : function(result){
			console.log(result)
			showUploadImage(result)
		},
		error : function(result){
			alert("이미지 파일이 아닙니다.")
		}
	});
	
})
	//gif|svg|ico 나중에 추가
	let regex = new RegExp("(.*?)\.(jpg|png)$");//정규 파일 체크(모든이름.jpg|png|gif|svg|ico)
	let maxSize = 1048576; //1MB
	
	//이미지 파일 타입체크,용량체크 펑션
	function fileCheck(fileName, fileSize){
		if(fileSize >= maxSize){//1mb가 넘어가면
		alert("기준치 초과")
		return false
		}
	if(!regex.test(fileName)){//정규식 테스트
		alert("허용된 타입이 아닙니다")
		return false;
	}
	return true;
}
	//이미지 출력
	function showUploadImage(uploadResultArr){
		//데이터검증
		if(!uploadResultArr || uploadResultArr.length ==0){
			return
		}
		let uploadResult = $("#uploadResult");
		//받은데이터의 첫번째 데이터
		let obj = uploadResultArr[0];
		
		let str = "";
		
		let fileCallPath =  "s_"+obj.fileName;
		
		str += "<div id='result_card'>";
		str += "<img src='/users/display?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='"+fileCallPath+"'>x</div>";
		str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";
		str += "</div>";
		
		uploadResult.append(str);
	}
	
	$("#uploadResult").on("click",".imgDeleteBtn",function(e){
		deleteFile();
	});
	
	
	function deleteFile(){
		let targetFile = $(".imgDeleteBtn").data("file");
		let targetDiv = $("#result_card");
		$.ajax({
			url : '/users/deleteFile',
			data : {fileName : targetFile },
			dataType : 'text',
			type: 'post',
			success : function(result){
				console.log(result)
				targetDiv.remove();
				$("input[type='file']").val("");
			},
			error : function(result){
				console.log(result);
				alert("파일을 삭제하지 못하였습니다.")
			}
		});
	}
//주소 api 시작////////////////////////////////////////////////////////
function execution_daum_address(){
	new daum.Postcode({
		 oncomplete: function(data) {
            
             var addr = ''; 
             var extraAddr = ''; 

            
             if (data.userSelectedType === 'R') { 
                 addr = data.roadAddress;
             } else { 
                 addr = data.jibunAddress;
             }

             if(data.userSelectedType === 'R'){
                
                 if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                     extraAddr += data.bname;
                 }
              
                 if(data.buildingName !== '' && data.apartment === 'Y'){
                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 
                 if(extraAddr !== ''){
                     extraAddr = ' (' + extraAddr + ')';
                 }
                
                 addr += extraAddr
             
             } else {
                 
                 addr += ' '
             }

         
             $(".USER_POST").val(data.zonecode);
            
             $(".USER_ADDR1").val(addr)
           
             $(".USER_ADDR2").attr("readonly",false);
             $(".USER_ADDR2").focus();
         }
     }).open();
    
}
//주소 api 끝////////////////////////////////////////////////////////
// 중복 체크 시작/////////////////////////////////////////////////////////
$("#id").on("propertychange change keyup paste input",function(){
	//console.log("중복 테스트")
	var userId = $('#id').val();
	var data = {userId:userId} //'컨트롤에 넘길 데이터 이름 : 실제 데이터'
	$.ajax({
		type :"post",
		url : "/users/userIdChk",
		beforeSend : function(xhr)
        {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		data : data,
		success : function(result){
			//console.log("성공 여부" + result);
			if(result != 'fail'){
				$(".id_not_exist").css("display","inline-block");
				$(".id_exist").css("display","none");
			}else{
				$(".id_exist").css("display","inline-block");
				$(".id_not_exist").css("display","none");
			}
		}
 	}); //ajax 종료
});
$("#name").on("propertychange change keyup paste input",function(){
	//console.log("중복 테스트")
	var usernick = $('#name').val();
	var data = {usernick:usernick} //'컨트롤에 넘길 데이터 이름 : 실제 데이터'
	$.ajax({
		type :"post",
		beforeSend : function(xhr)
        {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		url : "/users/usernickChk",
		data : data,
		success : function(result){
			//console.log("성공 여부" + result);
			if(result != 'fail'){
				$(".nick_not_exist").css("display","inline-block");
				$(".nick_exist").css("display","none");
			}else{
				$(".nick_exist").css("display","inline-block");
				$(".nick_not_exist").css("display","none");
			}
		}
 	}); //ajax 종료
});
//중복 체크 끝/////////////////////////////////////////////////////////
</script>
</body>
</html>