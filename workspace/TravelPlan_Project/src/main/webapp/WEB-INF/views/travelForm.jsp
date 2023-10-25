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
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String region = request.getParameter("region");
%>

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
			$("#regDate1".datepicker({minDate: 0}));
			$("#regDate1".datepicker({minDate: 0}));
		});
		
		function call(){
			var sdd = document.getElementById("regDate1").value;
			var edd = document.getElementById("regDate2").value;
			var ar1 = sdd.split('-');
			var ar2 = edd.split('-');
			var da1 = new Date(ar1[0], ar1[1], ar1[2]);
			var da2 = new Date(ar2[0], ar2[1], ar2[2]);
			var dif = da2 - da1;
			var cDay = 24 * 60 * 60 * 1000;
			var days = parseInt(dif/cDay);
		
		if(sdd && edd){
			document.getElementById('days').value = days;
		}
		if(days <= 0){
			alert("여행 종료일이 시작일보다 이전입니다."),location.reload();
			}
		}
	
		function saveClick(){
			
		}
	</script>
</body>
</html>