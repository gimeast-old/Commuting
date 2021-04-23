<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- jquery-3.6.0 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/comm.js"></script>

<script type="text/javascript">

function login() {
	var userId = $('#userId').val();
	var userPw = $('#userPw').val();
	
	if(userId.length == 0) {
		alert('id를 입력하세요');
	}else if(userPw.length == 0) {
		alert('pw를 입력하세요');
	} else {
		var frm = $('#frm');
		frm.attr('action',"<c:url value='/j_spring_security_check'/>");
		frm.attr('method','post');
		frm.submit();
	}
}
</script>
</head>
<body>
<form id="frm">
  <div class="col-xs-2">
    <label for="staticEmail2" class="sr-only">ID</label>
    <input type="text" class="form-control" id="userId" name="userId" placeholder="ID">
  </div>
  <div class="col-xs-2">
    <label for="inputPassword2" class="sr-only">Password</label>
    <input type="password" class="form-control" id="userPw" name="userPw" placeholder="Password">
  </div>
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
<button type="button" onclick="login()" class="btn btn-primary mb-2">로그인</button>
</body>
</html>