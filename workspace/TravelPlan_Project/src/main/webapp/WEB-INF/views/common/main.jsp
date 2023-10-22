<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
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
    </style>

    
  </head>
  <body>
    <main>

      <!-- 상단 타이틀 -->
      <section class="py-5 text-center bg-white">
        <div class="container">
          <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
              <h1 class="fw-bold">여행을 담다, 여담</h1>
              <p class="lead text-muted">민첩하고 스근한 여행🚀</p>
            </div>
          </div>
        </div>
      </section>
      
      <!-- 추천 일정(좋아요순) -->
      <section class="py-5 album text-center bg-light">
        
        <div class="container">

          <!-- 글 -->
          <div class="py-5 text-center container col-lg-6 col-md-8 mx-auto">
            <h3 class="fw-bold">추천 일정</h3>
            <p class="lead text-secondary" style="font-size: medium;">사용자가 좋아하는 일정 TOP 5</p>
          </div>

          <!-- 카드 -->
          <div class="row row-cols-1 row-cols-sm-2 row-cols-md-5 g-3"> <!-- row-cols-**:작아지면 1개 좀 커지면 2개, 중간부터 5개씩 카드 위치함 / g:카드간 간격 -->
            <!-- card 1 -->
            <a href="aa?areacode=1" style="text-decoration: none; color: black;">
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
            <a href="aa?areacode=1" style="text-decoration: none; color: black;">
              <div class="col">
                <div class="card shadow-sm">
                  <img class="bd-placeholder-img card-img-top" width="100%" height="150" xmlns="http://www.w3.org/2000/svg" role="img" src="https://www.agoda.com/wp-content/uploads/2019/03/Seoul-attractions-Changdeokgung.jpg">
                  <div class="card-body">
                    <p class="card-text text-center" style="font-size: large;"><b>서울</b></p>
                  </div>
                </div>
              </div>
            </a>

            <!-- card 3 -->
            <a href="aa?areacode=1" style="text-decoration: none; color: black;">
              <div class="col">
                <div class="card shadow-sm">
                  <img class="bd-placeholder-img card-img-top" width="100%" height="150" xmlns="http://www.w3.org/2000/svg" role="img" src="https://www.agoda.com/wp-content/uploads/2019/03/Seoul-attractions-Changdeokgung.jpg">
                  <div class="card-body">
                    <p class="card-text text-center" style="font-size: large;"><b>서울</b></p>
                  </div>
                </div>
              </div>
            </a>

            <!-- card 4 -->
            <a href="aa?areacode=1" style="text-decoration: none; color: black;">
              <div class="col">
                <div class="card shadow-sm">
                  <img class="bd-placeholder-img card-img-top" width="100%" height="150" xmlns="http://www.w3.org/2000/svg" role="img" src="https://www.agoda.com/wp-content/uploads/2019/03/Seoul-attractions-Changdeokgung.jpg">
                  <div class="card-body">
                    <p class="card-text text-center" style="font-size: large;"><b>서울</b></p>
                  </div>
                </div>
              </div>
            </a>

            <!-- card 5 -->
            <a href="aa?areacode=1" style="text-decoration: none; color: black;">
              <div class="col">
                <div class="card shadow-sm">
                  <img class="bd-placeholder-img card-img-top" width="100%" height="150" xmlns="http://www.w3.org/2000/svg" role="img" src="https://www.agoda.com/wp-content/uploads/2019/03/Seoul-attractions-Changdeokgung.jpg">
                  <div class="card-body">
                    <p class="card-text text-center" style="font-size: large;"><b>서울</b></p>
                  </div>
                </div>
              </div>
            </a>
          </div>
          
        </div>
        
      </section>
      
      
      
      <!-- 여행만들기 -->
      <div class="album py-5 bg-white">
        <div class="container">
          
          <!-- 글 -->
          <div class="py-5 text-center container col-lg-6 col-md-8 mx-auto">
              <h3 class="fw-bold">여행 목적지를 선택해주세요.</h3>
          </div>

          <div class="row row-cols-1 row-cols-sm-2 row-cols-md-5 g-3"> <!-- row-cols-**:작아지면 1개 좀 커지면 2개, 중간부터 5개씩 카드 위치함 / g:카드간 간격 -->
            <!-- card 1 -->
            <a href="aa?areacode=1" style="text-decoration: none; color: black;">
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
            <a href="aa?areacode=2" style="text-decoration: none; color: black;">
              <div class="col">
                <div class="card shadow-sm">
                  <img class="bd-placeholder-img card-img-top" width="100%" height="150" xmlns="http://www.w3.org/2000/svg" role="img" src="https://www.agoda.com/wp-content/uploads/2019/03/Seoul-attractions-Changdeokgung.jpg">
                  <div class="card-body">
                      <p class="card-text text-center" style="font-size: large;"><b>서울</b></p>
                  </div>
                </div>
              </div>
            </a>

            <!-- card 3 -->
            <a href="aa?areacode=3" style="text-decoration: none; color: black;">
              <div class="col">
                <div class="card shadow-sm">
                  <img class="bd-placeholder-img card-img-top" width="100%" height="150" xmlns="http://www.w3.org/2000/svg" role="img" src="https://www.agoda.com/wp-content/uploads/2019/03/Seoul-attractions-Changdeokgung.jpg">
                  <div class="card-body">
                      <p class="card-text text-center" style="font-size: large;"><b>서울</b></p>
                  </div>
                </div>
              </div>
            </a>

            <!-- card 4 -->
            <a href="aa?areacode=4" style="text-decoration: none; color: black;">
              <div class="col">
                <div class="card shadow-sm">
                  <img class="bd-placeholder-img card-img-top" width="100%" height="150" xmlns="http://www.w3.org/2000/svg" role="img" src="https://www.agoda.com/wp-content/uploads/2019/03/Seoul-attractions-Changdeokgung.jpg">
                  <div class="card-body">
                      <p class="card-text text-center" style="font-size: large;"><b>서울</b></p>
                  </div>
                </div>
              </div>
            </a>

            <!-- card 5 -->
            <a href="aa?areacode=5" style="text-decoration: none; color: black;">
              <div class="col">
                <div class="card shadow-sm">
                  <img class="bd-placeholder-img card-img-top" width="100%" height="150" xmlns="http://www.w3.org/2000/svg" role="img" src="https://www.agoda.com/wp-content/uploads/2019/03/Seoul-attractions-Changdeokgung.jpg">
                  <div class="card-body">
                      <p class="card-text text-center" style="font-size: large;"><b>서울</b></p>
                  </div>
                </div>
              </div>
            </a>

            <!-- card 6 -->
            <a href="aa?areacode=6" style="text-decoration: none; color: black;">
              <div class="col">
                <div class="card shadow-sm">
                  <img class="bd-placeholder-img card-img-top" width="100%" height="150" xmlns="http://www.w3.org/2000/svg" role="img" src="https://www.agoda.com/wp-content/uploads/2019/03/Seoul-attractions-Changdeokgung.jpg">
                  <div class="card-body">
                      <p class="card-text text-center" style="font-size: large;"><b>서울</b></p>
                  </div>
                </div>
              </div>
            </a>

            <!-- card 7 -->
            <a href="aa?areacode=7" style="text-decoration: none; color: black;">
              <div class="col">
                <div class="card shadow-sm">
                  <img class="bd-placeholder-img card-img-top" width="100%" height="150" xmlns="http://www.w3.org/2000/svg" role="img" src="https://www.agoda.com/wp-content/uploads/2019/03/Seoul-attractions-Changdeokgung.jpg">
                  <div class="card-body">
                      <p class="card-text text-center" style="font-size: large;"><b>서울</b></p>
                  </div>
                </div>
              </div>
            </a>

            <!-- card 8 -->
            <a href="aa?areacode=8" style="text-decoration: none; color: black;">
              <div class="col">
                <div class="card shadow-sm">
                  <img class="bd-placeholder-img card-img-top" width="100%" height="150" xmlns="http://www.w3.org/2000/svg" role="img" src="https://www.agoda.com/wp-content/uploads/2019/03/Seoul-attractions-Changdeokgung.jpg">
                  <div class="card-body">
                      <p class="card-text text-center" style="font-size: large;"><b>서울</b></p>
                  </div>
                </div>
              </div>
            </a>

            <!-- card 9 -->
            <a href="aa?areacode=9" style="text-decoration: none; color: black;">
              <div class="col">
                <div class="card shadow-sm">
                  <img class="bd-placeholder-img card-img-top" width="100%" height="150" xmlns="http://www.w3.org/2000/svg" role="img" src="https://www.agoda.com/wp-content/uploads/2019/03/Seoul-attractions-Changdeokgung.jpg">
                  <div class="card-body">
                      <p class="card-text text-center" style="font-size: large;"><b>서울</b></p>
                  </div>
                </div>
              </div>
            </a>

            <!-- card 10 -->
            <a href="aa?areacode=10" style="text-decoration: none; color: black;">
              <div class="col">
                <div class="card shadow-sm">
                  <img class="bd-placeholder-img card-img-top" width="100%" height="150" xmlns="http://www.w3.org/2000/svg" role="img" src="https://www.agoda.com/wp-content/uploads/2019/03/Seoul-attractions-Changdeokgung.jpg">
                  <div class="card-body">
                      <p class="card-text text-center" style="font-size: large;"><b>서울</b></p>
                  </div>
                </div>
              </div>
            </a>

          </div>
        </div>
      </div>

    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

      
  </body>
</html>