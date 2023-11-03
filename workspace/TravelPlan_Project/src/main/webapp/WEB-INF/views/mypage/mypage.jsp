<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <!-- 부트스트랩 CSS 추가 -->
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
    <!-- CSS 파일 경로 -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/mypage.css'/>">
</head>
<body id="myPageBody">

	<div class="mydiv text-center d-flex justify-content-center">
	    <form>
		안녕하세요, ${loginInfo.name}님!<br>
		<h1>마이페이지</h1>
		<br>
		<button type="button" onclick="location.href='memberInfo'" class="myBtn">회원 정보 수정</button>
		<button type="button" onclick="location.href='travelList'" class="myBtn">일정보관함</button>
		<button type="button" onclick="location.href='UlList'" class="myBtn">좋아요 목록</button>
		<button type="button" onclick="location.href='writeList'" class="myBtn">내가 쓴 글 보기</button>
		<button type="button" onclick="location.href='memberDeleteForm'" class="myBtn btn btn-danger" style="background-color: rgb(220, 53, 69);">회원 탈퇴하기</button>
		</form>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>