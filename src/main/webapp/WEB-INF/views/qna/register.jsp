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
<body>

 	<form role="form" action="/qna/register" method="post">
 	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
          <div class="form-group">
            <label>Title</label> <input class="form-control" name='q_title'>
          </div>
          <div class="form-group">
            <label>Text area</label>
            <textarea class="form-control" rows="3" name='q_content'></textarea>
          </div>

          <div class="form-group">
            <label>Writer</label>
       <input class="form-control" name='q_writer' value='<sec:authentication property="principal.user.USER_NICKNAME"/>' readonly="readonly">
       
          </div>
          <button type="submit" class="btn btn-default">Submit
            Button</button>
          <button type="reset" class="btn btn-default">Reset Button</button>
        </form>



</body>
</html>