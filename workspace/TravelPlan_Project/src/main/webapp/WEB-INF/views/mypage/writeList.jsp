<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>order</title>
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

</script>
</head>

<body>
	<jsp:include page="../common/top.jsp" flush="true" /><br>
	<h1>내가 쓴 글 목록입니다</h1>
	<c:set var="DTOlist" value="${wDTOList}" />
	<div class="container">
		<h2 class="text-center">내가 쓴 글 목록</h2>
		<table class="table table-striped">
			<thead>
			<!-- 유난히 게시판이랑 헷갈리는데 ui고치고 아마 제목 작성일시 조회수 정도만 출력 -->
				<tr>
					<th>게시글 번호(contentNum)</th>
					<th>작성자(userid)</th>
					<th>제목(title)</th>
					<th>작성일시(boardDate)</th>
					<th>조회수(views)</th>
					<th>본문(mainText)</th>
					<th>좋아요 수(likeContent)</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="DTOlist" items="${DTO}">
					<tr>
						<td>${DTO.contentNum}</td>
						<td>${DTO.userid}</td>
						<td>${DTO.title}</td>
						<td>${DTO.boardDate}</td>
						<td>${DTO.views}</td>
						<td>${DTO.mainText}</td>
						<td>${DTO.likeContent}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
