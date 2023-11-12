<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 자세히 보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
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

<script type="text/javascript">
	function go_list(){
		location.href="Board";
	}
	
	
</script>	
</head>
<body>
<!-- header -->
<jsp:include page="../common/top.jsp" flush="true" /><br>	

<!-- content -->
	<div class="writeContainer container align-items-center justify-content-center">
		<div>
			<h2 class="text-center">여행 공유하기</h2><br>
		</div>
		<form class="" action="write" method="post">
			<div class="form-group mb-3">
				<div class="input-group flex-nowrap input-group-lg">
					<span class="input-group-text" id="addon-wrapping">제목</span>
					<input type="text" class="form-control" name="title" value="${content.title}">
					<input type="hidden" class="form-control" name="userID" value="${content.userID}" >
					<input type="hidden" name="travelID" value="${content.travelID}">
				</div>
<!-- 				<div class="col-sm-10"> -->
<%-- 					<input type="text" class="form-control" name="title" value="${content.title}" > --%>
<%-- 					<input type="hidden" class="form-control" name="userID" value="${content.userID}" > --%>
					
<!-- 				</div> -->
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
			
			<div class="form-group d-grid gap-2 d-md-flex justify-content-md-end" >
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