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