<!-- 부트스트랩 버전 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<!-- 참조  css, js 코드 -->
	<link rel="stylesheet" href="<c:url value='/css/main3.css'/>">
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous">
</script>
<script>
	function service(){ // 모달창에서 로그인 되면 넘어가게
		let signIn = "${loginInfo}";
		if(signIn == ""){
			alert("로그인 후 이용하실 수 있는 페이지입니다.");
			location.href="loginForm";
		}else{
			openBtn();
		}
	}

	
	function openBtn(region) {
		document.getElementById('modalContainer').classList.remove('hidden');
		$("#region").val(region);
		
	}
	function closeBtn() {
		event.preventDefault();
		document.getElementById('modalContainer').classList.add('hidden');	
		console.log("닫기 버튼 누름");
	}
</script>
<style>
/* 모달  */
      #modalOpenButton, #modalCloseButton {
		  cursor: pointer;
		}
		
		#modalContainer {
		  width: 100%;
		  height: 100%;
		  position: fixed;
		  top: 0;
		  left: 0;
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  background: rgba(0, 0, 0, 0.5);
		}
		
		#modalContent {
		  position: absolute;
		  background-color: #ffffff;
		  width: 500px;
		  height: 300px;
		  padding: 15px;
		}
		
		#modalContainer.hidden {
		  display: none;
		}
		
 		/* 여행정보창  */
		.title {
			width: 70px;
		    height: 50px;
		    top:20px;
		    left:27px;
		    font-family: 'SUIT-Bold';
		}
		#travelTitle{
			width: 250px;
		    height: 34px;
		    left:110px;
		    top:10px;
		    border-top: none;
		    border-left: none;
		    border-right: none;
		    border-bottom : 1px solid black;
		    font-family: 'SUIT-Medium';
		    padding-left: 14px;
		}
		#SDate{
			width: 110px;
		    height: 35px;
		    left:500px;
		    top:10px;
		    border-top: none;
		    border-left: none;
		    border-right: none;
		    border-bottom : 1px solid black;
		    text-align: center;
	    }
		#EDate{
			width: 110px;
		    height: 35px;
		    left:786px;
		    top:10px;
		    border-top: none;
		    border-left: none;
		    border-right: none;
		    border-bottom : 1px solid black;
		    text-align: center;
	    }
	    .calendar{
			right:1100px;
			top: 0px
		}
		.calendar_sdate{
			left:400px;
			top:20px;
			font-family: 'SUIT-Bold';
		}
		.calendar_edate{
			left:682px;
			top:20px;
			font-family: 'SUIT-Bold';
		}
		#btnList {
			float: right;
		}
		/* 게시판 인기글 */
* {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }
    a {
      text-decoration: none;
      color: black;
    }
    input {
      border: none;
      outline: none;
    }
    .board-container {
      width: 60%;
      height: 500px;
      margin: 0 auto;
      font-family: 'SUIT-Medium';
      /* border: 1px solid black; */
    }
    
    table {
      border-collapse: collapse;
      width: 100%;
      border-top: 2px solid rgb(39, 39, 39);
    }
    tr:nth-child(even) {
      background-color: #f0f0f070;
    }
    th,
    td {
      width:300px;
      text-align: center;
      padding: 10px 12px;
      border-bottom: 1px solid #ddd;
    }
    td {
      color: rgb(53, 53, 53);
    }
    .no      { width:150px;}
    .title   { width:50%;  }
    td.title   { text-align: left;  }
    td.writer  { text-align: left;  }
    td.viewcnt { text-align: right; }
    td.title:hover {
      text-decoration: underline;
    }
    
    .btn-write {
      background-color: rgb(236, 236, 236); /* Blue background */
      border: none; /* Remove borders */
      color: black; /* White text */
      padding: 6px 12px; /* Some padding */
      font-size: 16px; /* Set a font size */
      cursor: pointer; /* Mouse pointer on hover */
      border-radius: 5px;
      margin-left: 30px;
    }
    .btn-write:hover {
      text-decoration: underline;
    }
  /* 게시판 인기글 끝 */
</style>
<title>여행을 담다, 여담</title>

</head>
<body>
<jsp:include page="common/top.jsp" flush="true" /><br>



