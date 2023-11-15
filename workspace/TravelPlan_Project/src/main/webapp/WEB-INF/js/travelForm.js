$.datepicker.setDefaults({
	dateFormat : 'yy-mm-dd',
	prevText : '이전 달',
	nextText : '다음 달',
	monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월',
			'11월', '12월' ],
	monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
			'10월', '11월', '12월' ],
	dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
	dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
	dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
	showMonthAfterYear : true,
	yearSuffix : '년'
});

$(function() {

	//$("#regDate1").datepicker({minDate: 0});
	//$("#regDate2").datepicker({minDate: 0});

});

function call() {
	//			alert("call", document.getElementById("SDate").value);
	var sdd = document.getElementById("SDate").value;
	var edd = document.getElementById("EDate").value;
	console.log("sdd:", sdd);
	console.log("edd:", edd);
	var ar1 = sdd.split('-');
	var ar2 = edd.split('-');
	var da1 = new Date(ar1[0], ar1[1], ar1[2]);
	var da2 = new Date(ar2[0], ar2[1], ar2[2]);
	var dif = da2 - da1;
	var cDay = 24 * 60 * 60 * 1000;
	var days = parseInt(dif / cDay);
//	alert("days:" + days);
	//	if(sdd && edd){
	//		document.getElementById('days').value = days;  
	//	}
	if (days <= 0) {
		Swal.fire({	
			icon: 'error',
			title: '여행 종료일이 시작일보다 이전입니다.' }).then(function(){
				$('#EDate').val('');
				$('#SDate').val('');
		});
		return;
	}
}//end call

// -------------------------------------------------- 닫기버튼(작동안함..) -------------------------------------------------- //
function close() {
	event.preventDefault(); 
	if(confirm('그만 만드시겠어요?')) {
		location.href='loginCheck/dropPage';
	}
	else alert('닫기 취소');
}
//------------------------------------------------------------------------------------------------------------ //
// -------------------------------------------------- 저장버튼 -------------------------------------------------- //
function save() {
	var region = getRegion();
	$("#areaCode").val(region);
	// 아이디(타이틀)이 공백이라면 오류 출력
	if($('#travelTitle').val()==''){
		event.preventDefault();
//		alert("여행 제목을 채워주세요 :)");
		Swal.fire({	
			icon: 'error',
			title: '여행 제목을 채워주세요.' }).then(function(){
				$('#travelTitle').focus();
		});
	}
	if($('#SDate').val() == '') {
		event.preventDefault();
//		alert("여행 시작일을 입력해주세요.");
		Swal.fire({	
			icon: 'error',
			title: '여행 시작일을 입력해주세요.' }).then(function(){
				$('#SDate').focus();
		});
	}
	if($('#EDate').val() == '') {
		event.preventDefault();
//		alert("여행  종료일을 입력해주세요.");
		Swal.fire({	
			icon: 'error',
			title: '여행  종료일을 입력해주세요.' }).then(function(){
				$('#EDate').focus();
		});
	}
	else{
		$('#savePlan').submit();
		// 저장버튼 -> 상세일정 데이터 넘어감
		list = [];
		
		/* dayArr : 상세일정 day마다 idx값 주기위해 만든 리스트
			- 순서대로 1일,2일,3일,4일,5일,6일,7일,8일,9일
			- json 배열 만들기 위해 반복문 돌 때, day_num에 해당하는 리스트 요소값 +1
			- +1된 요소값을 idx에 저장
			반복문이 끝나면 배열 초기화
		*/
		var dayArr = [0,0,0,0,0,0,0,0,0];
		
		
		for(var i=0; i<$('.scheduleList').children().length; i++) {
			
			/* 데이터 확인용 -------------------------------------
			console.log($('.currentBtn_hidden').eq(i).val());
			console.log($('.stitle').eq(i).text());
			console.log($('.time_text').eq(i).val());
			console.log($('.saddr1').eq(i).text());
			alert($('.smapx').eq(i).val());
			alert($('.smapy').eq(i).val());
			----------------------------------------------- */
			var day_num = $('.currentBtn_hidden').eq(i).val().substr(6,1); // 며칠자 일정인지 문자열 값에서 숫자만 추출
			var dayToInt = parseInt(day_num); // day 숫자로 변환
			dayArr[dayToInt] += 1; // day에 해당되는 요소 +1
			
			list.push({"day_num":day_num, // 며칠자 일정인지
					   "item":$('.stitle').eq(i).text(), // 장소 이름
					   "time_text":$('.time_text').eq(i).val(), // 적어둔 시간
					   "item_add":$('.saddr1').eq(i).text(), // 장소 주소
					   "mapx":$('.smapx').eq(i).val(), // 좌표
					   "mapy":$('.smapy').eq(i).val(), // 좌표
					   "idx":dayArr[dayToInt]}) // 일정 순서
		}
//		alert(dayArr); // 배열 데이터 확인용
		dayArr = []; // 배열 초기화
		
		
		// 만들어진 json배열 확인
		console.log(JSON.stringify(list));
		
		var travelID = $('#travelID').val();
		$.ajax({
	        // 요청코드
	        type:"get",
	        url:"saveScheduleData",
	        data:{
	        	scheduleList:JSON.stringify(list),
	        	travelID:travelID
	        },

	        // 응답코드
	        success:function(data, satatus, xhr) { 
	        	console.log("성공");
	        },
	        error:function(xhr, status, error) {
	            console.log("에러발생");
	        }
	    });
		
        
	}
	
}
// ---------------------------------------------------------------------------------------------------------- //

