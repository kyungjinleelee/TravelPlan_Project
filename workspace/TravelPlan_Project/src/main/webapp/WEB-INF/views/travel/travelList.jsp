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
   <script>
     $(document).ready(function() {
        $(".deleteBtn").on("click", function() {
            var travelID = $(this).attr("data-travelID");
            var confirmed = confirm("정말 삭제하시겠습니까?");   //확인 메세지 표시. true or false 값을 반환.
            if (confirmed) {    //확인을 누른 경우에만 삭제 요청
         	   location.href="travelDel?travelID="+travelID;
            }
        });
    }); 
   </script>	
</head>

<body>
<!-- top2.jsp -->
<!--     <nav class="navbar navbar-light bg-light"> -->
<!--         <div class="container-fluid"> -->
<!--             <a class="navbar-brand" href="#"> -->
<!--                 <img src=""> -->
<!--                 <span style="color: #1E90FF"> <b style="font-size: 25px">여 담; 여행을 담다</b></span> -->
<!--             </a> -->
<!--             <div class="d-grid gap-2 d-md-flex justify-content-md-end"> -->
<!--                 <button type="button" class="btn btn-outline-primary">회원가입</button> -->
<!--                 <button class="btn btn-primary" type="button">로그인</button> -->
<!--             </div> -->
<!--         </div> -->
<!--     </nav> -->

<!--     <nav class="navbar navbar-expand-lg navbar-light bg-light"> -->
<!--         <div class="container-fluid"> -->
<!--             <a class="navbar-brand" href="#" style="color: #1E90FF">Best일정</a> -->
<!--             <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" -->
<!--                 aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> -->
<!--                 <span class="navbar-toggler-icon"></span> -->
<!--             </button> -->
<!--             <div class="collapse navbar-collapse" id="navbarSupportedContent"> -->
<!--                 <ul class="navbar-nav me-auto mb-2 mb-lg-0"> -->
<!--                     <li class="nav-item"> -->
<!--                         <a class="nav-link" aria-current="page" href="#">일정 만들기</a> -->
<!--                     </li> -->
<!--                     <li class="nav-item"> -->
<!--                         <a class="nav-link" href="travelList">일정 보관함</a> -->
<!--                     </li> -->
<!--                     <li class="nav-item dropdown"> -->
<!--                         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" -->
<!--                             data-bs-toggle="dropdown" aria-expanded="false"> -->
<!--                             		게시판 -->
<!--                         </a> -->
<!--                         <ul class="dropdown-menu" aria-labelledby="navbarDropdown"> -->
<!--                             <li><a class="dropdown-item" href="#">여담 게시판</a></li> -->
<!--                             <li><a class="dropdown-item" href="#">일반 게시판</a></li> -->
<!--                             <li> -->
<!--                                 <hr class="dropdown-divider"> -->
<!--                             </li> -->
<!--                             <li><a class="dropdown-item" href="#">Something else here</a></li> -->
<!--                         </ul> -->
<!--                     </li> -->
<!--                 </ul> -->
<!--                 <form class="d-flex"> -->
<!--                     <input class="form-control me-2" type="search" name="search" placeholder="Search" aria-label="Search"> -->
<!--                     <button type="button" class="btn btn-outline-info">Search</button> -->
<!--                 </form> -->
<!--             </div> -->
<!--         </div> -->
<!--     </nav> -->

<!-- top.jsp -->
	<div id="header">
		<jsp:include page="../common/top.jsp" flush="true" />
	</div>

<!-- contents -->  
  
    <br>
    <br>
    <br>
    <div class="centered-title text-center">
        <h1 style="font-weight: 600;">일정 보관함</h1>
    </div>
    <br>
    <br>
    <br>
    <br>
    
<div class="container">
    <div class="d-flex justify-content-between mt-5">
    	<!-- 경로 설정 나중에 다시 확인 -->
        <button type="button" class="btn btn-outline-primary" onclick="window.location.href='/app/travelUI'">새 일정 만들기</button>
        <button type="button" class="btn btn-primary">게시판 등록</button>
    </div>
    <br>
    <br>
    <div class="container" style="min-height: 70vh;">
        <div class="row justify-content-center">
            <c:forEach var="travel" items="${pageDTO2.list}" varStatus="status">
          	  <div class="col-md-3">  <!-- col-md-4 로 할지 고민중 -->
                <div class="card text-center mb-5" style="width: 18rem;">
               	 <!-- 여기서 이미지를 동적으로 설정할 방법을 추가 -->
                      <img src="..." class="card-img-top" alt="...">    <!-- 지역에 따른 이미지 사진 추가해주기 -->
                    <div class="card-body">
                        <h5 class="card-title" style="font-weight:800;">${travel.travelTitle}</h5>
                        <p class="card-text">${travel.writedate}</p>
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
