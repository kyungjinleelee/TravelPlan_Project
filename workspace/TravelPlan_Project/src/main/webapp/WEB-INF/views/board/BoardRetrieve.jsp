<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 자세히 보기</title>
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
		location.href="Board";
	}
	
	function go_update(){
		location.href="UpdateRequest?contentNum=${content.contentNum}";
	}
</script>	
</head>
<body>
	<div class="container">
		<form class="form-horizontal" action="update" method="post">
			<div class="form-group">
				<div class="col-sm-10" >
						<h2 class="text-center">게시판 자세히 보기 화면</h2>
				</div>
			</div>
			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">글번호</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="no" value="${content.contentNum}" readonly="readonly">
				</div>
				<label for="title" class="col-sm-2 control-label">조회수</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="no" value="${content.views}" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">제목</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="title" value="${content.title }"readonly="readonly" >
				</div>
			</div>
			<div class="form-group">
				<label for="author" class="col-sm-2 control-label">작성자</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="author" value="${content.userID }"readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label for="author" class="col-sm-2 control-label">작성일</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="date" value="${content.boardDate }"readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label for="content" class="col-sm-2 control-label">좋아요</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="likeContent" value="${content.likeContent }"readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label for="content" class="col-sm-2 control-label">내용</label>
				<div class="col-sm-10">
					<textarea class="form-control" rows="3" name="content">${content.mainText }</textarea>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					
					<input type="button" value="글수정" class="btn btn-default" onclick="go_update()">
					<input type="button" value="목록" class="btn btn-default" onclick="go_list()">
				</div>
			</div>
		</form>
		<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>작성자ID(userID)</th>
						<th>작성일지(commentdate)</th>
						<th>(comments)</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${comment}">
						<tr>
							<td>${dto.userID}</td>
							<td>${dto.commentdate}</td>
							<td>${dto.comments}</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		
	</div>
</body>
</html>