// 일 수 만큼 버튼 생성
function rowAdd() {
	trCnt = $('#myTable tr').length + 1;
	if (trCnt < 10) {
		////////////////////////////////////////////////////////////////////
		var innerHtml = '<tr><td style="text-align:center;">';
		innerHtml += '<button class="bttn list-bttn" id="daybtn' + trCnt + '" ';
		innerHtml += 'value="daybtn'
				+ trCnt
//				+ '"  onclick="javascript: writeDay(value); addPlan(value); day_filter(value);">DAY'
				+ '"  onclick="javascript: day_filter(value);">DAY'
				+ trCnt + '</button></td></tr>';
//		console.log("innerHtml>>>>>>>>>>>", innerHtml);
		////////////////////////////////////////////////////////////////////
		$('#myTable > tbody:last').append(innerHtml);
	} else {
		Swal.fire({	
			icon: 'error',
			title: '최대 9일까지 생성 가능합니다.' }).then(function(){
				return false;
		});
	}
}//end rowAdd


// 일 수 계산해서 day 생성
var SDate;
var EDate;
var curTime = 24 * 60 * 60 * 1000;
var diff;
var day;

$(document).ready(function() {
	var currentSDate = $("#SDate").val();
	var currentEDate = $("#EDate").val();
	
	SDate = new Date(currentSDate);
	EDate = new Date(currentEDate);
	
	diff = EDate - SDate;
	day = (parseInt(diff / curTime))+1;
	for (var i = 1; i <= day; i++) {
		rowAdd();
	}
	call();
});

$("#SDate").on("change", function() {
//  		alert("hello1");
	$("#tbody").children().remove();
//	var currentSDate = $(this).val();
//	if (currentSDate == SDate) {
//		return;
//	}
//	SDate = new Date(currentSDate);
//
//	diff = EDate - SDate;
//	day = (parseInt(diff / curTime))+1;
//	for (var i = 1; i <= day; i++) {
//		rowAdd();
//	}
	var currentSDate = $("#SDate").val();
	var currentEDate = $("#EDate").val();
	
	SDate = new Date(currentSDate);
	EDate = new Date(currentEDate);
	
	diff = EDate - SDate;
	day = (parseInt(diff / curTime))+1;
	for (var i = 1; i <= day; i++) {
		rowAdd();
	}
	call();
});

$("#EDate").on("change", function() {
	// 				alert("hello2");
	$("#tbody").children().remove();
//	var currentEDate = $(this).val();
//	if (currentEDate == EDate) {
//		return;
//	}
//	EDate = new Date(currentEDate);
//
//	diff = EDate - SDate;
//	day = (parseInt(diff / curTime))+1;
//	for (var i = 1; i <= day; i++) {
//		rowAdd();
//	}
	var currentSDate = $("#SDate").val();
	var currentEDate = $("#EDate").val();
	
	SDate = new Date(currentSDate);
	EDate = new Date(currentEDate);
	
	diff = EDate - SDate;
	day = (parseInt(diff / curTime))+1;
	for (var i = 1; i <= day; i++) {
		rowAdd();
	}
	call(); // call 호출해야 동작됨.
});

