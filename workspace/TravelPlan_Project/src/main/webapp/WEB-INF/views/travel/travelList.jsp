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
		.card-text {
    	margin-bottom: 1px; 
    	font-family: Gothic;
    	color: #808080;
    	font-size: 12px;
		}
	</style>
   <script>
	   $(document).ready(function() {
		    $(".deleteBtn").on("click", function() {
		        var travelID = $(this).attr("data-travelID");
	
		        // SweetAlert2 대화상자 표시
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
   </script>	
</head>

<body>

	<div id="header">
		<jsp:include page="../common/top.jsp" flush="true" />
	</div>

<!-- contents -->  
  
    <br>
    <br>
    <div class="centered-title text-center">
        <h1 style="font-weight: 600;">일정 보관함</h1>
    </div>
    <br>
    
<div class="container">
    <div class="d-flex justify-content-between mt-5">
        <button type="button" class="btn btn-outline-primary" onclick="window.location.href='/app/loginCheck/pickLocation'">새 일정 만들기</button>
        <button type="button" class="btn btn-primary">게시판 등록</button>
    </div>
    <br>
    <br>
    <div class="container" style="min-height: 70vh;">
        <div class="row justify-content-center">
            <c:forEach var="travel" items="${pageDTO2.list}" varStatus="status">
          	  <div class="col-md-3">  
                <div class="card text-center mb-5" style="width: 18rem;">
               	 <!-- 여기서 이미지를 동적으로 설정할 방법을 추가 -->
                      <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbnjbwp%2FbtszYEixOm6%2F3lBILaQDzfOVTTRSFUfZw0%2Fimg.png" class="card-img-top" alt="...">    <!-- 지역에 따른 이미지 사진 추가해주기 -->
                    <div class="card-body">
                        <h5 class="card-title" style="font-weight:800;">${travel.travelTitle}</h5>
                        <p class="card-text">여행 시작   ${travel.SDate}</p>
                        <p class="card-text">여행 끝   ${travel.EDate}</p>
                        <%-- <p class="card-text">작성일 : ${travel.writedate}</p> --%>
                        <br>
                        <a href="travelRetrieve?travelID=${travel.travelID}" class="btn btn-primary btn-sm">일정 보러가기</a>
                   		<button type="button" class="deleteBtn btn-danger btn-sm" data-travelID="${travel.travelID}">삭제</button>
                    </div>
                </div>
              </div>
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
