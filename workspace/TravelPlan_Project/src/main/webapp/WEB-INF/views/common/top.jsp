<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>top</title>

<style>
	#logo{
 		width: 30px;
 		height: 30px;
	}
</style>

</head>
<body>
<c:if test="${empty loginInfo}">
<img src="images/logo.png" id="logo" alt="logo">
<a>일정 만들기</a>
<a>일정 보관함</a>
<a>게시판</a>
<button onclick="" class="btn">회원가입</button>
<button onclick="" class="btn">로그인</button>
</c:if>

<c:if test="${!empty loginInfo}">
<img src="images/logo.png" id="logo" alt="logo">
<a>일정 만들기</a>
<a>일정 보관함</a>
<a>게시판</a>
<button onclick="" class="btn">마이페이지</button>
<button onclick="" class="btn">로그아웃</button>
</c:if>
</body>
</html>