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
	<div class="container">
		<form class="form-horizontal" action="update" method="post">
			<div class="form-group">
				<div class="col-sm-10" >
						<h2 class="text-center">공유일정 자세히 보기 화면</h2>
				</div>
			</div>
			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">글번호</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="no" value="${dto.no}" readonly="readonly">
				</div>
				<label for="title" class="col-sm-2 control-label">조회수</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="no" value="${dto.readcnt}" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">제목</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="title" value="${dto.title }" >
				</div>
			</div>
			<div class="form-group">
				<label for="author" class="col-sm-2 control-label">작성자</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="author" value="${dto.author }">
				</div>
			</div>
			<div class="form-group">
				<label for="content" class="col-sm-2 control-label">내용</label>
				<div class="col-sm-10">
					<textarea class="form-control" rows="3" name="content" >${dto.content }</textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" value="목록" class="btn btn-default" onclick="go_list()">
				</div>
			</div>
		</form>
		
	</div>
</body>
</html>