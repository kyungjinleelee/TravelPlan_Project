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

function filter() {
	
	var value, name, item, i;
	
	value = document.getElementById("value").value.toUpperCase();
	item = document.getElementsByClassName("item");
	
	for( i = 0; i < item.length; i++ ) {
		name = item[i].getElementsByClassName("name");
		if( name[0].innerHTML.toUpperCase().indexOf(value) > -1 ) {
			item[i].style.display = "block";
		} else {
			item[i].style.display = "none";
		}
	}
}