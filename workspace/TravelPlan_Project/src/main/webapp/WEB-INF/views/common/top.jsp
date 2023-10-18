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
 		width: 150px;
 		height: 50px;
	}
	 #navigation {
        text-align: center; /* 텍스트 수평 중앙 정렬 */
    }

    #navigation a {
        display: inline-block; /* 인라인 블록 요소로 만들어 가로로 나란히 배치 */
        margin: 0 10px; /* 요소들 사이의 간격 조절 */
        text-decoration: none; /* 링크 밑줄 제거 */
    }
 .btn {
        height: 30px; 
        width: 10px
        float: right;
        margin-right: 10px;
    }
</style>

</head>
<body>
<c:if test="${empty loginInfo}">
<img src="images/logo.png" id="logo" alt="logo">
<div id="navigation">
         <a>일정 만들기</a>
         <a>일정 보관함</a>
         <a>게시판</a>
         <button onclick="" class="btn">회원가입</button>
         <button onclick="" class="btn">로그인</button>
</div>
</c:if>

<c:if test="${!empty loginInfo}">
<img src="images/logo.png" id="logo" alt="logo">
 <div id="navigation">
         <a>일정 만들기</a>
         <a>일정 보관함</a>
         <a>게시판</a>
         <button onclick="" class="btn">마이페이지</button>
         <button onclick="" class="btn">로그아웃</button>
 </div>
</c:if>
</body>
</html>