/*///////////////// schedule.js에서 구현 ///////////////////
function day_filter(value) { 
	var value, target, item, i;

	value = value;
	item = document.getElementsByClassName("li");

	//	 		console.log(value);
	//	 		console.log(item);

	for (i = 0; i < item.length; i++) {
		target = item[i].value;
		console.log(item[i]);
		console.log(target);

		if (target == value) {
			item[i].style.display = "block";
		} else {
			item[i].style.display = "none";
		}

	}

}
///////////////////////////////////////////////////////*/

// 날짜 초기화
function dayDelete() {
	var trCnt = $('#myTable tr').length;
	if (trCnt > 0) {
		$('#myTable > tbody:last > tr ').remove();
	} else {
		return false;
	}
}

// 숙박 버튼
function hotelBtnclick(curPage) {
	var region = getRegion();
//	var query = window.location.search;
//	var param = new URLSearchParams(query);
//	var region = param.get('region'); // 파라미터값
	
	$.ajax({
        // 요청코드
        type:"get", // searchBtn으로 doget방식으로 url넘겨줌
        url:"searchBtn", // 버튼 눌렀을 때 이동할 곳 정하기
        data:{ // searchBtn 으로 넘겨줄 값
        	region:region,
        	contentTypeid:32,
        	curPage:curPage
        },

        // 응답코드
        success:function(data, satatus, xhr) { 
        	
        	var xxx = page_link_hotel(data);
        	$("#pagination_page").html(xxx);
        	displayPlaces_btn(data.list)
        },
        error:function(xhr, status, error) {
            console.log("에러발생");
        }
    });
}

// 음식 버튼
function foodBtnclick(curPage) {
	var region = getRegion();
//	var query = window.location.search;
//	var param = new URLSearchParams(query);
//	var region = param.get('region'); // 파라미터값
	
	$.ajax({
		// 요청코드
		type:"get", // hotelBtn으로 doget방식으로 url넘겨줌
		url:"searchBtn", // 버튼 눌렀을 때 이동할 곳 정하기
		data:{ // hotelBtn 으로 넘겨줄 값
			region:region,
			contentTypeid:39,
			curPage:curPage
		},
		
		// 응답코드
		success:function(data, satatus, xhr) { 
			
			var xxx = page_link_food(data);
			$("#pagination_page").html(xxx);
			displayPlaces_btn(data.list)
		},
		error:function(xhr, status, error) {
			console.log("에러발생");
		}
	});
}

// 관광 버튼
function sightseeingBtnclick(curPage) {
	var region = getRegion();
//	var query = window.location.search;
//	var param = new URLSearchParams(query);
//	var region = param.get('region'); // 파라미터값
	
	$.ajax({
		// 요청코드
		type:"get", // hotelBtn으로 doget방식으로 url넘겨줌
		url:"searchBtn2", // 버튼 눌렀을 때 이동할 곳 정하기
		data:{ // hotelBtn 으로 넘겨줄 값
			region:region,
			contentTypeid1:12,
			contentTypeid2:14,
			contentTypeid3:15,
			contentTypeid4:28,
			contentTypeid5:38,
			curPage:curPage
		},
		
		// 응답코드
		success:function(data, satatus, xhr) {
			
			var xxx = page_link_ss(data); // 받아온 data들을 메서드로 따로 분리
			$("#pagination_page").html(xxx);
			
			////////////////////////////////
			displayPlaces_btn(data.list)
		},
		error:function(xhr, status, error) {
			console.log("에러발생");
		}
	});
} // end sightseeingBtnclick() 

