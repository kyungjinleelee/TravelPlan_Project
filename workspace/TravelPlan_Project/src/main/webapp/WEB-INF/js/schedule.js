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
        		getScheduleList(title, addr1);
        	});
        	
        },
        error:function(xhr, status, error) {
            console.log("에러발생");
        }
    }); 

});

// 리스트 추가
// 수정 : 버튼값 보내주기 위해 input hidden 추가 / day 버튼별 리스트 출력하기 위해 클래스 수정(scList추가) + dataset추가
function getScheduleList(title, addr1) {
	var inHtml ='<div class="scList list-group-item list-group-item-action py-3 lh-sm" aria-current="true" data-value="'+currentBtn.id+'">'+
					'<input type="hidden" class="currentBtn_hidden" value="'+currentBtn.id+'">' +
					'<div class="d-flex w-100 align-items-center justify-content-between">' +
					'  <strong class="sTitle mb-1">'+title+'</strong>' + 
					'  <input type="text" class="time_text small" style="width: 45px;" placeholder="12:00">' +
					'</div>' +
					'<div class="saddr1 col-10 mb-1 small">'+addr1+'</div>'+
					'<button class="removeBtn btn btn-danger" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">삭제</button>' +
				'</div>';

	$('.scheduleList').append(inHtml);
}

// 삭제버튼
$(document).on("click", ".removeBtn", function(){
	this.parentNode.remove(); // 해당 버튼의 부모 찾아서 삭제
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