<!-- 대문 -->
 <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
        aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
        aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
        aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img
          src="https://images.unsplash.com/photo-1673179559805-8dfbf64e10d4?auto=format&fit=crop&q=80&w=1674&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
          class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
        <img
          src="https://images.unsplash.com/photo-1584345110951-7c0e3ca09b82?auto=format&fit=crop&q=80&w=2070&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
          class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
        <img
          src="https://i2.wp.com/www.agoda.com/wp-content/uploads/2021/02/Donggung-Palace-and-Wolji-Pond-Gyeongju-si-attractions-South-Korea.jpg?ssl=1"
          class="d-block w-100" alt="...">
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
      data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
      data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>

  <div class="text-center mt-5 mb-5" >
    <p><b>
        <h3 style="color: #00BFFF;"> Travel far, travel often, and travel without regrets </h3>
        <h5 class="font" style="font-weight:bold";> Let's Begin!</h5>
      </b></p>
  </div>

<!-------------일정 만들기 시작 ------------ -->
      <div class="album py-5 bg-white">
        <div class="container">
          
          <!-- 글 -->
          <div class="py-5 text-center container col-lg-6 col-md-8 mx-auto">
              <h3 class="fw-bold">어디로 떠날까요? 🚀</h3>
              <h5>여행 목적지를 선택해주세요.</h5>
          </div>

          <div class="row row-cols-1 row-cols-sm-2 row-cols-md-5 g-3"> <!-- row-cols-**:작아지면 1개 좀 커지면 2개, 중간부터 5개씩 카드 위치함 / g:카드간 간격 -->
            <!-- card 1 -->
            <a style="text-decoration: none; color: black;" onclick="service(); openBtn('seoul')">
              <div class="col">
                <div class="card shadow-sm">
                  <img class="bd-placeholder-img card-img-top" width="100%" height="150" xmlns="http://www.w3.org/2000/svg" role="img" src="https://www.agoda.com/wp-content/uploads/2019/03/Seoul-attractions-Changdeokgung.jpg">
                  <div class="card-body">
                      <p class="card-text text-center" style="font-size: large;"><b>서울</b></p>
                  </div>
                </div>
              </div>
            </a>

            <!-- card 2 -->
            <a style="text-decoration: none; color: black;" onclick="service(); openBtn('incheon')">
              <div class="col">
                <div class="card shadow-sm">
                  <img class="bd-placeholder-img card-img-top" width="100%" height="150" xmlns="http://www.w3.org/2000/svg" role="img" src="https://www.bokjinet.co.kr/wp-content/uploads/2023/10/%EC%98%81%EC%A2%85%EB%8C%80%EA%B5%90-%ED%86%B5%ED%96%89%EB%A3%8C-%EC%9D%B8%ED%95%98.webp">
                  <div class="card-body">
                      <p class="card-text text-center" style="font-size: large;"><b>인천</b></p>
                  </div>
                </div>
              </div>
            </a>

            <!-- card 3 -->
            <a style="text-decoration: none; color: black;" onclick="service(); openBtn('daejeon')">
              <div class="col">
                <div class="card shadow-sm">
                  <img class="bd-placeholder-img card-img-top" width="100%" height="150" xmlns="http://www.w3.org/2000/svg" role="img" src="https://img1.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202310/25/speaktravel/20231025205003513hbuj.png">
                  <div class="card-body">
                      <p class="card-text text-center" style="font-size: large;"><b>대전</b></p>
                  </div>
                </div>
              </div>
            </a>

            <!-- card 4 -->
            <a style="text-decoration: none; color: black;" onclick="service(); openBtn('daegu')">
              <div class="col">
                <div class="card shadow-sm">
                  <img class="bd-placeholder-img card-img-top" width="100%" height="150" xmlns="http://www.w3.org/2000/svg" role="img" src="https://image.여기유.com/content_travel/2020021412202315816504231362.jpg">
                  <div class="card-body">
                      <p class="card-text text-center" style="font-size: large;"><b>대구</b></p>
                  </div>
                </div>
              </div>
            </a>

            <!-- card 5 -->
            <a style="text-decoration: none; color: black;" onclick="service(); openBtn('gwangju')">
              <div class="col">
                <div class="card shadow-sm">
                  <img class="bd-placeholder-img card-img-top" width="100%" height="150" xmlns="http://www.w3.org/2000/svg" role="img" src="https://mblogthumb-phinf.pstatic.net/20160529_42/osgsb_1464525134207VPesj_JPEG/20160506102758_IMG_2168.JPG?type=w800">
                  <div class="card-body">
                      <p class="card-text text-center" style="font-size: large;"><b>광주</b></p>
                  </div>
                </div>
              </div>
            </a>

            <!-- card 6 -->
            <a style="text-decoration: none; color: black;" onclick="service(); openBtn('busan')">
              <div class="col">
                <div class="card shadow-sm">
                  <img class="bd-placeholder-img card-img-top" width="100%" height="150" xmlns="http://www.w3.org/2000/svg" role="img" src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191229160530047_oen">
                  <div class="card-body">
                      <p class="card-text text-center" style="font-size: large;"><b>부산</b></p>
                  </div>
                </div>
              </div>
            </a>

            <!-- card 7 -->
            <a style="text-decoration: none; color: black;" onclick="service(); openBtn('ulsan')">
              <div class="col">
                <div class="card shadow-sm">
                  <img class="bd-placeholder-img card-img-top" width="100%" height="150" xmlns="http://www.w3.org/2000/svg" role="img" src="https://blog.kakaocdn.net/dn/buHs0g/btrD5RX38Vz/QSTCK3zqw0KWUn0nn3kjPk/img.jpg">
                  <div class="card-body">
                      <p class="card-text text-center" style="font-size: large;"><b>울산</b></p>
                  </div>
                </div>
              </div>
            </a>

            <!-- card 8 -->
            <a style="text-decoration: none; color: black;" onclick="service(); openBtn('gangwon')">
              <div class="col">
                <div class="card shadow-sm">
                  <img class="bd-placeholder-img card-img-top" width="100%" height="150" xmlns="http://www.w3.org/2000/svg" role="img" src="https://dimg04.c-ctrip.com/images/1mj7212000acoea9nD87E.png">
                  <div class="card-body">
                      <p class="card-text text-center" style="font-size: large;"><b>강원</b></p>
                  </div>
                </div>
              </div>
            </a>

            <!-- card 9 -->
            <a style="text-decoration: none; color: black;" onclick="service(); openBtn('jeju')">
              <div class="col">
                <div class="card shadow-sm">
                  <img class="bd-placeholder-img card-img-top" width="100%" height="150" xmlns="http://www.w3.org/2000/svg" role="img" src="https://here.busan.com/data/editor/2006/72c477f4e4e4991d84fe221a7f1697f8_1592960509_7093.png">
                  <div class="card-body">
                      <p class="card-text text-center" style="font-size: large;"><b>제주</b></p>
                  </div>
                </div>
              </div>
            </a>
  
            
          </div>
        </div>
      </div>
      
      <!-- 모달 -->
      <%@ page import="java.util.Date"%>
	  <%@ page import="java.text.SimpleDateFormat"%>
	  <%
			Date nowTime = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
