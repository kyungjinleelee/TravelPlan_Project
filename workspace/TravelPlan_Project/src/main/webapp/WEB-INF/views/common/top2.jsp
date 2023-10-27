<!-- 부트스트랩 버전 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>top.jsp</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 <!--   <link href="style.css" rel="stylesheet" type="text/css" /> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script> 
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
</head>




<body>
  <nav class="navbar navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">
        <img src=""> <!-- 로고 사진 -->
        <span style="color: #1E90FF"> <b style="font-size: 25px">
            여 담; 여행을 담다
        </b></span> 
      </a>
      <div class="d-grid gap-2 d-md-flex justify-content-md-end">
         <!-- JSTL을 사용하여 로그인 여부에 따라 버튼을 표시 -->
        <c:choose>
          <c:when test="${empty loginInfo}">
            <button type="button" class="btn btn-outline-primary" id="signup" >회원가입</button>
			<button class="btn btn-primary" type="button" id="signin">로그인</button>
          </c:when>
          <c:otherwise>
           <button type="button" class="btn btn-primary" id="mypage">마이페이지</button>
		   <button class="btn btn-danger" type="button" id="logout">로그아웃</button>
          </c:otherwise>
        </c:choose>
        <!-- 여기까지 -->
      </div>
    </div>
  </nav>
  



  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="#" style="color: #1E90FF">Best일정</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link" aria-current="page" href="#">일정 만들기</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="travelList">일정 보관함</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
              aria-expanded="false">
              게시판
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="#">여담 게시판</a></li>
              <li><a class="dropdown-item" href="#">일반 게시판</a></li>
              <li>
                <hr class="dropdown-divider">
              </li>
              <li><a class="dropdown-item" href="#">Something else here</a></li>
            </ul>
          </li>
        </ul>
    <!-- <form class="d-flex"> --> 
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" style="width: 200px;">
          <button type="button" class="btn btn-outline-info">Search</button>
    <!-- </form>--> 
      </div>
    </div>
  </nav>

</body>
</html>



