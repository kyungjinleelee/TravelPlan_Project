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
	alert("days:" + days);
	//	if(sdd && edd){
	//		document.getElementById('days').value = days;  
	//	}
	if (days <= 0) {
		alert("여행 종료일이 시작일보다 이전입니다."), location.reload();
	}
}//end call

function saveClick() {
	// 저장버튼 구현 
}//end saveClick

// 일 수 만큼 버튼 생성
function rowAdd() {
	trCnt = $('#myTable tr').length + 1;
	if (trCnt < 10) {
		////////////////////////////////////////////////////////////////////
		var innerHtml = '<tr><td style="text-align:center;">';
		innerHtml += '<button class="bttn list-bttn" id="daybtn' + trCnt + '" ';
		innerHtml += 'value="'
				+ trCnt
				+ '"  onclick="javascript: writeDay(value); addPlan(value); day_filter(value);">DAY'
				+ trCnt + '</button></td></tr>';
		console.log("innerHtml>>>>>>>>>>>", innerHtml);
		////////////////////////////////////////////////////////////////////
		$('#myTable > tbody:last').append(innerHtml);
	} else {
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
	console.log(ex.innerText); // li 태그 안 관광지 이름 받아오기

	let t = document.getElementById('memo1');

	console.log(t.value);
}//end addPlan

// 일 수 계산해서 day 생성
var SDate;
var EDate;
var curTime = 24 * 60 * 60 * 1000;
var diff;
var day;
$("#SDate").on("change", function() {
//  		alert("hello1");
	var currentSDate = $(this).val();
	if (currentSDate == SDate) {
		return;
	}
	SDate = new Date(currentSDate);

	diff = EDate - SDate;
	day = (parseInt(diff / curTime));
	for (var i = 1; i <= day; i++) {
		rowAdd();
	}

});

$("#EDate").on("change", function() {
	// 				alert("hello2");
	var currentEDate = $(this).val();
	if (currentEDate == EDate) {
		return;
	}
	EDate = new Date(currentEDate);

	diff = EDate - SDate;
	day = (parseInt(diff / curTime))+1;
	for (var i = 1; i <= day; i++) {
		rowAdd();
	}
	call(); // call 호출해야 동작됨.
});

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

// 날짜 초기화
function dayDelete() {
	var trCnt = $('#myTable tr').length;
	if (trCnt > 0) {
		$('#myTable > tbody:last > tr ').remove();
	} else {
		return false;
	}
}