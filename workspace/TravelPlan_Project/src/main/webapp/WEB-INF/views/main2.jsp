<!-- 부트스트랩 버전 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous">
</script>
<title>main2</title>
</head>
<body>
<jsp:include page="common/top2.jsp" flush="true" /><br>
<hr>


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
          src="https://images.unsplash.com/photo-1584345110951-7c0e3ca09b82?auto=format&fit=crop&q=80&w=2070&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
          class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
        <img
          src="https://images.unsplash.com/photo-1673179559805-8dfbf64e10d4?auto=format&fit=crop&q=80&w=1674&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
          class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
        <img
          src="https://plus.unsplash.com/premium_photo-1661914310117-9875b2229719?auto=format&fit=crop&q=80&w=1740&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
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

  <div class="text-center mt-5 mb-5" style="color: #00BFFF;">
    <p><b>
        <h3> Travel far, travel often, and travel without regrets </h3>
      </b></p>
  </div>


<!-- 카드 부분 : 추후에 좋아요 많은 best3 나오게끔 수정할 것  -->
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
