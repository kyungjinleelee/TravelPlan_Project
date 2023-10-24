<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>여 담; 여행을 담다</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <nav class="navbar navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="">
                <span style="color: #1E90FF"> <b style="font-size: 25px">여 담; 여행을 담다</span> </b>
            </a>
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button type="button" class="btn btn-outline-primary">회원가입</button>
                <button class="btn btn-primary" type="button">로그인</button>
            </div>
        </div>
    </nav>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#" style="color: #1E90FF">Best일정</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="#">일정 만들기</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">일정 보관함</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            게시판
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">여담 게시판</a></li>
                            <li><a class="dropdown-item" href="#">일반 게시판</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button type="button" class="btn btn-outline-info">Info</button>
                </form>
            </div>
        </div>
    </nav>

    <br>

    <div class="centered-title text-center">
        <h1 style="font-weight: 600;">일정 보관함</h1>
    </div>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>

    
<div class="container">
    <div class="d-flex justify-content-between mt-4">
        <button type="button" class="btn btn-outline-primary" onclick="window.location.href='일정만들기.jsp'">새 일정 만들기</button>
        <button type="button" class="btn btn-primary">게시판 등록</button>
    </div>
    <br>
    <br>
    <div class="container" style="min-height: 100vh;">
        <div class="row">
            <div class="col-md-4">
                <div class="card text-center mb-3" style="width: 18rem;">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                    <c:forEach items="${travelList}" var="travel">
                        <h5 class="card-title" style="font-weight:800;">${travel.areaCode}서울</h5>
                        <p class="card-text">${travel.travelTitle}나 혼자 서울 여행</p>
                        <a href="travelRetrieve?userID=${travel.travelID}" class="btn btn-primary">일정 보러가기</a>
                    </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center mb-3" style="width: 18rem;">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                    <c:forEach items="${travelList}" var="travel">
                        <h5 class="card-title" style="font-weight: 800;">${travel.areaCode}군산</h5>
                        <p class="card-text">${travel.travelTitle}군산 여행</p>
                        <a href="travelRetrieve?userID=${travel.travelID}" class="btn btn-primary">일정 보러가기</a>
                    </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center mb-3" style="width: 18rem;">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                    <c:forEach items="${travelList}" var="travel">
                        <h5 class="card-title" style="font-weight: 800;">${travel.areaCode}제주도</h5>
                        <p class="card-text">${travel.travelTitle}남자친구와 제주도 여행</p>
                        <a href="travelRetrieve?userID=${travel.travelID}" class="btn btn-primary">일정 보러가기</a>
                    </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    <footer>
        <div class="jumbotron text-center mt-0 mb-0">
            <h3 class="text-secondary">여 담;</h3>
            <p>Homepage is powered by <span class="text-primary">4orward</span></p>
        </div>
    </footer>

    <script>
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2Ml"
    </script> 