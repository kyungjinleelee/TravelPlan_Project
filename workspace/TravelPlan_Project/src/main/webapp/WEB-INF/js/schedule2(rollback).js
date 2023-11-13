//------------------ 세부일정 마커 start ------------------//
// 지도에 올라간 마커를 저장하는 리스트 생성
var markers2 = [];

//마커 이미지의 이미지 주소입니다
var imageSrc = "https://cdn-icons-png.flaticon.com/512/5860/5860579.png"; 
//------------------- 세부일정 마커 end -------------------//

//클릭했을 때 DAY 버튼 활성화
var currentBtn; // 활성화된 버튼 담을 변수
$(document).on("click", ".list-bttn", function(){
	if(currentBtn) { // 활성화된 버튼 유무 확인
		currentBtn.classList.remove('btn-active'); // 활성화된 버튼이 있다면 비활성화
	}
	this.classList.add('btn-active'); // 현재 버튼 활성화
//	console.log("현재 버튼 id : "+this.id);
	currentBtn = this; // 활성화된 버튼 변수에 담기
});

// 추가버튼
$(document).on("click", ".addBtn", function(){
	
	if(!currentBtn) {
		alert("여행 일정을 선택해주세요.");
		return;
	}
	// 해당 버튼의 data-idx값 불러오기
//	console.log(this.dataset.idx);
	var idx = this.dataset.idx
	
	// index에 맞는 장소 이름, 주소 불러오기
	var title = $("#place_name"+idx).text();
	var addr1 = $("#address_name"+idx).text();
	var addr2 = $("#road_address_name"+idx).text();
//	console.log('click클릭이벤트 '+title+addr1+addr2);
//		console.log($(this).prev().prev().text());
	
	$.ajax({
        // 요청코드
        type:"get", // scheduleList으로 doget방식으로 url넘겨줌
        url:"scheduleList", // 버튼 눌렀을 때 이동할 곳 정하기
        data:{ // scheduleList 으로 넘겨줄 값
        	title:title,
        	addr1:addr1
        },

        // 응답코드
        success:function(data, satatus, xhr) { 
        	$.each(data, function(index, value) {
//        		console.log(index);
//        		console.log(value.title); 
//        		console.log(value.addr1); 
//        		console.log(value.addr2);
        		getScheduleList(title, addr1, value.mapx, value.mapy);
        		setScheduleMarker(title, value.mapx, value.mapy);
        	});
        	
        },
        error:function(xhr, status, error) {
            console.log("에러발생");
        }
    }); 
	
});

//------------------------ 세부일정 마커 start ------------------------//
// 세부 일정 마커 표시하는 함수
function setScheduleMarker(stitle, smapx, smapy) { // setScheduleMarker start
	var mapx = smapx;
	var mapy = smapy;
	var title = stitle
	
	// 마커 생성
	// day 버튼마다 이미지 설정
	if(currentBtn.value == 'daybtn1') {
		imageSrc = "/app/images/marker1.png";
	} else if(currentBtn.value == 'daybtn2') {
		imageSrc = "/app/images/marker2.png";
	} else if(currentBtn.value == 'daybtn3') {
		imageSrc = "/app/images/marker3.png";
	} else if(currentBtn.value == 'daybtn4') {
		imageSrc = "/app/images/marker4.png";
	} else if(currentBtn.value == 'daybtn5') {
		imageSrc = "/app/images/marker5.png";
	} else if(currentBtn.value == 'daybtn6') {
		imageSrc = "/app/images/marker6.png";
	} else if(currentBtn.value == 'daybtn7') {
		imageSrc = "/app/images/marker7.png";
	} else if(currentBtn.value == 'daybtn8') {
		imageSrc = "/app/images/marker8.png";
	} else if(currentBtn.value == 'daybtn9') {
		imageSrc = "/app/images/marker9.png";
	}
	// 마커 이미지의 이미지 크기 입니다
	var imageSize = new kakao.maps.Size(35, 48); 
	
	// 마커 이미지를 생성합니다    

	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	var markerPosition = new kakao.maps.LatLng(mapy, mapx);
	// 마커를 생성합니다
	var marker2 = new kakao.maps.Marker({
		map: map, // 마커를 표시할 지도
		position: markerPosition, // 마커를 표시할 위치
		title : title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		image : markerImage // 마커 이미지 
	});
	/////////////////여기서부터 인포윈도우
	// 마커가 지도 위에 표시되도록 설정합니다
	marker2.setMap(map);
	
	var iwPosition = new kakao.maps.LatLng(mapy, mapx); // 인포윈도우 위치
	var iwContent = '<div style="padding:5px;">' + title + ' <br>' +
    '<a href="https://map.kakao.com/link/to/' + title + ',' + mapy + ',' + mapx + '" style="color:blue" target="_blank">길찾기</a></div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

	// 인포윈도우를 생성합니다
	var infowindow2 = new kakao.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	console.log(infowindow2);
	  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow2.open(map, marker2); 

	/////////////////////인포윈도우 끝
	// 생성된 마커를 배열(markers)에 추가합니다.
	markers.push(marker2);
	
	// 지도에 표시되고 있는 마커를 제거합니다
//    removeMarker2();
} // setScheduleMarker end