// 			String region = request.getParameter("region");
	  %>
      <div id="modalContainer" class="hidden">
			<div id="modalContent">
			    <p style="font-family: 'SUIT-Bold'; font-size: large; text-align: center;">여행 정보를 입력해주세요.</p><hr>
<!-- 			    <form action="/app/travelUI?region=" method="post"> -->
			    <form action="<c:url value="/travelUI" />" method="get">
			    <input type="hidden" id="region" name="region" value="">
				    <div class="div_title col-9">
						<label class="title">여행 제목 : </label>
						<input class="text" name="travelTitle" id="travelTitle">
						<div class="calendar">
							<label class="calendar_sdate">여행 시작일 : </label>
							<input class="input-date" type="date" name="SDate" id="SDate" value="" min="<%= sdf.format(nowTime) %>">
							<br><br>
							<label class="calendar_edate">여행 종료일 : </label>
							<input class="input-date" type="date" name="EDate" id="EDate" value="" min="<%= sdf.format(nowTime) %>">
							<br><br>
						</div>
					</div>
					<div id="btnList">
					    <button id="modalCloseButton" class="btn btn-secondary" onclick="closeBtn()">닫기</button>
					    <button id="saveBtn" class="btn btn-primary" onclick="save()">저장</button>
					</div>
			    </form>
			</div>
		</div>
    
 </main>
