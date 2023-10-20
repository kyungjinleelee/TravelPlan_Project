<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공유 일정 상세보기 화면</title>
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
	function go_list(){
		//현재는 기능 없음.
		//location.href="SharedTravelBoard";
	}
</script>	
</head>
<body>
<jsp:include page="common/top.jsp" flush="true" /><br>
	<h1>내가 찜한 글(여행계획(내보관함)) 화면입니다</h1>
	<!--
	아직 만드는중 
	go_list 수정 /writeui 구현하거나 삭제
	
	 -->
	<c:set var="DTOlist" value="${SharedBoardDTO}" />
	<!-- 아직 컨트롤러 구현 안했는데, model에 DTO리스트 넣어줘야함 -->
	<div class="container">
		<h2 class="text-center">공유된 일정 목록(목록. 일정아님)</h2>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>공유게시글 아이디(tContentID)</th>
					<th>여행ID(travelID)</th>
					<th>작성자(userID)</th>
					<th>공유게시글 아이디(views)</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="DTOlist" items="${DTO}">
					<tr>
						<td>${DTO.tContentID}</td>
						<td>${DTO.travelID}</td>
						<td>${DTO.userID}</td>
						<td>${DTO.views}</td>
						<td><a href="delete?no=${list.no}">삭제(지금 클릭하면 에러 날 것)</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button onclick="writeui()">글쓰기(기능안함)</button>
	</div>
</body>
</html>