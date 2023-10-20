<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value='/css/top.css'/>">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>    

<!-- jquery CDM -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#signin").on("click", function(){
			location.href="loginForm";
		});
		$("#signup").on("click", function(){
			location.href="memberUI";
		});
		$("#mypage").on("click", function(){
			location.href="mypage";
		});
		$("#logout").on("click", function(){
			location.href="loginCheck/logout";
		});
	});
</script>

<c:if test="${empty loginInfo}">
<div id="top">
	<ul>
    <li><a href="main"><img src="images/logo.png" id="logo" alt="logo"></a></li>
    <li><a href="<c:url value='/'/>">일정 만들기</a></li>
    <li><a href="<c:url value='/'/>">일정 보관함</a></li>
    <li><a href="<c:url value='/'/>">게시판</a></li>
    <li><button class="btn" id="signup">회원가입</button></li>
    <li><button class="btn" id="signin">로그인</button></li>
</ul>
</div>
</c:if>

<c:if test="${!empty loginInfo}">
<div id="top">
	<ul>
    <li><a href="main"><img src="images/logo.png" id="logo" alt="logo"></a></li>
    <li><a href="<c:url value='/'/>">일정 만들기</a></li>
    <li><a href="<c:url value='/'/>">일정 보관함</a></li>
    <li><a href="<c:url value='/'/>">게시판</a></li>
    <li><button class="btn" id="mypage">마이페이지</button></li>
    <li><button class="btn" id="logout">로그아웃</button></li>
</ul>
</div>
</c:if>