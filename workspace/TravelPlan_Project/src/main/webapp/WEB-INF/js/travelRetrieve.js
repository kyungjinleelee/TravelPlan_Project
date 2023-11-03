// 일 수 만큼 버튼 생성


function createButtons(dayNum) {
    for (var trCnt = 1; trCnt <= dayNum; trCnt++) {
        if (trCnt < 10) {
            var innerHtml = '<tr><td style="text-align:center;">';
            innerHtml += '<button class="bttn list-bttn" id="daybtn' + trCnt + '" ';
            innerHtml += 'value="daybtn' + trCnt + '"  onclick="javascript: day_filter(value);">DAY' + trCnt + '</button></td></tr>';
            $('#myTable > tbody:last').append(innerHtml);
        } else {
            alert("최대 9일까지만 생성 가능합니다.");
            return false;
        }
    }
}


// day에 따른 item 출력
//function createDivs() {
//    var planList = <%= new Gson().toJson(planList) %>; // PlanDTO 목록을 JavaScript 배열로 변환
//    var divContainer = document.getElementById("divContainer"); // 출력할 div 컨테이너 엘리먼트
//
//    // 각 day_num에 해당하는 item 출력
//    for (var i = 0; i < planList.length; i++) {
//        var dayNum = planList[i].day_num;
//        var item = planList[i].item;
//
//        // day_num을 사용하여 새로운 div 컨테이너를 만들거나 이미 있는 컨테이너를 선택
//        var dayDivContainer = document.getElementById("day" + dayNum + "Container");
//
//        if (!dayDivContainer) {
//            dayDivContainer = document.createElement("div");
//            dayDivContainer.id = "day" + dayNum + "Container";
//            divContainer.appendChild(dayDivContainer);
//        }
//
//        // 새로운 div 엘리먼트 생성
//        var div = document.createElement("div");
//        div.textContent = item; // item 값을 div에 출력
//        dayDivContainer.appendChild(div); // div를 해당 day_num 컨테이너에 추가
//    }
//}

// 페이지 로드 시 createDivs 함수 실행
window.onload = createDivs;







