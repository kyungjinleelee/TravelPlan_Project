<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여담; 일정 만들기</title>
<!-- 부트스트랩 코드 넣기 -->
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
</head>
<body>
	<div class="travel-title">
		<label class="title">여행 제목 : </label>
		<input class="text" name="travelTitle" id="travelTitle">
		<div class="calendar">
			<label class="calendar_sdate">여행 시작일 : </label>
			<input class="input-date" type="date" name="SDate" id="SDate" value="" min="<%= sdf.format(nowTime) %>">
			<p class="wave"> ~  </p>
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
	
	
	
	
<%-- <!-- 일정 만들기 맛집 리스트 -->
	<div>
		<ul class="plan-searchbox-ul">
			<c:forEach var="foodList" items="${foodList }">
				<li class="item" onmouseover="this.style.background='#F1F1F1'" onmouseout="this.style.background=''">
					<img src="${foodList.image2 }" class="tourListImg" width="110px" height="86px">
					<div class="info">
						<h5 class="item-name">${foodList.title }</h5>
						<span class="item-addr">${foodList.addr1 }</span>
					</div>
					<!-- 일정 추가하기 버튼 -->
				</li>
			</c:forEach>
		</ul>
	</div> --%>	
	

      <!-- DAYS box -->
		<div class="plan-daysbox">
			<div class="plan-daysboxtitle">일정</div>
			<!-- 사용자 입력을 받은 만큼 반복문 사용  (days) -->
			<div class="select-job-items1">
				<div style="text-align: -webkit-center;">
					<table id="myTable" class="table" >
					  <thead>
					  </thead>
					  <tbody id="tbody"></tbody>
					</table>
				</div>
			</div>
			
			<input type="hidden" id="day_hidden" value="0">
             
		</div>
		<!-- DAYS box -->
		

  

   
        
        <!-- 숙박 클릭 시 리스트 --> <!-- (c:forEach 사용한 검색결과 -->
	<div>
		<ul class="plan-searchbox-ul">
			<c:forEach var="hotelList" items="${hotelList }">
				<li class="item" onmouseover="this.style.background='#F1F1F1'" onmouseout="this.style.background=''">
					<img src="${hotelList.image2 }" class="tourListImg" width="110px" height="86px">
					<div class="info">
						<h5 class="item-name">${hotelList.title }</h5>
						<span class="item-addr">${hotelList.addr1 }</span>
					</div>
					<!-- 일정 추가하기 버튼 -->
					<div class="col-10 mb-1 small"><button class="btn-primary">추가</button></div>
				</li>
			</c:forEach>
		</ul>
	</div>
       
	
	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<!-- Custom JS -->
<!-- <script src="js/travelForm.js"></script> -->
	<script>
		$.datepicker.setDefaults({
			dateFormat: 'yy-mm-dd',
			prevText: '이전 달',
			nextText: '다음 달',
			monthNames: ['1월', '2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNamesShort: ['1월', '2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNames: ['일','월','화','수','목','금','토'],
			dayNamesShort: ['일','월','화','수','목','금','토'],
			dayNamesMin: ['일','월','화','수','목','금','토'],
			showMonthAfterYear: true,
			yearSuffix: '년'
		});
		
		$(function(){
			
//$("#regDate1").datepicker({minDate: 0});
//$("#regDate2").datepicker({minDate: 0});

		});
		
		function call(){
//			alert("call", document.getElementById("SDate").value);
var sdd = document.getElementById("SDate").value;
var edd = document.getElementById("EDate").value;
console.log("sdd:", sdd );
console.log("edd:", edd );
			var ar1 = sdd.split('-');
			var ar2 = edd.split('-');
			var da1 = new Date(ar1[0], ar1[1], ar1[2]);
			var da2 = new Date(ar2[0], ar2[1], ar2[2]);
			var dif = da2 - da1;
			var cDay = 24 * 60 * 60 * 1000;
			var days = parseInt(dif/cDay);
			alert("days:" + days);
//	if(sdd && edd){
//		document.getElementById('days').value = days;  
//	}
			if(days <= 0){
				alert("여행 종료일이 시작일보다 이전입니다."),location.reload();
			}
		}//end call
	
		function saveClick(){
			// 저장버튼 구현 
		}//end saveClick
		
		// 일 수 만큼 버튼 생성
		function rowAdd(){
			trCnt = $('#myTable tr').length+1;
			if(trCnt < 10){
////////////////////////////////////////////////////////////////////
var innerHtml = '<tr><td style="text-align:center;">';
	innerHtml +='<button class="bttn list-bttn" id="daybtn'+trCnt+'" ';
	innerHtml += 'value="'+trCnt+'"  onclick="javascript: writeDay(value); addPlan(value); day_filter(value);">DAY'+trCnt+'</button></td></tr>';
console.log("innerHtml>>>>>>>>>>>" , innerHtml);
////////////////////////////////////////////////////////////////////
					$('#myTable > tbody:last').append(innerHtml);
			}else{
				alert("최대 9일까지만 생성 가능합니다.");
				return false;
			}
		}//end rowAdd
		 function addPlan(value) {
//		     	console.log(value);
		    	document.getElementById("day_hidden").value = value;
		    	
		    	let ex = document.getElementById('li1');
			    let ex1 = document.getElementById('text');
			    let memo = document.getElementsByClassName('memo');
			   
			    if (ex == null) {
			      	return false;
			    }
			    console.log(ex);
			    console.log(ex.innerText);      // li 태그 안 관광지 이름 받아오기
			    

			    let t = document.getElementById('memo1');
			   
			    console.log(t.value);
		}//end addPlan
		 	
		
		// 일 수 계산해서 day 생성
		var SDate;
		var EDate;
		var curTime = 24*60*60*1000;
		var diff;
		var day;
		$("#SDate").on("propertychange change keyup paste input", 
			function(){ //propertychange change keyup paste input : input 변화 감지하기
 		alert("hello1");
			var currentSDate = $(this).val();
			if(currentSDate == SDate){
				return;
			}
			SDate = new Date(currentSDate);
			
			diff = EDate - SDate;
				day = (parseInt(diff/curTime));
				for(var i=1; i <= day; i++){
				rowAdd();
			}
				
			
		});
		
		$("#EDate").on("propertychange change keyup paste input", 
				function(){
				alert("hello2");
			var currentEDate = $(this).val();
			if(currentEDate == EDate){
				return;
			}
			EDate = new Date(currentEDate);
			
			diff = EDate - SDate;
				day = (parseInt(diff/curTime));
				for(var i =1; i <= day; i++){
				rowAdd();
			}
				call();   // call 호출해야 동작됨.
		});
		
		function day_filter(value) {
			var value, target, item, i;
			
			value = value;
			item = document.getElementsByClassName("li");
			
//	 		console.log(value);
//	 		console.log(item);
			
			for( i = 0; i < item.length; i++ ) {
				target = item[i].value;
				console.log(item[i]);
				console.log(target);
				
				if( target == value ) {
					item[i].style.display = "block";
				} else {
					item[i].style.display = "none";
				}
				
			}
			
			
		}
		
		
		 // 날짜 초기화
	 	function dayDelete() {
	 		 var trCnt = $('#myTable tr').length;
	 	   if(trCnt > 0){
	 	   	$('#myTable > tbody:last > tr ').remove();
	 	   }else{
	 	   	return false;
	 	   }
	 	}
	</script>
</body>
</html>