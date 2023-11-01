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



	<style>
		.right-button {
			margin-right: auto;
		}
		
		textarea{
		    height: 6.25em;
		    width: 100%;
		    resize: none;
		  }
		
		.article-info{
			
			display: flex;
   			justify-content: space-between;
			margin-bottom : 10px;
			
		}
		article-info article-info-section{
			float:right;
		}
		article-info member-info-section{
			float:left;
		}
		
		.title{
		font-size:18px;
		}
		  	
	</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>



<script type="text/javascript">
	//var target = document.getElementById('writeComment');

	//target.addEventListener('click', go_insert);

	function go_list() {
		location.href = "Board";
	}

	function go_update() {//파라미터를 아예 안넣었는데?
		location.href = "UpdateRequest?contentNum=${content.contentNum}"
				+ "&userid=${content.userID}";
	}

	function go_insert() {
		var textAreaContent = document.getElementById("comment").value;
		//alert('click' + textAreaContent)
		location.href = "comment?contentNum=${content.contentNum}"
				+ "&comment="+textAreaContent;
	}

	
</script>
</head>
<body>
	<div class="container">
		<form class="form-horizontal" action="update" method="post">
			<div class="form-group">
				<div class="col-sm-10">
					<h2 class="text-center">게시판 자세히 보기 화면</h2>
				</div>
			</div>
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tbody>
					<tr>
						<td class="title" colspan="5" align="left" >${content.title }</td>
						
					</tr>
					<!--<tr>  -->
					<!--<td align="left">${content.contentNum}</td>
						<td align="left">작성자</td>
						<td align="left">${content.userID }</td>  -->
						
				</tbody>
			</table>
			<div class = "article-info">
				<div class = "article-info member-info-section"> 
					<span>작성자</span>
					<span>&nbsp;</span>
					<span>${content.userID }</span>
				</div>
				<div class = "article-info article-info-section"> 
					<span >좋아요</span>
					<span>&nbsp;</span>
					<span>${content.likeContent}</span>
					<span class="sep">│</span>
					<span >조회수</span>
					<span>&nbsp;</span>
					<span>${content.views}</span>
					<span class="sep">│</span>
					<span >작성일</span>
					<span>&nbsp;</span>
					<span>${content.boardDate}</span>
				</div>	
			
			</div>
			<div class="form-group">
				<!-- <label for="content" class="col-sm-2 control-label">내용</label>  -->
				<div class="col-sm-12">
					<!-- col 1이  생각보다 크다. -->
					<textarea class="form-control" rows="10" name="content">${content.mainText}</textarea>
				</div>
			</div>

			<div class="form-group">
				<div ><!-- class="col-sm-offset-1" -->
					<!-- class="col-sm-offset-2 col-sm-10"
					<input type="button" value="글수정" class="btn btn-default col-sm-1" onclick="go_update()"> 
					<input type="button" value="목록" class="btn btn-default col-sm-1" onclick="go_list()">
					 -->
				</div>
				<span><input type="button" value="좋아요(찜)하기" class=" btn-default col-sm-2 btn col-sm-offset-5" ></span>
				<span><input type="button" value="글수정" class="btn btn-default col-sm-1 btn col-sm-offset-3" onclick="go_update()"></span>
				<span><input type="button" value="목록" class="btn btn-default col-sm-1"  onclick="go_list()"></span>
				
			</div>
		</form>
		<!--<table class="table table-striped table-bordered table-hover"> ulList_seq -->
			
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<tr>
				<td align="left" colspan="2" bgcolor="beige">댓글</td>
			</tr>
		</table>
		<c:forEach var="dto" items="${comment}">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tbody>
					<tr>
						<td align="left">${dto.userID}</td>
						<td align="right">${dto.commentdate} </td>
					</tr>
					<tr>
						<td colspan="5" align="left">${dto.comments}</td>
						
					</tr>
					
				</tbody>
			</table>
		</c:forEach>
			
		<div>
			<form action = "comment" method="post">
				<div class="form-group">
					<label class="col-sm-5 control-label">댓글 작성하기</label>
					<!--  <div class="col-sm-15 col-sm-10"> <label for="comment">댓글 내용:</label> class="form-control col-sm-3"   -->
					<div class="form-group">
           		 	
						<textarea  rows="4" cols="100" id="comment" name="comment" placeholder='타인을 배려하는 댓글을 작성해 주세요' required></textarea>
					</div>
				</div>
				<div class="col-sm-offset-11 col-sm-5 ">
					<input type="button" class="btn btn-default" id="writeComment" onclick ="go_insert()" value="댓글작성">
					<!-- class right-button -->
				</div>
			</form>
		</div>
	</div>
</body>
</html>