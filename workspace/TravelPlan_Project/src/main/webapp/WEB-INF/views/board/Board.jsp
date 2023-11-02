<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 화면</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>



<style>
	.paging-table{
    width: 100%; /* 테이블이 부모 컨테이너의 100% 가로폭을 차지하도록 설정 */
	}
	.paging{
		text-align: center; /* 셀 내의 텍스트를 수평 가운데 정렬 */
		font-size: 14px;
	}

</style>

<script type="text/javascript">
	function go_write() {
		location.href = "WriteRequest?";
	}
</script>
</head>
<body>
	<jsp:include page="../common/top.jsp" flush="true" /><br>
	<h1>게시판입니다.</h1>
	<!--
	아직 만드는중 
	go_list 수정 /writeui 구현하거나 삭제
	SbDTOList
	 -->
	<script type="text/javascript">
		function askYesNo(no) {
			var userConfirmed = confirm("Yes/No로 답해주세요. 계속하시겠습니까?");

			if (userConfirmed) {
				//var Num = parseInt(no, 10);
				
				location.href="delete?contentNum="+no;
				//location.href="delete?contentNum=no";
				alert("사용자가 '예'를 선택했습니다."+no);
			} else {
				alert("사용자가 '아니오'를 선택했습니다.");
			}
		}
		
		function go_update(no,userid) {
			
			//if(userid == null){
			//	alert("로그아웃 상태")
			//	userid = " ";
			//	}
			//var baseUrl = "UpdateRequest";
        	//var queryParams = "contentNum=" + encodeURIComponent(no) + "&userid=" + encodeURIComponent(userid);
        	//var url = baseUrl + "?" + queryParams;
        	
			//location.href="update?contentNum="+no;
			//alert(url);
			
			location.href = "UpdateRequest?contentNum="+no+"&userid="+userid;
		}
	</script>
	<c:set var="DTO" value="${SbDTOList}" />
	<!--{SbDTOList}from model ==> SbDTOList  -->

	<div class="container">
		<h2 class="text-center">게시판 화면</h2>
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

						<td><button
								onclick="go_update(${DTO.contentNum},'${DTO.userID}')">수정3</button></td>
						<!-- ${DTO.contentNum} ${DTO.userID}->
						<!-- <td><a href="delete?no=${list.no}">삭제</a></td> -->
						<td><button onclick="askYesNo(${DTO.contentNum})">
								삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button onclick="go_write()">글쓰기</button>

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