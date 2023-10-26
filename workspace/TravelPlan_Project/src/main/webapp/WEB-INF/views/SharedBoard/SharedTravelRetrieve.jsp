<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	function go_list() {
		//현재는 기능 없음.
		location.href = "SharedBoard";
	}
</script>
</head>
<body>
	<jsp:include page="../common/top.jsp" flush="true" /><br>
	<div class="container">
		<form class="form-horizontal" action="update" method="post">
			<div class="form-group">
				<div class="col-sm-10">
					<h2 class="text-center">(공유)일정 자세히 보기 화면(if 공유, title,view x
						Ui 개선 필수!)</h2>
				</div>
			</div>
			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">여행 id</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="no"
						value="${TravelDTO.travelID}" readonly="readonly">
				</div>
				<label for="title" class="col-sm-2 control-label">작성자</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="no"
						value="${TravelDTO.userID}" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">일정 제목</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="title"
						value="${TravelDTO.travelTitle}">
				</div>
			</div>
			<!-- travel -->
			<table class="table table-striped">
				<thead>
					<tr>
						<th>시작일(sdate)</th>
						<th>종료일(edate)</th>
						<th>여행위치코드(areacode)</th>
						<th>작성일시(writedate)</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${TravelDTO.SDate}</td>
						<td>${TravelDTO.EDate}</td>
						<td>${TravelDTO.areaCode}</td>
						<td>${TravelDTO.writedate}</td>
						<td><a href="delete?no=${list.no}">삭제(지금 클릭하면 에러 날 것)</a></td>
					</tr>

				</tbody>
			</table>
			<!-- 모델에서 list<PlanDTO> 넣어줘야 함-->
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>여행일정 아이디(planid)</th>
						<th>여행ID(traveliD)</th>
						<th>일자(day_num)</th>
						<th>일정항목(item)</th>
						<th>주소(item_add)</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="DTO" items="${PlanDTOList}">
						<tr>
							<td>${DTO.planID}</td>
							<td>${DTO.travelID}</td>
							<td>${DTO.day_num}</td>
							<td>${DTO.item}</td>
							<td>${DTO.item_add}</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" value="목록" class="btn btn-default"
						onclick="go_list()">
				</div>
			</div>
		</form>

	</div>
</body>
</html>