<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 화면</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function go_list() {
		//현재는 기능 없음.
		//location.href="SharedTravelBoard";
	}
</script>
</head>
<body>
	<jsp:include page="../common/top.jsp" flush="true" /><br>
	<h1>게시판입니다.</h1>
	<!--
	아직 만드는중 
	go_list 수정 /writeui 구현하거나 삭제
	SbDTOList
	 -->
	<c:set var="DTO" value="${SbDTOList}" /> <!--{SbDTOList}from model ==> SbDTOList  -->

	<div class="container">
		<h2 class="text-center">게시판 화면</h2>
		<table class="table table-striped">
			<thead>
				<tr>
					<th></th>
					<th>작성자(userID)</th>
					<th>제목(title)</th>
					<th>좋아요</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="DTO" items="${content}"><!--  -->
					<tr>
						<td>${DTO.contentNum}</td>
						<td>${DTO.userID}</td>
						<td><a href="BoardRetrieve?contentNum=${DTO.contentNum}">${DTO.title}</a></td>
						<td>${DTO.likeContent}</td>
						<td>${DTO.views}</td>
						<td>${DTO.boardDate}</td>
						<td><a href="delete?no=${list.no}">수정</a></td>
						<td><a href="delete?no=${list.no}">삭제</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button onclick="writeui()">글쓰기(기능안함)</button>
	</div>
</body>
</html>