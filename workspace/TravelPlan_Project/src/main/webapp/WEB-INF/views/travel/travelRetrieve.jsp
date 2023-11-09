<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.List" %>
<%@ page import="com.dto.PlanDTO" %>

<!DOCTYPE html>
<html style="height: 100%">
<head>
	<meta charset="utf-8">
	    <title>Travel Details</title>
	    
	<!-- ------------------------------------------------------------------------------------------------------------- -->
	<!-- kakao Map API -->
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
	
	<!-- day 버튼 이벤트-->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <style>
    .plan-days {
    background-color: #B7E1F5;
    border: none;
    cursor: pointer;
    padding: 25px 0;
    font-size: 22px;
    border-bottom: 1px solid white;
    width: 100%;
    margin-bottom: 0px;
    color: #0c3b54;
    font-family: 'SUIT-Bold';
}

    </style>
    
    <script>
    var markers = []; // 마커 배열 (전역 변수)
    
    $(function(){
    	 var obj = {};  // day버튼
    	    <c:forEach items="${planList}" var="plan" varStatus="status">
    	        if(!obj["${plan.day_num}"]){
    	            obj["${plan.day_num}"] = [];  //day_num에 해당하는 키 없을 시, 새로운 배열 생성하여 obj 객체에 담음
    	        }
    	        obj["${plan.day_num}"].push({   //day_num을 키로 하고 해당 날짜에 대한 일정 목록을 값으로 가짐
    	            item: "${plan.item}",
    	            item_add: "${plan.item_add}",
    	            time: "${plan.time}",
    	            time: "${plan.time}",
    	            mapx: "${plan.mapx}",
    	            mapy: "${plan.mapy}",
    	            idx: "${plan.idx}"
    	        })
    	    </c:forEach>

    	    var days = '';  //days 초기화. 일정 버튼 저장할 HTML 문자열 가짐.
    	    
    	    Object.keys(obj).forEach(function(e){  //obj객체의 키를 반복하면서 day_num에 대한 버튼 생성
    	    	 //TODO: html 수정  
    	        days += '<button class="btn btn-primary plan-days" data-day='+e+'>DAY '+e+'</button>';
    	    });

    	    $('#test-days tbody').html(days);  //test-days 테이블의 tbody에 일정 버튼 추가
    	    
    	    	// 마커 초기화
	 	    	clearMarkers(); 
    	    
    	  	//-----------plan-days 버튼 클릭 이벤트 시작------------
    	  	// 버튼 클릭시 해당 날짜의 일정 항목이 test-plan-item에 동적으로 생성됨
    	    $(".plan-days").on("click", function(){  
    	    	var day = $(this).data("day");
    	    	var planList = obj[day];
    	    	
    	    	$("#test-plan-item").empty();
    	    	
    	    	// 선택한 day에 속하는 세부일정의 위치 정보 저장
    	    	 var dayPlans = [];
    	    	    planList.forEach(function(plan) {
    	    	      dayPlans.push({ mapx: plan.mapx, mapy: plan.mapy });
    	    	    
    	    		// TODO html 수정
    			    var html = ' <a href="#" class="list-group-item list-group-item-action py-3 lh-sm" aria-current="true">';
    			    html+='<div class="d-flex w-100 align-items-center justify-content-between">';
    			    html+=' <p> <strong class="mb-1">'+plan.item+'</strong> </p>';
    			    html+='<small class="text-body-secondary">'+plan.time+'</small>';
    			    html+='</div>';
    			    html+='<div class="col-10 mb-1 small">'+plan.item_add+'</div>';
    			    html+='</a>';
    		
    	    		$("#test-plan-item").append(html);  //html을 추가하여 세부 일정에 표시
    	    	
    	    		// 테스트 코드
//     	    		console.log(plan.item);
//   	    		console.log(plan.mapx);
//    	    		console.log(plan.mapy); 
    	    	});
    	    
    	    		// 마커 추가
    	    		addMarkers(dayPlans);
    	    		
    	    });
    	    
    	    //-----------plan-days 버튼 클릭 이벤트 끝------------
    	    
    	    
    	    // 초기화 함수
    	    function clearMarkers() {
    	        markers.forEach(function(marker) {
    	            marker.setMap(null);
    	        });
    	        markers = [];
    	    }
    	    	
    	    	
    	    });  
    	  //---------------------------------- function() 끝 ----------------------------------
    	   
    	    // 마커 추가 함수
    	    function addMarkers(dayPlans) {
    		  
    	    	// 마커 이미지의 이미지 크기입니다
    	    	var imageSize = new kakao.maps.Size(50, 50);

    	    	// 마커 이미지를 생성합니다
    	    	var imageSrc = 'https://cdn-icons-png.flaticon.com/512/5860/5860579.png'; // 사용할 마커 이미지 파일 경로를 지정해야 합니다
    	    	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

    	          // Kakao Map
    	          kakao.maps.load(function() {
    	            var container = document.getElementById('map');
    	            var options = {
    	              center: new kakao.maps.LatLng(dayPlans[0].mapy, dayPlans[0].mapx),  //첫 번째 마커 위치를 기준으로 중심 위치 설정
    	              level: 3
    	            };

    	            var map = new kakao.maps.Map(container, options);

	    	        // 마커 생성하고 추가
	    	        dayPlans.forEach(function(plan) {
		    	        var mapx = plan.mapx;
		    	        var mapy = plan.mapy;
	    	          
	    	            // 마커 생성
	    	            var markerPosition = new kakao.maps.LatLng(mapy, mapx);
	    	            var marker = new kakao.maps.Marker({
	    	                position: markerPosition,
	    	                image: markerImage // 마커 이미지 설정
	    	            });
	
	    	            // 지도에 마커 출력
	    	            marker.setMap(map);
	    	            markers.push(marker);
	    	            
	    	            // 테스트 코드
	    	            console.log(markers);
	    	          });
	    	      });
    	      }

	</script>
	
