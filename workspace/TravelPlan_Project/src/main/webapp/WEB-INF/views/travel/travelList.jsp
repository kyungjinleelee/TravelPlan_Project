<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>여 담; 여행을 담다</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"></script> 
    <!-- alert 커스텀 -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.9.0/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.9.0/dist/sweetalert2.all.min.js"></script>
	<style>
		* {
			font-family: 'SUIT-Medium';
		}
		.card-text {
    	margin-bottom: 1px; 
    	font-family: Gothic;
    	color: #808080;
    	font-size: 12px;
		}
		
		.card-title {
		font-family: Gothic;
		font-weight: 800;
		}
		
		.card {
		    width: 18rem; /* 카드의 너비를 일정한 값으로 설정 */
		}
		
		.card-img-top {
		    height: 210px; /* 이미지의 높이를 일정한 값으로 설정 */
		    object-fit: cover; /* 이미지 비율 유지하며 카드 이미지 영역 가득 채우기 */
		}
		
		.card-footer {
			font-weight: bold;
		}
		.card-footer:link {
		  color : black;
		  text-decoration: none;
		  transition: background 0.5s ease-in-out;
		}
		.card-footer:visited {
		  color : black;
		  text-decoration: none;
		  transition: background 0.5s ease-in-out;
		}
		.card-footer:hover {
		  color : black;
		  text-decoration: none;
		  background: #D9D9D9;
		}
		.card-footer:active {
		  color : black;
		  text-decoration: none;
		  transition: background 0.1s ease-in-out;
		}
	</style>
	
   <script>
	   $(document).ready(function() {
		    $(".deleteBtn").on("click", function() {
		        var travelID = $(this).attr("data-travelID");
	
		        // SweetAlert2  적용
		        Swal.fire({
		            title: '정말 삭제하시겠습니까?',
		            text: '다시 되돌릴 수 없습니다. 신중하세요.',
		            icon: 'warning',
		            showCancelButton: true,
		            confirmButtonColor: '#3085d6',
		            cancelButtonColor: '#d33',
		            confirmButtonText: '삭제',
		            cancelButtonText: '취소',
		            reverseButtons: true,
		        }).then((result) => {
		            if (result.isConfirmed) {
		                // 사용자가 확인을 클릭한 경우에만 삭제 요청
		                location.href = "travelDel?travelID=" + travelID;
		            }
		        });
		    });
		});
   
     /* $(document).ready(function() {
        $(".deleteBtn").on("click", function() {
            var travelID = $(this).attr("data-travelID");
            var confirmed = confirm("정말 삭제하시겠습니까?");   //확인 메세지 표시. true or false 값을 반환.
            if (confirmed) {    //확인을 누른 경우에만 삭제 요청
         	   location.href="travelDel?travelID="+travelID;
            }
        });
    });  */
    
    // 지역 이름과 이미지 매핑
    var wordToImageMapping = {
    		  "서울": "https://www.agoda.com/wp-content/uploads/2019/03/Seoul-attractions-Changdeokgung.jpg",
    		  "인천": "https://www.bokjinet.co.kr/wp-content/uploads/2023/10/%EC%98%81%EC%A2%85%EB%8C%80%EA%B5%90-%ED%86%B5%ED%96%89%EB%A3%8C-%EC%9D%B8%ED%95%98.webp",
    		  "대전": "https://img1.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202310/25/speaktravel/20231025205003513hbuj.png",
    		  "대구": "https://image.여기유.com/content_travel/2020021412202315816504231362.jpg",
    		  "광주": "https://mblogthumb-phinf.pstatic.net/20160529_42/osgsb_1464525134207VPesj_JPEG/20160506102758_IMG_2168.JPG?type=w800",
    		  "부산": "https://www.visitbusan.net/uploadImgs/files/cntnts/20191229160530047_oen",
    		  "울산": "https://blog.kakaocdn.net/dn/buHs0g/btrD5RX38Vz/QSTCK3zqw0KWUn0nn3kjPk/img.jpg",
    		  "강원": "https://dimg04.c-ctrip.com/images/1mj7212000acoea9nD87E.png",
    		  "제주": "https://blog.kakaocdn.net/dn/ZQJyI/btsz5n6N3RH/uZwJWi7mkkRfF19e5bd9B0/img.png",
    		  "전주": "https://blog.kakaocdn.net/dn/bteXTh/btszZGmEXIh/ARFgsNQHLqSxfKh3YO70rk/img.png",
    		  "경주": "https://blog.kakaocdn.net/dn/4KVTF/btszYFPe79x/vxwIprEpGbkLDIKUZNmE70/img.png",
    		  "속초": "https://blog.kakaocdn.net/dn/tuUVA/btsz20LXGAq/NuH3rsK8VPdt3Ki7XWSVv0/img.png",
    		  "강릉": "https://blog.kakaocdn.net/dn/bdrf0F/btsz1utsv6J/gfE1k9W52RIKeMtFHwtXt1/img.png",
    		  "군산": "https://blog.kakaocdn.net/dn/XMryC/btsz3bGJuoG/Jitcz83AJcXGCwMWrkmv7k/img.png"
    		};
    
   </script>	
