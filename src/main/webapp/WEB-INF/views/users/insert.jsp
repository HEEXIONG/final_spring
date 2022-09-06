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
<form action="/users/insert" method="post">


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

<input type="submit">

</form>




<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
//이미지 구현 시작//////////////////////////////////////////////


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
		processData : false, //서버에 쿼리스트링으로  데이터 전달할지
		contentType : false, //서버로 전송되는 데이터의 contentType
		data : formData, // form데이터 객체를 보냄
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
	
	
	
	
//이미지 구현 끝////////////////////////////////////////////////////


//주소 api 시작////////////////////////////////////////////////////////
function execution_daum_address(){
	new daum.Postcode({
		 oncomplete: function(data) {
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

             // 각 주소의 노출 규칙에 따라 주소를 조합한다.
             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
             var addr = ''; // 주소 변수
             var extraAddr = ''; // 참고항목 변수

             //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
             if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                 addr = data.roadAddress;
             } else { // 사용자가 지번 주소를 선택했을 경우(J)
                 addr = data.jibunAddress;
             }

             // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
             if(data.userSelectedType === 'R'){
                 // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                 // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                 if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                     extraAddr += data.bname;
                 }
                 // 건물명이 있고, 공동주택일 경우 추가한다.
                 if(data.buildingName !== '' && data.apartment === 'Y'){
                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                 if(extraAddr !== ''){
                     extraAddr = ' (' + extraAddr + ')';
                 }
                 // 조합된 참고항목을 해당 필드에 넣는다.
                // document.getElementById("sample6_extraAddress").value = extraAddr;
                 addr += extraAddr
             
             } else {
                 //document.getElementById("sample6_extraAddress").value = '';
                 addr += ' '
             }

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             //document.getElementById('sample6_postcode').value = data.zonecode;
             $(".USER_POST").val(data.zonecode);
            // document.getElementById("sample6_address").value = addr;
             $(".USER_ADDR1").val(addr)
             // 커서를 상세주소 필드로 이동한다.
            // document.getElementById("sample6_detailAddress").focus();
             $(".USER_ADDR2").attr("readonly",false);
             $(".USER_ADDR2").focus();
         }
     }).open();
    
}
//주소 api 끝////////////////////////////////////////////////////////
// 중복 체크 시작/////////////////////////////////////////////////////////
$(".USER_ID").on("propertychange change keyup paste input",function(){
	//console.log("중복 테스트")
	var userId = $('.USER_ID').val();
	var data = {userId:userId} //'컨트롤에 넘길 데이터 이름 : 실제 데이터'
	$.ajax({
		type :"post",
		url : "/users/userIdChk",
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
$(".USER_NICKNAME").on("propertychange change keyup paste input",function(){
	//console.log("중복 테스트")
	var usernick = $('.USER_NICKNAME').val();
	var data = {usernick:usernick} //'컨트롤에 넘길 데이터 이름 : 실제 데이터'
	$.ajax({
		type :"post",
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