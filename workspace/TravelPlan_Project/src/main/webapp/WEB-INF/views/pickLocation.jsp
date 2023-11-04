<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script>
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


<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Hugo 0.104.2">
  <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/album/">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">

 <style>
 	* { font-family: 'SUIT-Medium'; }
	 @font-face {
	    font-family: 'SUIT-Bold';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Bold.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	}
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
      
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
    </style>
<title>지역을 선택해주세요</title>

<script>
	;
</script>
</head>
<body>

<!-- header -->
<jsp:include page="common/top.jsp" flush="true" />

<!-- main -->
 <main>
  <!-- 여행만들기 -->
      <div class="album py-5 bg-white">
        <div class="container">
          
          <!-- 글 -->
          <div class="py-5 text-center container col-lg-6 col-md-8 mx-auto">
              <h3 class="fw-bold">어디로 떠날까요? 🚀</h3>
              <h5>여행 목적지를 선택해주세요.</h5>
          </div>

          <div class="row row-cols-1 row-cols-sm-2 row-cols-md-5 g-3"> <!-- row-cols-**:작아지면 1개 좀 커지면 2개, 중간부터 5개씩 카드 위치함 / g:카드간 간격 -->
            <!-- card 1 -->
            <a style="text-decoration: none; color: black;" onclick="openBtn('seoul')">
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
            <a style="text-decoration: none; color: black;" onclick="openBtn('incheon')">
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
            <a style="text-decoration: none; color: black;" onclick="openBtn('daejeon')">
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
            <a style="text-decoration: none; color: black;" onclick="openBtn('daegu')">
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
            <a style="text-decoration: none; color: black;" onclick="openBtn('gwangju')">
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
            <a style="text-decoration: none; color: black;" onclick="openBtn('busan')">
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
            <a style="text-decoration: none; color: black;" onclick="openBtn('ulsan')">
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
            <a style="text-decoration: none; color: black;" onclick="openBtn('gangwon')">
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
            <a style="text-decoration: none; color: black;" onclick="openBtn('jeju')">
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
			    <form action="../travelUI" method="get">
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
 
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>