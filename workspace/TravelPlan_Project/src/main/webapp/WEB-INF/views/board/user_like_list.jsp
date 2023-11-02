<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 좋아요 한 게시글</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="../common/top.jsp" flush="true" /><br>

<div class="container">
	<h2 class="text-center">보관함 화면</h2>
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
				<c:forEach var="DTO" items="${content.list}">
					<!--  -->
					<tr>
						<td>${DTO.contentNum}</td>
						<td>${DTO.userID}</td>
						<td><a href="BoardRetrieve?contentNum=${DTO.contentNum}">${DTO.title}</a></td>
						<td>${DTO.likeContent}</td>
						<td>${DTO.views}</td>
						<td>${DTO.boardDate}</td>

						<td><button onclick="askYesNo(${DTO.contentNum})">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<table class="paging-table" >
			<c:set var="perPage" value="${content.perPage}" />
			<c:set var="curPage" value="${content.curPage}" />
			<c:set var="totalCount" value="${content.totalCount}" />
			<c:set var="totalNum" value="${totalCount / perPage}" />

			<c:if test="${totalCount % perPage != 0}">
				<c:set var="totalNum" value="${totalNum+1}" />
			</c:if>

			<tr >
				<td colspan="6" class = "paging">
					<c:forEach var="i" begin="1" end="${totalNum}">
						<c:if test="${curPage == i}">
						${i}
						</c:if>
						<c:if test="${curPage != i}">
							<a href=" <c:url value='Board?curPage=${i}'/> "> ${i} </a>
						</c:if>
					</c:forEach>
				</td>
			</tr>
		</table>
</div>
		
</body>
</html>