</head>

<body>

	<div id="header">
		<jsp:include page="../common/top.jsp" flush="true" />
	</div>

<!-- contents -->  

    <div class="centered-title text-center mt-5">
        <h2 style="font-weight: 600;">일정 보관함</h2>
    </div>
    
<div class="container">
    <div class="d-flex justify-content-end mt-5">
        <button type="button" class="btn btn-outline-primary" onclick="window.location.href='/app/loginCheck/pickLocation'">새 일정 만들기</button>
    </div>
    <br>
    <br>
    <div class="container" style="min-height: 70vh;">
        <div class="row justify-content-center">
            <c:forEach var="travel" items="${pageDTO2.list}" varStatus="status">
          	  <div class="col-md-3">  
                <div class="card text-center mb-5" style="width: 18rem;">
                   <img id="travelImage${travel.travelID}" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title" id="travelTitle">${travel.travelTitle}</h5>
                        <p class="card-text">여행 시작&nbsp;&nbsp;&nbsp;${travel.SDate.substring(0, 10)}</p>
                        <p class="card-text">여행 끝&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${travel.EDate.substring(0, 10)}</p>
                        <br>
                        <a href="travelRetrieve?travelID=${travel.travelID}" class="btn btn-primary btn-sm">일정 보러가기</a>
                   		<button type="button" class="deleteBtn btn btn-danger btn-sm" data-travelID="${travel.travelID}">삭제</button>
                    </div>
                    <a href="../WriteTravel?travelID=${travel.travelID}" class="card-footer">
						게시판 등록
                    </a>
                </div>
              </div>
            
    
    <!-- 카드 부분 -->
	    <script>
	    var travelTitle = "${travel.travelTitle}";
	    var travelImage = document.getElementById("travelImage${travel.travelID}");
	    var selectedImageUrl = "https://blog.kakaocdn.net/dn/bnjbwp/btszYEixOm6/3lBILaQDzfOVTTRSFUfZw0/img.png"; // 기본 이미지 URL 설정
	
	    // 특정 단어에 해당하는 이미지 URL 선택
	    for (var word in wordToImageMapping) {
	      if (travelTitle.includes(word)) {
	        selectedImageUrl = wordToImageMapping[word];
	        break; // 이미지를 찾았으면 반복 중단
	      }
	    }
	
	    // 이미지 업데이트
	    travelImage.src = selectedImageUrl;
	   </script>
	 </c:forEach>
  </div>
</div>   
    
<!-- 페이지네이션 -->
 <nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item">
      <a class="page-link" href="travelList?curPage=${pageDTO2.curPage - 1}" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <!-- 화면에 보여지는 총 페이지수 -->
    <c:set var="totalPages" value="${pageDTO2.totalCount / pageDTO2.perPage + 1}" />  
    <c:forEach var="i" begin="1" end="${totalPages}">
      <c:choose>
        <c:when test="${i == pageDTO2.curPage}">
          <li class="page-item active">
            <span class="page-link">${i}</span>
          </li>
        </c:when>
        <c:otherwise>
          <li class="page-item">
            <a class="page-link" href="<c:url value='travelList'/>?curPage=${i}">${i}</a>
          </li>
        </c:otherwise>
      </c:choose>
    </c:forEach>
    <li class="page-item">
      <a class="page-link" href="travelList?curPage=${pageDTO2.curPage + 1}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>  
</div>
</body>
</html>