<script>
function save() {
	if($('#travelTitle').val()==''){
		event.preventDefault();
		alert("여행 제목을 채워주세요 :)");
		$('#travelTitle').focus();
		return;
	}
	if($('#SDate').val() == '') {
		event.preventDefault();
		alert("여행 시작일을 입력해주세요.");
		$('#SDate').focus();
		return;
	}
	if($('#EDate').val() == '') {
		event.preventDefault();
		alert("여행  종료일을 입력해주세요.");
		$('#EDate').focus();
		return;
	}
	
	// 종료일이 시작일 이전일 때
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
	
	if (days <= 0) {
		event.preventDefault();
		alert("여행 종료일이 시작일보다 이전입니다.");
		$('#EDate').focus();
	}
	if (days >= 9) {
		event.preventDefault();
		alert("최대 9일까지만 생성 가능합니다.");
	}
	
	$('#saveBtn').submit();
}
</script>
<br>
<br>
<!-- ------------일정만들기 끝 --------------- -->
<!-- ------------게시판 시작 ----------------- -->
<h4 class="font" style="text-align:center">지금 많이 담고 있는 여담 <span class="text-primary">' Top 5 '</span>🚀</h4>

<div style="text-align:center">
  <div class="board-container">
    <table>
      <tr>
        <th class="contentNum">번호</th>
        <th class="title1">제목</th>
        <th class="userID">이름</th>
        <th class="views">조회수</th>
        <th class="likeContent">좋아요</th>
        <th class="boardDate">등록일</th>
    </tr>
      <c:forEach var="DTO" items="${list }">
        <tr>
          <td class="contentNum">${DTO.contentNum}</td>
          <td class="title"><a href="BoardRetrieve?contentNum=${DTO.contentNum}">${DTO.title }</a></td>
          <td class="userID">${DTO.userID }</td>
          <td class="views">${DTO.views }</td>
          <td class="likeContent">${DTO.likeContent }</td>
          <td class="boardDate">${DTO.boardDate }</td>
        </tr>
      </c:forEach>
    </table>
    <br>
  </div>
</div> <!-- 게시판 끝 -->

<!-- 카드 부분 : 추후에 좋아요 많은 best3 나오게끔 수정할 것  -->
<h4 class="font" style="text-align:center">- 여담 추천 일정 -</h4>
<br>
  <div class="container">
    <div class="card-group">
      <div class="card">
        <img
          src="https://images.unsplash.com/photo-1635686692794-b0ce6337386b?auto=format&fit=crop&q=80&w=1470&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
          alt="...">
        <div class="card-body" style="text-align: center;">
          <p style="font-size: 18px !important; font-weight: 700 !important;" class="card-text">Best 일정1</p>
        </div>
        <div class="card-footer" style="text-align: center;">
          <small style="color: #1E90FF;">서울특별시</small>
        </div>
      </div>
      <div class="card">
        <img
          src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA5MjBfMTk2%2FMDAxNjk1MTQ1NTgzODM3.dCa3hCgf41oyRQHnbVCDsl3MmCZXT8EvTR-_d_-ACM0g.ksLiZc_1b3_tREmMj0Igawd1N6tj5RjajbNMPnZNPnQg.JPEG.syoung579%2FIMG_3185.jpg&type=sc960_832"
          alt="...">
        <div class="card-body" style="text-align: center;">
          <p style="font-size: 18px !important; font-weight: 700 !important;" class="card-text">Best 일정2</p>
        </div>
        <div class="card-footer" style="text-align: center;">
          <small style="color: #1E90FF;">경상북도 경주</small>
        </div>
      </div>
      <div class="card">
        <img
          src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA1MTVfODEg%2FMDAxNjg0MTA0NTgwMTky.CubejHquZfkow0Wf2AGqqKg-h-lbta7Uu2VwdhiNQuIg.0uSJP15n0gFRhvo5gm60N1u-IQ8tkbQwA-G1yv8XXikg.JPEG.qhfl0802%2F20230502%25A3%25DF120529.jpg&type=sc960_832"
          alt="...">
        <div class="card-body" style="text-align: center;">
          <p style="font-size: 18px !important; font-weight: 700 !important;" class="card-text">Best 일정3</p>
        </div>
        <div class="card-footer" style="text-align: center;">
          <small style="color: #1E90FF;"> 전라남도 담양 </small>
        </div>
      </div>
    </div>
  </div>
<br>
<br>
<!-- footer -->
<footer>
  <div class="jumbotron text-center mt-5 mb-0">
    <h3 class="text-secondary">여 담;</h3>
    <p> Homepage is powered by <span class="text-primary">4orward</span></p>
  </div>
</footer>
</body>
</html>
