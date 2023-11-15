<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>order</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- 부가적인 테마 -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<script type="text/javascript">

</script>

<style>
	* {
		font-family: 'SUIT-Medium';
    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Medium.woff2') format('woff2');
    	font-weight: normal;
    	font-style: normal;
	}
	
	a:link {
	  color : black;
	  text-decoration: none;
	}
	a:visited {
	  color : black;
	  text-decoration: none;
	}
	a:hover {
	  color : black;
	  text-decoration: underline;
	}
	a:active {
	  color : black;
	  text-decoration: none;
	}
</style>
</head>

<body>
	<jsp:include page="../common/top.jsp" flush="true" /><br>
	<c:set var="DTOlist" value="${wDTOList}" />
	<div class="container">
		<h2 class="text-center mb-5">내가 쓴 글 목록</h2>
		<table class="table table-striped">
			<thead>
			<!-- 유난히 게시판이랑 헷갈리는데 ui고치고 아마 제목 작성일시 조회수 정도만 출력 -->
				<tr>
					<th>제목(title)</th>
					<th>작성일시(boardDate)</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="DTO" items="${DTOlist}">
					<tr>
						<td><a href="../BoardRetrieve?contentNum=${DTO.contentNum}">${DTO.title}</a></td>
						<td>${DTO.boardDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<!-- Body 최하단 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
