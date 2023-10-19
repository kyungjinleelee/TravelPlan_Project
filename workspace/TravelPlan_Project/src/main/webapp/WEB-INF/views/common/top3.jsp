<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* 로그인과 로그아웃 버튼 사이 간격 조정 */
        .navbar-nav.ml-auto {
            margin-left: 20px;
        }
        /* 메뉴 가운데 정렬 */
        .navbar-nav {
            width: 100%;
            justify-content: center;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-white">
        <a class="navbar-brand" href="#">
            <img src="your-logo.png" width="30" height="30" alt="로고">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">일정 만들기</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">일정 보관함</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">게시판</a>
                </li>
            </ul>
        </div>
        <div class="navbar-nav ml-auto">
            <button class="btn btn-primary">로그인</button>
            <button class="btn btn-primary">로그아웃</button>
        </div>
    </nav>
</body>
</html>
