<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
  <head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>    
	
	<!-- jquery CDM -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
  
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">

    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/headers/">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">

<style>
	@font-face {
    	font-family: 'SUIT-Medium';
    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Medium.woff2') format('woff2');
    	font-weight: normal;
    	font-style: normal;
	}
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
        width:150px;
        height: 80px;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
      
      .menu a {
      	color: black;
      	font-family: 'SUIT-Medium';
      }
      
      .btn{
      font-family: 'SUIT-Medium';
      }
    </style>

	<script>
		$(document).ready(function(){
			$("#signin").on("click", function(){
				location.href="loginForm";
			});
			$("#signup").on("click", function(){
				location.href="memberUI";
			});
			$("#mypage").on("click", function(){
				location.href="/app/loginCheck/mypage";
			});
			$("#logout").on("click", function(){
				location.href="/app/loginCheck/logout";
			});
		});
	</script>
</head>
<body>

<main>
  <div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-between py-3 mb-4 border-bottom">
      <a href="/app/main" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <image class="bi" src="/app/images/logo_roof.png" style="width: 40; height: 32;"/> <!-- 로고 -->
      </a>

      <ul class="menu nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="/app/main" class="nav-link px-4">홈</a></li>
        <li><a href="/app/loginCheck/pickLocation" class="nav-link px-4">일정만들기</a></li> 
        <li><a href="/app/loginCheck/travelList" class="nav-link px-4">일정보관함</a></li>
        <li><a href="/app/Board" class="nav-link px-4">게시판</a></li>
      </ul>
	
		<!-- 로그인 X -->
	  <c:if test="${empty loginInfo}">
      <div class="col-lg-3 text-end">
        <button type="button" id="signin" class="btn btn-outline-primary me-2">로그인</button>
        <button type="button" id="signup" class="btn btn-primary">회원가입</button>
      </div>
      </c:if>
      
		<!-- 로그인 O -->
	  <c:if test="${!empty loginInfo}">
      <div class="col-lg-3 text-end">
        <button type="button" id="mypage" class="btn btn-outline-primary me-2">마이페이지</button>
        <button type="button" id="logout" class="btn btn-primary">로그아웃</button>
      </div>
      </c:if>
      
    </header>
  </div>
</main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  </body>
</html>