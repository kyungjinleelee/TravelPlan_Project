<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
  <head>
  	<script src="/docs/5.3/assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>일정 만들기</title>
<!-- Map API -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${client_id}&libraries=services"></script>
	
<!-- travelForm -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- 참조  css, js 코드 -->
	<link rel="stylesheet" href="<c:url value='/css/travelForm.css'/>">
	<script src="js/travelForm.js"></script>
	<%@ page import="java.util.Date" %>
	<%@ page import="java.text.SimpleDateFormat" %>
	<%
		Date nowTime = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String region = request.getParameter("region");
	%>

<!-- 부트스트랩 -->
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.3/examples/sidebars/">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
	
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<!-- Favicons -->
	<!-- <link rel="apple-touch-icon" href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
	<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
	<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
	<link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
	<link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
	<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon.ico">
	<meta name="theme-color" content="#712cf9"> -->


    <style>
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
        width: 100%;
        height: 3rem;
        background-color: rgba(255, 255, 255, 0.1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
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

      .btn-bd-primary {
        --bd-violet-bg: #712cf9;
        --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

        --bs-btn-font-weight: 600;
        --bs-btn-color: var(--bs-white);
        --bs-btn-bg: var(--bd-violet-bg);
        --bs-btn-border-color: var(--bd-violet-bg);
        --bs-btn-hover-color: var(--bs-white);
        --bs-btn-hover-bg: #6528e0;
        --bs-btn-hover-border-color: #6528e0;
        --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
        --bs-btn-active-color: var(--bs-btn-hover-color);
        --bs-btn-active-bg: #5a23c8;
        --bs-btn-active-border-color: #5a23c8;
      }
      .bd-mode-toggle {
        z-index: 1500;
      }
      
      .b-example-vr {
        flex-shrink: 0;
        width: 0.3rem;
        height: 200vh;
      }
    </style>

    
<!-- Custom styles for this template -->
    <!-- <link href="sidebars.css" rel="stylesheet"> -->
</head>
<body>
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol id="plain" viewBox="0 0 16 16"> <!-- 비행기 아이콘 -->
    <image class="bi" src="https://cdn-icons-png.flaticon.com/512/7893/7893979.png" style="width: 30; height: 24;"/>
  </symbol>
</svg>

<!-- header - tramvelForm -->
<div class="travel-title">
	<label class="title">여행 제목 : </label>
	<input class="text" name="travelTitle" id="travelTitle">
	<div class="calendar">
		<label class="calendar_sdate">여행 시작일 : </label>
		<input class="input-date" type="date" name="SDate" id="SDate" value="" min="<%= sdf.format(nowTime) %>">
		<p class="wave">~</p>
		<label class="calendar_edate">여행 종료일 : </label>
		<input class="input-date" type="date" id="EDate" value="EDate" min="<%= sdf.format(nowTime) %>">
	</div>
	<div>
		<select name="area" class="select">
			<option value="1">서울</option>
			<option value="2">인천</option>
			<option value="3">대전</option>
			<option value="4">대구</option>
			<option value="5">광주</option>				
			<option value="6">부산</option>				
			<option value="7">울산</option>				
			<option value="8">세종</option>				
			<option value="31">경기</option>				
			<option value="32">강원</option>				
		</select>
	</div>
	<button class="travel-title_submit" onclick="save()">저장</button>
	<button class="travel-title_close" onclick="if(confirm('그만 만드시겠어요?')) history.back(); else alert('닫기 취소')">닫기</button>
</div>
<!-- header - tramvelForm 끝 -->

<!-- content -->
<div id='wrapper'>
  <main class="d-flex flex-nowrap">
    <!-- 날짜 -->
    <div class="d-flex flex-column flex-shrink-0 bg-body-tertiary" style="width: 4.5rem;">
      <!-- 홈으로 -->
      <a href="main" class="d-block p-3 link-body-emphasis text-decoration-none" title="Icon-only" data-bs-toggle="tooltip" data-bs-placement="right">
        <image class="bi" src="https://cdn-icons-png.flaticon.com/512/7893/7893979.png" style="width: 30; height: 24;"/>
        <span>여담</span>
      </a>

      <!-- 날짜 - c:foreach 사용하기 -->
      <ul class="nav nav-pills nav-flush flex-column mb-auto text-center">

        <li class="nav-item">
          <!-- 선택된 날짜 -->
          <a href="#" class="nav-link active py-3 border-bottom rounded-0" aria-current="page" title="Home" data-bs-toggle="tooltip" data-bs-placement="right">
            <svg class="bi pe-none" width="24" height="24" role="img" aria-label="Home"><use xlink:href="#home"/></svg>
          </a>
        </li>

        <li>
          <!-- 선택 안된 날짜 -->
          <a href="#" class="nav-link py-3 border-bottom rounded-0" title="Dashboard" data-bs-toggle="tooltip" data-bs-placement="right">
            <svg class="bi pe-none" width="24" height="24" role="img" aria-label="Dashboard"><use xlink:href="#speedometer2"/></svg>
          </a>
        </li>

      </ul>

    </div>
    <!-- DAYS box-수정전 -->
<!-- 		<div class="plan-daysbox"> -->
<!-- 			<div class="plan-daysboxtitle">일정</div> -->
 			<!-- 사용자 입력을 받은 만큼 반복문 사용  (days) -->
<!-- 			<div class="select-job-items1"> -->
<!-- 				<div style="text-align: -webkit-center;"> -->
<!-- 					<table id="myTable" class="table"> -->
<!-- 						<thead> -->
<!-- 						</thead> -->
<!-- 						<tbody id="tbody"></tbody> -->
<!-- 					</table> -->
<!-- 				</div> -->
<!-- 			</div> -->
	
<!-- 			<input type="hidden" id="day_hidden" value="0"> -->
	
<!-- 		</div> -->
	<!-- DAYS box 끝 -->

    <div class="b-example-divider b-example-vr"></div>

    <!-- 세부 일정 -->
    <div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-body-tertiary" style="width: 280px;">

      <!-- 타이틀 -->
      <div class="d-flex align-items-center flex-shrink-0 p-4 border-bottom justify-content-center">
        <span class="fs-5 fw-semibold">세부 일정</span>
      </div>

      <!-- 세부 일정 : c:foreach 사용하기 -->
      <div class="list-group list-group-flush border-bottom scrollarea">

        <a href="#" class="list-group-item list-group-item-action py-3 lh-sm" aria-current="true">
          <div class="d-flex w-100 align-items-center justify-content-between">
            <strong class="mb-1">List group item heading</strong>
            <small class="text-body-secondary">Mon</small>
          </div>
          <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
        </a>

        <a href="#" class="list-group-item list-group-item-action py-3 lh-sm">
          <div class="d-flex w-100 align-items-center justify-content-between">
            <strong class="mb-1">List group item heading</strong>
            <small class="text-body-secondary">Tues</small>
          </div>
          <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
        </a>

      </div>

    </div>
  

    <div class="b-example-divider b-example-vr"></div>

    <!-- 검색 -->
    <div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-body-tertiary" style="width: 300px;">

      <!-- 타이틀 -->
      <div class="d-flex align-items-center flex-shrink-0 p-4 border-bottom justify-content-center">
        <span class="fs-5 fw-semibold">검색</span>
      </div>
	  
      <!-- 검색창-kakao -->
	  <div id="menu_wrap">
      <div class="d-flex align-items-center flex-shrink-0 p-4 border-bottom justify-content-center row">
        <div class="row">
          <button class="col m-1 small">숙박</button>
          <button class="col m-1 small">음식</button>
          <button class="col m-1 small">관광</button>
        </div>
        <div class="row">
          <form onsubmit="searchPlaces(); return false;">
	          <input type="text" id="keyword" class="col-8 m-1" value="서울 맛집" style="font-size: small;" placeholder="검색어를 입력하세요.">
	          <button type="submit" id="searchBtn" class="col-3 m-1 btn-primary" >검색</button>
          </form>
        </div>
      </div>
      
      <!-- 검색결과-kakao -->
	  <div>
	  	<ul id="placesList"></ul>
        <div id="pagination"></div>
	  </div>
	  
	  </div>
	  
      <!-- 검색 결과 : c:foreach 사용하기 -->
      <div class="list-group list-group-flush border-bottom scrollarea">

        <div class="list-group-item list-group-item-action py-3 lh-sm">
          <div class="d-flex w-100 align-items-center justify-content-between">
            <strong class="mb-1">List group item heading</strong>
          </div>
          <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
          <div class="col-10 mb-1 small"><button class="btn-primary">추가</button></div>
        </div>
        
        <div class="list-group-item list-group-item-action py-3 lh-sm">
          <div class="d-flex w-100 align-items-center justify-content-between">
            <strong class="mb-1">List group item heading</strong>
          </div>
          <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
          <div class="col-10 mb-1 small"><button class="btn-primary">추가</button></div>
        </div>

      </div>
    </div>
    
    <div class="b-example-divider b-example-vr"></div>
    
    <!-- 지도 -->
	<div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-body-tertiary" style="width: 100%;">
		<!-- 지도API -->
		<div id="map" style="width:100%;height:100%;"></div>
		<script src="js/kakaoMap.js"></script>
	</div>
  </main>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<!-- Custom JS -->
<!-- <script src="js/travelForm.js"></script> -->
</body>
</html>