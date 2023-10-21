<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 찜한 글</title>
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
	function writeui() {
		//location.href="write"; // write or 글 상세보기 페이지로 이동. 현재는 구현 x
	}
</script>
</head>
<!-- 
/*
현재는 erd 의 user_like_list를 그대로 보여줌
SharedTravel 의 여행id, 조회수를 보여줘야 할 수도 있음
기존 설계는 이미지, 제목, 글 내용 미리보기(여행계획은 텍스트 본문이 없음)임

상세 보기로 넘어가면 user like list 와 매핑된 sharedTravel
sharedTravel 과 매핑된 commentsOfTravel,Travel,Plan
에서 가져온 속성들 출력
user_like_list - SharedTravel - {commentsOfTravel,Travel,Plan}
*/
 -->
<body>
<jsp:include page="../common/top.jsp" flush="true" /><br>
	<h1>내가 찜한 글(여행계획(내보관함)) 화면입니다</h1>
	<!--
	그럼 내가  찜한 계획 있고 != 내가 생성계획 공유 - 일정 공유 게시판 
	DTO 리스트로 만들어서 보낼 것
	 -->
	<c:set var="DTOlist" value="${ulDTOList}" />
	<c:set var="DTO" value="${ulDTOList}" /><!-- 없애야 할 수도 있음 -->
	<div class="container">
		<h2 class="text-center">내가 좋아요 한 일정 목록</h2>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>테이블 아이디(like list id)</th>
					<th>작성자(userid)</th>
					<th>공유게시글 아이디(Tcontentid)</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="DTOlist" items="${DTO}">
					<tr>
						<td>${DTO.like_list_ID}</td>
						<td>${DTO.userID}</td>
						<td>${DTO.tContentID}</td>
						<td><a href="delete?no=${list.no}">삭제(지금 클릭하면 에러 날 것)</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button onclick="writeui()">글쓰기(기능안함)</button>
	</div>
</body>
</html>