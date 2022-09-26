<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>uploadAjax jsp</title>
</head>
<body>
	<!-- uploadAjax jsp는 순수한 JavaScript를 이용해서 처리할 수도 있지만,
	     jQuery를 이용해서 처리하는 것이 편리합니다. -->
	<h1>Upload with Ajax</h1>
	
<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 100px;
}
</style>

<!-- Page542 div 태그 .bigPictureWrapper 추가 코딩 -->
<div class="bigPictureWrapper">
	<div class='bigPicture'>
	</div>
</div>

<!-- Page542 ~ Page 543 원본 이미지 보여주는 영역 CSS 처리 -->
<style>
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
}

.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}
</style>
	
	
	<div class="uploadDiv">
		<input type="file" name="uploadFile" multiple="multiple">
	</div>
	
	<!-- Page522 아래에 .uploadResult 소스 추가 바랍니다. -->
	<div class="uploadResult">
		<ul>
		</ul>	
	</div>
	
	<button id="uploadBtn">Upload</button>
	
	<!-- Page501 : uploadAjax jsp 파일 내에 jQuery 라이브러리를 추가하고
	     script 태그를 이용해서 첨부파일을 처리합니다. -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
		
	<script type="text/javascript">
		// Page540 : 섬네일 파일을 클릭하면 원본 이미지를 보여주기 위한 showImage()를 작성합니다.
		// Page541 : showImage() 함수는 jQuery의 $(document).ready()의
		// 바깥쪽에 작성합니다. 이렇게 하는 이유는 나중에 <a>태그에서 직접 showImage()를
		// 호출할 수 있는 방식으로 코딩하기 위해서 입니다.
		function showImage(fileCallPath) {
			// Page544 소스 코딩할 때 아래 1줄 소스는 주석 처리해 줌.
			// alert(fileCallPath);
			
			// Page544 아래 2줄 소스 코딩 추가
			$(".bigPictureWrapper").css("display", "flex").show();
			// Page544 아래 showImage()메서드는 내부적으로 화면 가운데 배치하는 작업 후
			// <img> 태그를 추가하고, jQuery의 animate()를 이용해서 지정된 시간 동안
			// (1000ms=1s) 화면에서 열리는 효과를 처리합니다. 첨부파일의 섬네일을
			// 클릭하면 회색 화면의 배경이 깔리고, 원본 이미지가 출력되는 것을 확인해 봅니다.
			$(".bigPicture").html("<img src='/display?fileName=" + encodeURI(fileCallPath) + "'>").animate({width:'100%', height:'100%'}, 1000);			
		}	
		
		// Page544 : div 이벤트 처리 : 원본 이미지가 보여지는 div태그 영역에는
		// 전체 화면을 차지하기 때문에 다시 한번 클릭하면 사라지도록 이벤트를 적용합니다.
		// 원본 이미지 혹은 주변 배경을 선택하면 우선은 이미지를 화면 중앙으로 작게 점차 줄여
		// 줍니다(1000ms=1s 동안). jQuery의 애니메이션이 끝난 후 이벤트를 감지하는
		// 방식도 있지만, 우리는 1초 후에 자동으로 배경창을 안 보이도록 처리하는 방식을
		// 적용했습니다.		
		$(".bigPictureWrapper").on("click", function(e) {
			$(".bigPicture").animate({width:'0%', height:'0%'}, 1000);
			
			// Page545 소스 코딩할 때 아래 setTimeout() 메서드 부분은 주석 처리함
			/*
			setTimeout(() => {
				$(this).hide();
			}, 1000);
			*/
			
			// Page545 아래 소스 코딩 추가
		// setTimeout()에 적용된 '=>(ES6의 화살표 함수)'는 Chrome에서는 정상 동작
		// 하지만, IE11에서는 제대로 동작하지 않으므로 다음과 같이 코딩을 수정해 줍니다.
			setTimeout(function() {
				$('.bigPictureWrapper').hide();
			}, 1000);
		});
		
		// Page547 x표시에 대한 이벤트 처리 자바스크립트 소스 코딩
		// 첨부파일의 삭제는 span 태그를 이용해서 처리하지만, 첨부파일의 업로드 후에
		// 생성되기 때문에 '이벤트 위임' 방식으로 처리합니다. 이벤트 처리에서는 Ajax를
		// 이용해서 첨부파일의 경로와 이름, 파일의 종류(이미지 혹은 일반)를 전송합니다.
		$(".uploadResult").on("click", "span", function(e) {
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			console.log(targetFile);
			
			$.ajax({
				url : '/deleteFile',
				data : {fileName : targetFile, type:type},
				dataType : 'text',
				type : 'POST',
				success : function(result) {
					alert(result);
				}
			}); // $.ajax
		});
		
	
		$(document).ready(function() {
			// Page506 첨부파일을 이용하는 웹 공격을 막기 위해서
			// 첨부파일의 확장자가 'exe, sh, zip' 등의 경우에는 업로드를 제한하고,
			// 특정 크기(여기서는 5MB) 이상의 파일은 업로드할 수 없도록 제한하는 처리를
			// JavaScript로 처리합니다. 파일 확장자의 경우, 정규표현식(regex)을
			// 이용해서 검사할 수 있습니다. 이를 검사하는 checkExtension() 메서드를
			// 아래와 같이 소스 코딩합니다.
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880; // 5MB
			
			function checkExtension(fileName, fileSize) {
				if(fileSize >= maxSize){
					alert("파일 사이즈를 초과했습니다!");
					return false;
				}
				
				if(regex.test(fileName)){
					alert("해당 종류의 파일은 업로드할 수 없습니다!");
					return false;
				}
				return true;				
			}
			
			// Page520 아래 1줄 소스 코딩 추가
			// 우선 첨부파일을 업로드하기 전에 아무 내용이 없는 input type='file' 객체가
			// 포함된 div 태그를 복사(clone) 합니다. 첨부파일을 업로드한 뒤에는 복사된
			// 객체를 div 태그 내에 다시 추가해서 첨부파일 부분을 초기화시켜 줍니다.
			var cloneObj = $(".uploadDiv").clone();			
			
			
			$("#uploadBtn").on("click", function (e) {
				// jQuery를 이용하는 경우에 파일 업로드는 FormData라는 객체를
				// 이용하게 됩니다. FormData는 일종의 가상의 form 태그와 같다고
				// 생각하셔도 됩니다. Ajax를 이용하는 파일 업로드는 FormData를
				// 이용해서 필요한 파라미터를 담아서 전송하는 방식입니다.
				var formData = new FormData();
				var inputFile = $("input[name='uploadFile']");
				var files = inputFile[0].files;
				console.log(files);
				
				// Page503 : add File Data to formData
				for (var i = 0; i < files.length; i++) {
					
					// Page507 checkExtension() 메서드 적용
					// 첨부파일을 업로드하면 for루프문에서 checkExtension()을
					// 호출해서 확장자와 파일의 크기를 체크하게 됩니다.
					if(!checkExtension(files[i].name, files[i].size)){
						return false;
					}
					
					formData.append("uploadFile", files[i]);
				}
				// 첨부파일 데이터는 formData에 추가한 뒤에 Ajax를 통해서
				// formData 자체를 전송합니다. 이때 processData와
				// contentType은 반드시 'false'로 지정해야만 전송되므로 주의합니다.
				// UploadController에서는 기존과 동일하게 MultipartFile 타입을
				// 이용해서 첨부파일 데이터를 처리합니다.
				$.ajax({
					url : '/uploadAjaxAction',
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					// Page519 uploadAjax에서는 결과 데이터를 JavaScript를
					// 이용해서 반환된 정보를 처리하도록 수정합니다.
					// Ajax를 호출했을 때의 결과 타입(dataType)은 'json'으로 변경하고,
					// 결과를 console.log()로 찍도록 변경합니다. 아래 1줄 소스 추가
					dataType: 'json',
					
					success : function(result) {
						// Page519 소스 코딩할 때 아래 1줄 소스 주석 처리
						// alert("Uploaded!!!");
						
						// Page519 아래 1줄 소스 코딩 추가
						console.log(result);
						
						// Page523 아래 1줄 소스 코딩 추가
						showUploadedFile(result);
						
						// Page521 아래 1줄 소스 코딩 추가
						// 화면에서 첨부파일을 추가하고 버튼을 클릭하면 이전과 달리
						// 첨부파일 다시 추가할 수 있는 형태로 변경되는 것을 확인해 봅니다.
						$(".uploadDiv").html(cloneObj.html());
						
					}
				}); // $.ajax	
				
			});		
			
			// Page522 JavaScript에서는 목록을 보여주는 부분을 별도의 함수로 처리합니다.
			var uploadResult = $(".uploadResult ul");
			
				// Page522 showUploadedFile() 메서드는 JSON 데이터를 받아서
				// 해당 파일의 이름을 추가합니다.
				function showUploadedFile(uploadResultArr) {
					var str = "";
					
					$(uploadResultArr).each(function(i, obj) {
						
						// Page525 소스 코딩할 때 아래 1줄 소스는 주석 처리 합니다.
						// str += "<li>" + obj.fileName + "</li>";
						
						// Page525 소스 코딩 시작 : showUploadedfile()메서드에
						// 이미지 파일이 아닌 경우 파일 아이콘을 보여주게 합니다.
						if(!obj.image){
							// Page537 코딩할 때 아래 1줄 소스는 주석 처리 해줌.
							// str += "<li><img src='/resources/img/attach.png'>" + obj.fileName + "</li>";
							
							// Page528 아래 2줄 소스 코딩 추가
							var fileCallPath = encodeURIComponent(obj.uploadPath+ "/" + obj.uuid + "_" + obj.fileName);
							// Page546 소스 코딩 할때 아래 1줄 소스 주석 처리
							// Page537 아래 소스 코딩
							// str += "<li><a href='/download?fileName=" + fileCallPath + "'>" + "<img src='/resources/img/attach.png'>"+obj.fileName+"</a></li>"
									
							// Page546 아래 1줄 소스 코딩 추가
							str += "<li><div><a href='/download?fileName=" + fileCallPath + "'>" + "<img src='/resources/img/attach.png'>"+obj.fileName+"</a>"+"<span data-file=\'"+fileCallPath+"\' data-type='file'> x </span>"+"</div></li>"
							
						} else{
							
							// Page538 아래 1줄 소스 코딩 수정
							var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_" + obj.uuid + "_" + obj.fileName);
							// Page541 아래 1줄 소스 코딩 추가
							var originPath = obj.uploadPath+ "\\" + obj.uuid + "_" + obj.fileName;
							// Page541 아래 1줄 소스 코딩 추가
							originPath = originPath.replace(new RegExp(/\\/g), "/");							
							
							// Page541 소스 코딩할 때 아래 1줄 소스는 주석 처리해 줌.
							// Page528 아래 1줄 소스 코딩 내용							
							// str += "<li><img src=' /display?fileName="+fileCallPath + "'></li>";
							
							// Page541 아래 1줄 소스 코딩 추가
							// 이미지 첨부파일의 경우 업로드된 경로와 UUID가 붙은 파일의 이름이 필요하기 때문에 originPath라는 변수를 통해서 하나의 문자열로 생성합니다.
							// 생성된 문자열은 '\' 기호 때문에 일반 문자열과는 다르게
							// 처리되므로, '/'로 변환한 뒤 showImage()에
							// 파라미터로 전달합니다.
							// 프로젝트 실행 후에 웹 브라우저에서 파일 업로드 이후에
							// 섬네일을 클릭하면 showImage()가 호출되는 것을
							// 확인해 봅니다.
							// Page546 소스 코딩할 때 아래 1줄 소스 주석 처리
							// str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\"><img src=' /display?fileName="+fileCallPath + "'></li>";
							
							// Page546 아래 1줄 소스 코딩 추가
							str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\">"+"<img src='display?fileName="+fileCallPath+"'></a>"+"<span data-file=\'" + fileCallPath+"\' data-type='image'> x </span>" + "</li>";
							
							// Page528 소스 코딩할 때 아래 1줄 소스는 주석 처리함
							// str += "<li>" + obj.fileName + "</li>";
							
							// Page537 코딩할 때 아래 1줄 소스는 주석 처리 해줌.
							// str += "<li><img src='/display?fileName="+fileCallPath+"'></li>";
							
						}
						// Page525 소스 코딩 끝
					});
					
					uploadResult.append(str);
				}
			
			
			
		});
		
	</script>
	
</body>
</html>
