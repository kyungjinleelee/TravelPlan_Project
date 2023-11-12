<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여담: 공유 일정 상세보기</title>
<title>게시글 수정하기</title>
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
	function go_list() {
		location.href = "Board";
	}
</script>
<style>
	@font-face {
    	font-family: 'SUIT-Medium';
    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Medium.woff2') format('woff2');
    	font-weight: normal;
    	font-style: normal;
	}
	* {
		font-family: 'SUIT-Medium';
	}
	.writeContainer{
		width: 100%;
		font-size: 14px;
	}
    /* 글쓰기 버튼 스타일 */
	.btnWrite {
       /* Set a font size */
      
      
    }
    .btnWrite:hover {
      text-decoration: underline;
    }
    .text-center{
    	font-family: 'SUIT-Medium';
/*     	font-weight: bold; */
    }
    textarea {
    	font-family: 'SUIT-Medium';
	    width: 100%;
	    height: 50em;
	    border: none;
	    resize: none;
	}
	span {
		font-family: 'SUIT-Medium';
	}
</style>
</head>
<body>
<!-- header -->
<jsp:include page="../common/top.jsp" flush="true" /><br>	

<!-- content -->
	<div class="writeContainer container">
		<div>
			<h2 class="text-center">게시글 수정</h2><br>
		</div>
		
		<form class="" action="update" method="post">
			
			<div class="form-group mb-3">
<!-- 				<label for="title" class="col-sm-2 control-label">제목</label> -->
<!-- 				<div class="col-sm-10"> -->
<!-- 					<input type="text" class="form-control" name="title" -->
<%-- 						value="${content.title}"> --%>
<!-- 				</div> -->
<!-- 				<label for="title" class="col-sm-2 control-label">글번호</label> -->
<!-- 				<div class="col-sm-10"> -->
<%-- 					<input type="hidden" name="contentNum" value="${content.contentNum}"> --%>
<!-- 				</div> -->
				<div class="input-group flex-nowrap input-group-lg">
					<span class="input-group-text" id="addon-wrapping">제목</span>
					<input type="text" class="form-control" name="title" value="${content.title}">
					<span class="input-group-text" id="addon-wrapping">${content.contentNum}</span> <!-- 글번호 -->
					<input type="hidden" name="contentNum" value="${content.contentNum}">
				</div>
			</div>

			<div class="form-group mb-3">
<!-- 				<label for="content" class="col-sm-2 control-label">내용</label> -->
<!-- 				<div class="col-sm-10"> -->
<%-- 					<textarea class="form-control" rows="3" name="mainText">${content.mainText}</textarea> --%>
<!-- 				</div> -->
				<div class="input-group input-group-lg">
				  <span class="input-group-text">내용</span>
				  <textarea class="form-control" rows="3" name="mainText" style="resize: none; font-size: 15px;">${content.mainText}</textarea>
				</div>
			</div>

			<div class="form-group d-grid gap-2 d-md-flex justify-content-md-end">
<!-- 				<div class="col-sm-offset-2 col-sm-10"> -->
<!-- 					<button type="submit" class="btn btn-default">저장하기</button> -->
<!-- 					<input type="button" value="목록" class="btn btn-default" -->
<!-- 						onclick="go_list()"> -->
<!-- 				</div> -->
				<div>
					<button type="submit" class="btn btn-primary">저장하기</button>
					<input type="button" value="목록" class="btn btn-secondary" onclick="go_list()">
				</div>
			</div>
		</form>

	</div>
	
	<!-- Body 최하단 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>