//지도 위에 표시되고 있는 마커를 모두 제거합니다 (마커 제거함수 일단 만들어놈 ..)
function removeMarker2() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers2[i].setMap(null);
    }   
    markers2 = [];
}
//------------------------- 세부일정 마커 end -------------------------//

// 리스트 추가
// 수정 : 버튼값 보내주기 위해 input hidden 추가 / day 버튼별 리스트 출력하기 위해 클래스 수정(scList추가) + dataset추가
// 수정(2023.11.07) jqueryUI의 리스트 순서 변경 함수 사용하기 위해 div를 li로 변경
function getScheduleList(title, addr1, mapx, mapy) {
	var inHtml ='<li class="scList list-group-item list-group-item-action py-3 lh-sm" aria-current="true" data-value="'+currentBtn.id+'">'+
		//	'<div class="scList list-group-item list-group-item-action py-3 lh-sm" aria-current="true" data-value="'+currentBtn.id+'">'+
				'<input type="hidden" class="currentBtn_hidden" value="'+currentBtn.id+'">' +
				'<div class="d-flex w-100 align-items-center justify-content-between">' +
				'  <strong class="sTitle mb-1">'+title;
	if(contentTypeid == 32) { // 숙박
	inHtml += '&nbsp<i class="fa-solid fa-hotel" style="color: mediumslateblue;"></i>';
	}
	else if(contentTypeid == 39) { // 음식
	inHtml += '&nbsp<i class="fa-solid fa-utensils" style="color: lightcoral;"></i>';
	}
	else if(contentTypeid == 12 || contentTypeid == 14 || contentTypeid == 15 || contentTypeid == 28 || contentTypeid == 38) {
	inHtml += '&nbsp<i class="fa-solid fa-mountain-sun" style="color: darkseagreen;"></i>';
	}
	
	inHtml +=		'</strong>' +
				'</div>' +
				'<div class="saddr1 col-10 mb-1 small">'+addr1+'</div>'+
				'<input type="hidden" class="smapx" value="'+mapx+'">' +
				'<input type="hidden" class="smapy" value="'+mapy+'">' +
				'<div class="d-flex w-100 align-items-center justify-content-between">' +
				'  <div>' +
				'    <label>시간&nbsp:&nbsp</label>' +
				'    <input type="time" class="time_text small" style="width: 110px;" placeholder="12:00">' +
				'  </div>' +
				'  <button class="removeBtn btn btn-danger" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">삭제</button>' +
				'</div>' +
		//	'</div>' +
			'</li>';
	$('.scheduleList').append(inHtml);
}

// 삭제버튼
$(document).on("click", ".removeBtn", function(){
	this.parentNode.parentNode.remove(); // 해당 버튼의 부모 찾아서 삭제
	
//------------------------ 세부일정 마커 start ------------------------//
	// 너무 하드코딩인 느낌..
//	this.parentNode.querySelector('.sTitle').textContent // 해당 버튼에 해당하는 부모 찾아 -> 부모 하위 태그중 클래스 값이 sTitle인 첫번째 요소 찾음(이게 자식일테니) -> 그 값의 장소 이름을 받아옴
	for(var i = 0; i < markers2.length; i++) {
		if (markers2[i].Gb == this.parentNode.querySelector('.sTitle').textContent) { // marker2[i].Gb : 마커에 저장된 장소 이름값
			markers2[i].setMap(null); // 장소 이름이 동일하면 마커 가리기
			markers2.splice(i,1); // 마커 리스트에서 제거
			return;
		}
	}
//------------------------- 세부일정 마커 end -------------------------//
});

// day에 맞는 상세 리스트 출력
function day_filter(value) {
	var value, target, item, i;

	value = value;
	item = document.getElementsByClassName("scList");

//	console.log('value: '+value+' item :'+item.length);
//	console.log('item.value : '+item[0].dataset.value);

	for (i = 0; i < item.length; i++) {
		target = item[i].dataset.value;
//		console.log(item[i]);
//		console.log(target);

		if (target == value) {
			item[i].style.display = "block";
		} else {
			item[i].style.display = "none";
		}

	}
}

// 세부 일정 드래그로 순서 변경하기 - jQuery UI 라이브러리 사용
$(function() {
	$("#scheduleList_sortable").sortable(); // 해당 태그 내부에 포함된 태그를 사용해 드래그 가능한 리스트를 만듦
	$("#scheduleList_sortable").disableSelection(); // 아이템 내부 글자를 드래그해서 선택하지 못하도록 방지
});