//------------------------------------ page_link ------------------------------------//
// 숙박용
function page_link_hotel(data){
//	console.log(data);
//	console.log(region);
//	console.log(contentTypeid);
//	
	var list = data.list;
	var perPage = data.perPage; // 페이지당 몇개의 데이터 보여줄지?
	var totalCount = data.totalCount; // 전체 데이터 수
	var curPage = data.curPage; // 현재 페이지 번호
	var totalNum = parseInt(totalCount / perPage); // 페이지 개수
	
	if(totalCount % perPage != 0) {
		totalNum += 1;
	}
//	console.log("list>>", list);
//	console.log("perPage>>",perPage);
//	console.log("totalCount>>",totalCount);
//	console.log("curPage>>",curPage);
//	console.log("totalNum>>",totalNum);

	var pageHtml ="";
	// 이전 페이지로 이동
	if(curPage != 1) {
		pageHtml += "<li class='page-item'>" +
					"	<a class='page-link' href='#' onclick='hotelBtnclick("+(curPage-1)+")'>" +
					"        <span aria-hidden='true'>&laquo;</span>" +
					"    </a>" +
					"</li>"
	} else {
		pageHtml += "<li class='page-item'>" +
		"	<a class='page-link' href='#' onclick='hotelBtnclick("+curPage+")'>" +
		"        <span aria-hidden='true'>&laquo;</span>" +
		"    </a>" +
		"</li>"
	}
	
	// 페이징
	for(var i=1; i <= totalNum; i++){
		if(i < curPage+5 && i >= curPage) { // 아니면 5개씩 나눠서 출력
			if( curPage == i){ 
	//			pageHtml += "<span>" + i + "</span>";
				pageHtml += "<li class='page-item'><span class='page-link active'>" + i + "</span></li>";
			}else{
	//			pageHtml += "<a href='#' onclick='sightseeingBtnclick("+i+")'>"+i+"</a>";
				pageHtml += "<li class='page-item'><a class='page-link' href='#' onclick='hotelBtnclick("+i+")'>"+i+"</a></li>";
			}
		}
	}
	
	// 다음 페이지로 이동
	if(curPage < totalNum-1) {
		pageHtml += "<li class='page-item'>" +
					"	<a class='page-link' href='#' onclick='hotelBtnclick("+(curPage+1)+")'>" +
					"        <span aria-hidden='true'>&raquo;</span>" +
					"    </a>" +
					"</li>"
	} else {
		pageHtml += "<li class='page-item'>" +
		"	<a class='page-link' href='#' onclick='hotelBtnclick("+curPage+")'>" +
		"        <span aria-hidden='true'>&raquo;</span>" +
		"    </a>" +
		"</li>"
	}
	return pageHtml;
}
// 음식용
function page_link_food(data){
//	console.log(data);
//	console.log(region);
//	console.log(contentTypeid);
//	
	var list = data.list;
	var perPage = data.perPage; // 페이지당 몇개의 데이터 보여줄지?
	var totalCount = data.totalCount; // 전체 데이터 수
	var curPage = data.curPage; // 현재 페이지 번호
	var totalNum = parseInt(totalCount / perPage); // 페이지 개수
	
	if(totalCount % perPage != 0) {
		totalNum += 1;
	}
//	console.log("list>>", list);
//	console.log("perPage>>",perPage);
//	console.log("totalCount>>",totalCount);
//	console.log("curPage>>",curPage);
//	console.log("totalNum>>",totalNum);
		
	var pageHtml ="";
	// 이전 페이지로 이동
	if(curPage != 1) {
		pageHtml += "<li class='page-item'>" +
					"	<a class='page-link' href='#' onclick='foodBtnclick("+(curPage-1)+")'>" +
					"        <span aria-hidden='true'>&laquo;</span>" +
					"    </a>" +
					"</li>"
	} else {
		pageHtml += "<li class='page-item'>" +
		"	<a class='page-link' href='#' onclick='foodBtnclick("+curPage+")'>" +
		"        <span aria-hidden='true'>&laquo;</span>" +
		"    </a>" +
		"</li>"
	}
	
	// 페이징
	for(var i=1; i <= totalNum; i++){
		if(i < curPage+5 && i >= curPage) { // 아니면 5개씩 나눠서 출력
			if( curPage == i){ 
	//			pageHtml += "<span>" + i + "</span>";
				pageHtml += "<li class='page-item'><span class='page-link active'>" + i + "</span></li>";
			}else{
	//			pageHtml += "<a href='#' onclick='sightseeingBtnclick("+i+")'>"+i+"</a>";
				pageHtml += "<li class='page-item'><a class='page-link' href='#' onclick='foodBtnclick("+i+")'>"+i+"</a></li>";
			}
		}
	}
	
	// 다음 페이지로 이동
	if(curPage < totalNum-1) {
		pageHtml += "<li class='page-item'>" +
					"	<a class='page-link' href='#' onclick='foodBtnclick("+(curPage+1)+")'>" +
					"        <span aria-hidden='true'>&raquo;</span>" +
					"    </a>" +
					"</li>"
	} else {
		pageHtml += "<li class='page-item'>" +
		"	<a class='page-link' href='#' onclick='foodBtnclick("+curPage+")'>" +
		"        <span aria-hidden='true'>&raquo;</span>" +
		"    </a>" +
		"</li>"
	}
	return pageHtml;
}
// 관광용
function page_link_ss(data){
//	console.log(data);
//	console.log(region);
//	console.log(contentTypeid);
//	
	var list = data.list;
	var perPage = data.perPage; // 페이지당 몇개의 데이터 보여줄지?
	var totalCount = data.totalCount; // 전체 데이터 수
	var curPage = data.curPage; // 현재 페이지 번호
	var totalNum = parseInt(totalCount / perPage); // 페이지 개수
	
	if(totalCount % perPage != 0) {
		totalNum += 1;
	}
//	console.log("list>>", list);
//	console.log("perPage>>",perPage);
//	console.log("totalCount>>",totalCount);
//	console.log("curPage>>",curPage);
//	console.log("totalNum>>",totalNum);
	
//		<li class="page-item">
//		  <a class="page-link" href="#" aria-label="Previous">
//		      <span aria-hidden="true">&laquo;</span>
//		  </a>
//		</li>
//		
//		<li class="page-item"><a class="page-link" href="#">1</a></li>
//		<li class="page-item"><a class="page-link" href="#">2</a></li>
//		<li class="page-item"><a class="page-link" href="#">3</a></li>
//		
//		<li class="page-item">
//		  <a class="page-link" href="#" aria-label="Next">
//		      <span aria-hidden="true">&raquo;</span>
//		  </a>
//		</li>
	
	var pageHtml ="";
	// 이전 페이지로 이동
	if(curPage != 1) {
		pageHtml += "<li class='page-item'>" +
					"	<a class='page-link' href='#' onclick='sightseeingBtnclick("+(curPage-1)+")'>" +
					"        <span aria-hidden='true'>&laquo;</span>" +
					"    </a>" +
					"</li>"
	} else {
		pageHtml += "<li class='page-item'>" +
		"	<a class='page-link' href='#' onclick='sightseeingBtnclick("+curPage+")'>" +
		"        <span aria-hidden='true'>&laquo;</span>" +
		"    </a>" +
		"</li>"
	}
	
	// 페이징
	for(var i=1; i <= totalNum; i++){
		if(i < curPage+5 && i >= curPage) { // 아니면 5개씩 나눠서 출력
			if( curPage == i){ 
	//			pageHtml += "<span>" + i + "</span>";
				pageHtml += "<li class='page-item'><span class='page-link active'>" + i + "</span></li>";
			}else{
	//			pageHtml += "<a href='#' onclick='sightseeingBtnclick("+i+")'>"+i+"</a>";
				pageHtml += "<li class='page-item'><a class='page-link' href='#' onclick='sightseeingBtnclick("+i+")'>"+i+"</a></li>";
			}
		}
	}
	
	// 다음 페이지로 이동
	if(curPage < totalNum-1) {
		pageHtml += "<li class='page-item'>" +
					"	<a class='page-link' href='#' onclick='sightseeingBtnclick("+(curPage+1)+")'>" +
					"        <span aria-hidden='true'>&raquo;</span>" +
					"    </a>" +
					"</li>"
	} else {
		pageHtml += "<li class='page-item'>" +
		"	<a class='page-link' href='#' onclick='sightseeingBtnclick("+curPage+")'>" +
		"        <span aria-hidden='true'>&raquo;</span>" +
		"    </a>" +
		"</li>"
	}
	return pageHtml;
}

//-------------------------------------------------------------------------//

//검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces_btn(value, pagination) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<value.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(value[i].mapy, value[i].mapx),
            marker = addMarker(placePosition, i), 
            itemEl = getSearchList(i, value[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, value[i].title);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getSearchList(index, value) {
	var el = document.createElement('div'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '  <div class="d-flex w-100 align-items-center justify-content-between">' + 
                '    <strong class="mb-1" id="place_name' + (index+1) + '">' + value.title + '</strong>' +
                '  </div>' +
        		'    <div class="col-10 mb-1 small" id="address_name' + (index+1) + '">' + value.addr1 + '</div>' +
//                '  <div class="tel col-10 mb-1 small">' + places.phone  + '</div>' +
                '<button class="addBtn btn btn-primary" data-idx="' + (index+1) + '" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">추가</button></div>';

    el.innerHTML = itemStr;
    el.className = 'item list-group-item py-3 lh-sm';

    return el;
}

// input에 region값 저장하기 위함
function getRegion() {
	var query = window.location.search;
	var param = new URLSearchParams(query);
	var region = param.get('region');
	
	return region;
}
