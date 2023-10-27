<!-- 부트스트랩 버전 -->

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
    <style>
    
	    .title {
	      font-size: 40px;
	      font-weight: bold;
	      text-align: center;
	      margin: 50px 0;
	    }
	
	    form {
	      width: 500px;
	      height: 500px; 
	      display: flex;
	      flex-direction: column;
	      align-items: center;
	      border: 1px solid rgb(89, 117, 196);
	      border-radius: 20px;
	      padding: 20px;
	      background-color: white;
	      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	    }
    </style>
</head>
<body>
  <!-- 컨텐츠 추가 -->
  <div class="container mt-5 d-flex justify-content-center" >
    <form class="p-4 border rounded bg-white d-flex flex-column align-items-center">
      <p class="text-center">안녕하세요, ${loginInfo.name}님!</p>
      <h1 class="title">마이페이지</h1>
      <!-- 버튼 스타일 수정 -->
      <div class="d-grid gap-2 col-12 mx-auto">
        <button class="btn btn-primary btn-lg" type="button" onclick="location.href='memberInfo'">회원 정보 수정</button>
        <button class="btn btn-primary btn-lg" type="button" onclick="location.href='travelList'">일정 보관함</button>
        <button class="btn btn-primary btn-lg" type="button" onclick="location.href='likeList'">좋아요 목록</button>
        <button class="btn btn-primary btn-lg" type="button" onclick="location.href='writeList'">내가 쓴 글 보기</button>
      </div>
    </form>
  </div>
</body>
</html>