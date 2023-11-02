<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	    <title>Travel Details</title>
	    
	<!-- ------------------------------------------------------------------------------------------------------------- -->
	<!-- kakao Map API -->
	<!-- ${client_id}가 맞나?????? 추후 수정하기 -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${client_id}&libraries=services"></script>
	
	<!-- 부트스트랩 코드 넣기 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
	<!-- 참조  css, js 코드 -->
	<link rel="stylesheet" href="<c:url value='/css/travelForm.css'/>">
	
	<!-- 부트스트랩 script(상단용) -->
	<link rel="canonical" href="https://getbootstrap.kr/docs/5.3/examples/sidebars/">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">    
	<!-- ------------------------------------------------------------------------------------------------------------- -->
	
</head>
<body>

<!-- ------------------------------------------------------------------------------------------------------------- -->	    
<!-- header - travelForm -->
<div class="travel-title">
	<div class="row">
		<div class="div_title col-9">
			<label class="title">여행 제목 : </label>
			<input class="text" name="travelTitle" id="travelTitle" value="${TravelListDTO.travelTitle}" style="font-weight: bold;" disabled>
			<div class="calendar">
				<label class="calendar_sdate">여행 시작일 : </label>
				<input class="input-date" name="SDate" id="SDate" value="${TravelListDTO.SDate}"  disabled>
				<%-- <input class="input-date" type="date" name="SDate" id="SDate" value="${TravelListDTO.SDate}"> --%>
				<p class="wave">~</p>
				<label class="calendar_edate">여행 종료일 : </label>
				<input class="input-date" name="EDate" id="EDate" value="${TravelListDTO.EDate}"  disabled>
				<%-- <input class="input-date" type="date" id="EDate" value="EDate" min="<%= sdf.format(nowTime) %>"> --%>
			</div>
		</div>
		<div class="div_title col-1">
			<button class="travel-title_close" onclick="if(confirm('현재 일정을 닫을까요?')) history.back();">닫기</button>
		</div>	
	</div>
</div>
<!-- header - tramvelForm 끝 -->
<!-- ------------------------------------------------------------------------------------------------------------- -->		
<!-- content -->
<div id='wrapper'>
	<main class="d-flex flex-nowrap">
	<!-- DAYS box : 유저가 저장한 만큼 나오게 수정하기 / day마다 클릭하면 저장된 세부일정 나오게 수정하기 -->
	<div class="d-flex flex-column flex-shrink-0 bg-body-tertiary" style="width: 120px;">
		<div class="plan-daysbox nav nav-pills nav-flush flex-column mb-auto text-center">
			<div class="plan-daysboxtitle">일정</div>
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
	<div class="b-example-divider b-example-vr"></div>
	<!-- DAYS box 끝 -->
<!-- ------------------------------------------------------------------------------------------------------------- -->	
	<!-- 세부 일정 -->
	<div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-body-tertiary" style="width: 280px;">
	
		<!-- 타이틀 -->
		  <div class="d-flex align-items-center flex-shrink-0 p-4 border-bottom justify-content-center">
		    <span class="fs-5 fw-semibold">세부 일정</span>
		  </div>
		  
		  <!-- 세부 일정 : c:foreach 사용하기  : 일정만들기 토대로 추후 다시 수정 / 일정마다 누르면 지도 표시되게 수정하기 -->
		  <div class="list-group list-group-flush border-bottom scrollarea">
		
		    <a href="#" class="list-group-item list-group-item-action py-3 lh-sm" aria-current="true">
		      <div class="d-flex w-100 align-items-center justify-content-between">
		        <strong class="mb-1">명동교자 본점</strong>
		        <small class="text-body-secondary">Mon</small>
		      </div>
		      <div class="col-10 mb-1 small">존맛탱</div>
		    </a>
		
		    <a href="#" class="list-group-item list-group-item-action py-3 lh-sm">
		      <div class="d-flex w-100 align-items-center justify-content-between">
		        <strong class="mb-1">진옥화할매원조닭한마리 본점</strong>
		        <small class="text-body-secondary">Tues</small>
		      </div>
		      <div class="col-10 mb-1 small">서울 종로구 종로40가길 18</div>
		    </a>
		
		  </div>
		</div>

	<div class="b-example-divider b-example-vr"></div>
<!-- 세부 일정 끝 -->
<!-- ------------------------------------------------------------------------------------------------------------- -->	
	<!-- 지도 -->
		<div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-body-tertiary" style="width: 78%;">
			<!-- 지도API -->
			<div id="map" style="width:100%;height:100%;"></div>
			<script src="js/kakaoMap.js"></script>
	    </div>
	<!-- 지도 끝 -->		
		
		  
</body>
</html>		  
		  
	
	
	
	
	
	
		
		
 <%-- 	    <c:if test="${not empty TravelListDTO}">
	        <table>
	            <tr>
	                <th>travelID</th>
	                <th>userID</th>
	                <th>SDate</th>
	                <th>EDate</th>
	                <th>travelTitle</th>
	                <!-- 여기에서 표시할 필드 추가 -->
	            </tr>
	            <tr>
	                <td>${TravelListDTO.travelID}</td>
	                <td>${TravelListDTO.userID}</td>
	                <td>${TravelListDTO.SDate}</td>
	                <td>${TravelListDTO.EDate}</td>
	                <td>${TravelListDTO.travelTitle}</td>
	                <!-- 다른 필드 추가 -->
	            </tr>
	        </table>
	    </c:if> --%>






