<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jquery CDN -->   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!-- JQuery UI -->
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto" style="height: 100%">
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>여담: 일정 만들기</title>
	
	
	<!-- kakao Map API -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${client_id}&libraries=services"></script>

	
	<!-- 부트스트랩 코드 넣기 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<!-- 이모티콘 코드 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<!-- 참조  css, js 코드 -->
	<link rel="stylesheet" href="<c:url value='/css/travelForm.css'/>">
	
	<%@ page import="java.util.Date"%>
	<%@ page import="java.text.SimpleDateFormat"%>
	<%
		Date nowTime = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String region = request.getParameter("region");
	%>
	
	<!-- 부트스트랩 script(상단용) -->
	<link rel="canonical" href="https://getbootstrap.kr/docs/5.3/examples/sidebars/">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">


<style>
	* { font-family: 'SUIT-Bold'; }
</style>
</head>
<body style="height: 100%" oncontextmenu="return false">
<c:set var="areaCode" value="getRegion()"/>
<!-- 비행기 아이콘 -->
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol id="plain" viewBox="0 0 16 16"> <!-- 비행기 아이콘 -->
    <image class="bi" src="https://cdn-icons-png.flaticon.com/512/7893/7893979.png" style="width: 30; height: 24;"/>
  </symbol>
</svg>
<!-- header - tramvelForm -->
<div class="travel-title">
	<div class="row">
		<form action="saveBtn" method="get">
		<div class="div_title col-9">
			<label class="title">여행 제목 : </label>
			<input type="hidden" id="areaCode" name="areaCode" value="">
			<input type="hidden" id="travelID" name="travelID" value="${travelID}">
			<input class="text" name="travelTitle" id="travelTitle" value="${dto.travelTitle}" style="font-family: 'SUIT-Bold';">
			<div class="calendar">
				<label class="calendar_sdate">여행 시작일 : </label>
				<input class="input-date" type="date" name="SDate" id="SDate" value="${dto.SDate}" min="<%= sdf.format(nowTime) %>">
				<p class="wave">~</p>
				<label class="calendar_edate">여행 종료일 : </label>
				<input class="input-date" type="date" name="EDate" id="EDate" value="${dto.EDate}" min="<%= sdf.format(nowTime) %>">
			</div>
		</div>
  		<div class="region div_title col-2" style="white-space:nowrap;">
			<jsp:include page="travel/region.jsp" flush="false" />
		</div>
		<div class="div_title col-1">
			<button class="travel-title_submit" onclick="save()">저장</button>
<!-- 			<button class="travel-title_close" onclick="if(confirm('그만 만드시겠어요?')) history.back(); else alert('닫기 취소')">닫기</button> -->
			<button class="travel-title_close" onclick="close()">닫기</button>
		</div>
		</form>
	</div>
</div>
<!-- header - tramvelForm 끝 -->
	
	
	
<!-- content -->
<div id='wrapper' style="height: 100%">
	<main class="d-flex flex-nowrap" style="height: 100%">
<!-- DAYS box -->
		<div class="d-flex flex-column flex-shrink-0 bg-body-tertiary" style="width: 140px;">
			<div class="plan-daysbox nav nav-pills nav-flush flex-column mb-auto text-center">
				<div class="plan-daysboxtitle">일정</div>
				<!-- 사용자 입력을 받은 만큼 반복문 사용  (days) -->
				<div class="select-job-items1 nav-item">
					<div style="text-align: -webkit-center;">
						<table id="myTable" class="table">
							<thead>
							</thead>
							<tbody id="tbody"></tbody>
						</table>
					</div>
				</div>
		
				<input type="hidden" id="day_hidden" value="0">
		
			</div>
		</div>
<!-- DAYS box 끝 -->

		<div class="b-example-divider b-example-vr"></div>

<!-- 세부 일정 -->
		<div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-body-tertiary" style="width: 280px;">
	
		  <!-- 타이틀 -->
		  <div class="d-flex align-items-center flex-shrink-0 p-4 border-bottom justify-content-center">
		    <span class="fs-5 fw-semibold">세부 일정</span>
		  </div>
		
		  <!-- 세부 일정 목록 -->
		  <!-- 수정(2023.11.07) jqueryUI의 리스트 순서 변경 함수 사용하기 위해 div를 ul로 변경 -->
		  <ul class="scheduleList list-group list-group-flush border-bottom scrollarea" id="scheduleList_sortable">
		  </ul>
		</div>

<!-- 세부 일정 끝 -->
		<div class="b-example-divider b-example-vr"></div>

<!-- 검색 -->
    	<div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-body-tertiary" style="width: 300px; overflow-y: scroll;">

	      <!-- 타이틀 -->
	      <div class="d-flex align-items-center flex-shrink-0 p-4 border-bottom justify-content-center">
	        <span class="fs-5 fw-semibold">검색</span>
	      </div>
		  
	      <!-- 검색창-kakao -->
		  <div id="menu_wrap">
		      <div class="d-flex align-items-center flex-shrink-0 p-1 border-bottom justify-content-center row">
		        <div class="row">
		          <button class="col m-1 small btn btn-light" onclick="hotelBtnclick()">숙박 <i class="fa-solid fa-hotel"></i></button>
		          <button class="col m-1 small btn btn-light" onclick="foodBtnclick()">음식 <i class="fa-solid fa-utensils"></i></button>
		          <button class="col m-1 small btn btn-light" onclick="sightseeingBtnclick()">관광 <i class="fa-solid fa-mountain-sun"></i></button>
		        </div>
		        <div class="row">
		          <form onsubmit="searchPlaces(); return false;">
			          <input type="text" id="keyword" class="col-7 m-1" value="" style="font-size: small;" placeholder="검색어를 입력하세요.">
			          <button id="searchBtn" class="col-3 m-1 btn btn-light border-dark">검색</button>
		          </form>
		        </div>
		      </div>
	      
	      <!-- 검색결과-kakao -->
			  <div>
			  	<div class="list-group list-group-flush border-bottom scrollarea" id="placesList"></div>
		        <div id="pagination"></div>
			  </div>
		  
		  </div>
		  
	    </div>
<!-- 검색 끝 -->
		<div>
			<form action="" id="savePlan">
				<input type="hidden" class="hidden_input">
			</form>
		</div>
		
		<div class="b-example-divider b-example-vr"></div>
		
<!-- 지도 -->
	<div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-body-tertiary col">
		<!-- 지도API -->
		<div id="map" style="width:100%;height:100%;"></div>
		<script src="js/kakaoMap.js"></script>
    </div>
<!-- 지도 끝 -->

  </main>
</div>
<!-- content 끝 -->

	<!-- 부트스트랩 script (최하단에 위치) -->
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

	<!-- Custom JS -->
	<script src="js/travelForm.js"></script> <!-- DAY? 만들기 -->
	<script src="js/schedule.js"></script> <!-- 세부 일정 추가 -->
</body>
</html>