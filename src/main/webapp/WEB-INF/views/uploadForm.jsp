<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>uploadForm jsp</title>
</head>
<body>
	<!-- uploadForm jsp 파일에는 간단하게 form 태그만을 생성하고 input type file을
	추가합니다. 실제 전송은 uploadFormAction 경로를 이용해서 처리합니다. 파일 업로드에서
	주의할 부분은 enctype 속성값을 multipart/form-data로 지정하는 것입니다.
	input type file의 경우 multiple 속성 설정을 이용하여, 하나의 input 태그로
	한꺼번에 여러 개의 파일을 업로드할 수 있도록 합니다. 참고로, multiple 속성은
	브라우저 버전에 따라 지원 여부가 달라지며, IE의 경우 10 버전 이상에서만 사용할 수 있습니다. -->
	<form action="uploadFormAction" method="post" enctype="multipart/form-data">
		<input type="file" name="uploadFile" multiple="multiple">
		<button>Submit</button>	
	</form>
</body>
</html>