</head>
<body style="height: 100%">

<!-- ------------------------------------------------------------------------------------------------------------- -->	    
<!-- header - travelForm -->
<div class="travel-title">
	<div class="row">
		<div class="div_title col-9">
			<label class="title">여행 제목 : </label>
			<input class="text" name="travelTitle" id="travelTitle" value="${travelListDTO.travelTitle}" style="font-weight: bold;" disabled>
			<div class="calendar">
				<label class="calendar_sdate">여행 시작일 : </label>
				<input class="input-date" name="SDate" id="SDate" value="${travelListDTO.SDate}"  disabled>
				<%-- <input class="input-date" type="date" name="SDate" id="SDate" value="${TravelListDTO.SDate}">  --%>
				<p class="wave">~</p>
				<label class="calendar_edate">여행 종료일 : </label>
				<input class="input-date" name="EDate" id="EDate" value="${travelListDTO.EDate}"  disabled>
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
<div id='wrapper' style="height: 100%">
	<main class="d-flex flex-nowrap" style="height: 100%">
	<!-- DAYS box : 유저가 저장한 만큼 나오게 수정하기 / day마다 클릭하면 저장된 세부일정 나오게 수정하기 -->
	<div class="d-flex flex-column flex-shrink-0 bg-body-tertiary" style="width: 140px;">
		<div class="plan-daysbox nav nav-pills nav-flush flex-column mb-auto text-center">
			<div class="plan-daysboxtitle">일정</div>
				<div id="test-days" class="select-job-items1 nav-item">
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
		  <div id="test-plan-item" class="list-group list-group-flush border-bottom scrollarea">
		    <a href="#" class="list-group-item list-group-item-action py-3 lh-sm" aria-current="true">
		      <div class="d-flex w-100 align-items-center justify-content-between">
		       <p> <strong class="mb-1">${planDTO.item}</strong> </p>
		        <small class="text-body-secondary">${planDTO.time}</small>
		      </div>
		      <div class="col-10 mb-1 small">${planDTO.item_add}</div>
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
			<script src="../js/kakaoMap2.js"></script>
	    </div>
	<!-- 지도 끝 -->		
		
</main>
</div>  
</body>
</html>		  
