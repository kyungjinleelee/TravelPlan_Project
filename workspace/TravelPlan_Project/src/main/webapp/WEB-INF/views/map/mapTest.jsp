<%@page import="com.dto.ApiDTO2"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>일정만들기</title>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${client_id}&libraries=services"></script>
</head>
<body>
<div id="map" style="width:100%;height:400px;"></div> <!-- 지도 DOM 요소 지정 -->


<script>
// JSON 받기
var str;
$.ajax({
	url:'api', // 요청 url
	type:"get", // get/post
	dataType:"json", // 응답받을 데이터 타임
	success:function(data,status,xhr){ // 성공시 
		str = JSON.stringify(data); // JSON을 String으로 변경하는 함수 (list에 저장?)
		console.log("str: "+str);
		
		// 마커 - 지도생성
		var map = new naver.maps.Map('map', {
		    center: new naver.maps.LatLng(37.3595704, 127.105399),
		    zoom: 10
		});
		
		$.each(data, function(idx,ele){
			console.log(ele);
			console.log(ele.mapx+" "+ele.mapy);
			
			// 좌표에 마커 등록
			var marker = new naver.maps.Marker({
			    position: new naver.maps.LatLng(ele.mapy, ele.mapx),
			    map: map
			});
			
		});
		
	},
	error:function(xhr, status, error){ // 에러 발생시
	}
});

// 지도 옵션 설정 : 지도 생성시 지도 속성 초기화, 객체 리터럴로 만듦 
var mapOptions = {
    center: new naver.maps.LatLng(37.541, 126.986),
    zoom: 10
};

// 지도 생성
//var map = new naver.maps.Map('map', mapOptions);

</script>
</body>
</html>