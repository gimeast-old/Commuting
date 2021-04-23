<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
<script type="text/javascript">
</script>
</head>
<body>
<ul>
	<li>
		<a href="${pageContext.request.contextPath }/member/join">회원가입</a>
	</li>
	<li>
		<c:choose>
			<c:when test="${userId != 'anonymousUser' }">
				<a href="${pageContext.request.contextPath }/member/logout">로그아웃</a>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath }/member/login">로그인</a>
			</c:otherwise>			
		</c:choose>
	</li>
	<li>
		<a href="${pageContext.request.contextPath }/admin/board">운영자 게시판</a>
	</li>
</ul>
</body>
</html>