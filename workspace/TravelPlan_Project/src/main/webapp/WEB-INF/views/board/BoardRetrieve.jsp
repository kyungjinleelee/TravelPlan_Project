<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	
		.container{
			width: 50%;
		}
		
		.title{
		font-size:18px;
		color:red;
		color:#3563E9;
		}
		.article-info{
			display: flex;
   			justify-content: space-between;
			margin-bottom : 10px;
			font-size:14px;
		}
		article-info article-info-section{
			float:right;
		}
		article-info member-info-section{
			float:left;}
			
		#TravelTable{font-size:14px;}
		
		#mainText{font-size:14px;}
		
		.enlarged-button{
		    /*width: 150px;  원하는 너비로 설정하세요 */
		    height: 40px; /* 원하는 높이로 설정하세요 */
		    font-size: 18px; /* 원하는 글꼴 크기로 설정하세요 */
		}
		
		#comment-border{
		/* 여기서 색깔 설정 잘 충돌했던 것으로 기억*/
		font-size: 14px;
		}
		
		.control-label{font-size:14px;}
		
		#CommentTable tr{font-size:14px;}
		#comment{
		font-size:14px;
		resize:none;
		margin-bottom : 10px;
		}
		
		.writeComment{
			color:#3563E9;
		}
		
		
		.testTable{
		width: 50%;
		
		max-width: 400px; 
		font-size:14px;
		border: 2px solid black; /* 원하는 굵기와 색상으로 변경 */
		}
		
		.detail-info-head{
			width: 100%;
		}
		
		.bold-text {
		    font-weight: bold;
		}
		
		
		.date-cell{
		color:white;
		font-size:20px;
		border: 2px solid gray;
		 
		}
		
		.single-schedule{
			padding:0px;
		}
		.single-plan-container{
			 border-bottom: 1px solid lightgray;
		}
		
		.plan-cell{
		min-width: 200px;
		max-width: 300px;
		width: 100%;
		
		
		}
		
		/* border: 2px solid lightgray; */
		/* textarea 들어 있는 컨테이너, 테이블 밑, 테이블과 별개 */
		.textarea-container {
		  /*  width: 90%; */
		  font-size:14px;
		  
		}
		
		.textarea-container textarea {
		  /* 여기서 100%이면 90의 100을 다 쓴다는 식. */
		  resize:none;
		}
		
		.hidden {
	    display: none;
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
	
	
	//사용하지 않음
	function likeDupCheck(){//비동기 요청이기 때문에 이 함수 호출이후 값을 받아오기 전 like() 내부의 코드가 별도로 계속 도는듯한 모습이 보임. 
		//체크하기
		$.get('likeDupCheck?contentNum=${content.contentNum}').done(function(data){
  			console.log('likeDupCheck get 이후 data 출력(리턴 전)' + data)
  			//console.log(data['return'])
  			return data;
		});
			
		
	}
	
	function like() {
		//좋아요 버튼을 눌렀을 때 실행, 요청한 유저의 보관함에 해당 글이 있는지 조회(좋아요 중복방지) 
		//중복이 아니면, 찜 한 보관함으로 보냄
		//개발단계에선 n이 1보다 클 수 있었으므로 1보다 크면 이미 좋아요 얼러트 한다 - 404일 경우에도 그 분기점에서 코드 실행함
		//컨트롤러에서 좋아요 한 횟수 n을 리턴하고, 상태값으로 처리하는 것 보다는 컨트롤러에서 상태값을 리턴하는 것으로
		console.log('like에서 - 함수 실행 직후');
		//그 유저의 보관함에 그 글이 몇개 있는지 확인
		$.get('likeDupCheck?contentNum=${content.contentNum}').done(function(data){
  			console.log('get 이후 data 출력(조건 체크 전)' + data)
  			
  			if(data == 1 ){//요청한 유저가 이미 보관함에 이 글을 보관했을 시 
  				alert('이미 좋아요 한 게시물입니다.')
  			}else if(data==404){//로그인 하지 않은 상황에서 요청 시 => 컨트롤러에서 404 반환, 여기로 옴
  				alert('로그인 한 유저만 사용할 수 있는기능입니다.')
  			}else{//문제가 없다면 0일 경우
  				//요청 - 이 글을 유저의 보관함에 저장
  				$.get('UserLike?contentNum=${content.contentNum}').done(function(data){
  		  			console.log('아마도 성공')
  				});
			};
			console.log('like에서 - 실행이후');
		
		
		//var isDuplicated=likeDupCheck();
		
		//console.log('like에서 - isDuplicated 값 : '+isDuplicated+' isDuplicated typeof 값: '+typeof isDuplicated);
		//console.log(daisDuplicatedta);
		//alert('click' + ${content.contentNum})
		});
	}

	//테이블 클래스에서 버튼을 누르면 테이블 접었다 폈다하는 함수
	//요청을 보내지 않는데 이 함수 실행시키면 토글을 한 뒤 요청이 감. f(${empty comment})
	
	function tableToggle(){	
		console.log('버튼 눌림')
		
		$("#TravelTable").toggle();
		
		var toggleBtnValue = $("#toggleBtn").val();

	    if(toggleBtnValue === "일정 펼쳐보기"){
	    	$("#toggleBtn").val("일정 접기");
	        console.log("ToggleBtn의 값은 일정 펼쳐보기 입니다.");
	    }else{
	    	$("#toggleBtn").val("일정 펼쳐보기");
	    }
		
		
		
	}
	
	
	
	//window.onload = document.getElementById("toggleBtn").addEventListener("click", tableToggle); 
	window.onload = function(){ 
		const button = document.getElementById("toggleBtn");
		
		const buttonClickHandler = () =>{
		  //alert('Button clicked!');
		  tableToggle()
		  
		};
		 
		button.onclick = buttonClickHandler;
	};
	
	
	
	
</script>
</head>
<body>
<jsp:include page="../common/top.jsp" flush="true" /><br>

	<div class="container">
	<!-- action="update" method="post // 버튼만 누르면 자꾸 업데이트 요청해서 지웠음 -->
		<form class="form-horizontal" >
			<div class="form-group">
				<div class="col-sm-10">
					<!-- <h2 class="text-center">게시판 자세히 보기 화면</h2> -->
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
					<!-- col 1이  생각보다 크다. // id TravelTable -->
						
						<!--testTable : 아마 3개 일의 일정들이 저장되는 테이블 하나  single-dayX3
							single-day : 하루, 하루 일정 이 안에 그 날의 여행 계획들이 들어감
								date-cell : n일차 텍스트 출력됨.이 셀 옆에 컨테이너가 있고, 그 안에 세로로 일정들을 배치함
								single-schedule : 그 날 하루의 여러 일정들이 들어가는 td
									single-plan-container : 단일 일정 하나가 들어가는 컨테이너. 이 안에 텍스트들이 들어가고, 이 컨테이너를 세로로 쌓음
										plan-cell : 일정(장소) 정보 들어가는 테이블
										
										<div>${travel.travelTitle}</div>
						-->	
					
					
					
					 
					
					<!-- PlanDto2dList 안의 리스트 PlanDto2dList_e -->
					<!-- PlanDto2dList_e 안의 요소들 planDTO -->
					
					<table class="table testTable" id="TravelTable">
						<tbody>
							 <c:forEach items="${PlanDto2dLists}" var = "PlanDtoLists"  varStatus="loop" >
							 <!--  2중 포문 형태여야함, 겉 n일차, 안 n일차의 일정들-->
								<tr class = "single-day"><!-- 이 tr 하나가 하나의 일정-->
									<td class = "date-cell bold-text" style="text-align: center; background-color: #3563E9; color:white;">${loop.index +1 } 일차</td>
									<td class="single-schedule"> <!-- 테이블 1, 하나의 세부일정, 이걸 반복. -->
										
										<c:forEach items="${PlanDtoLists}"  var="plan">	
											<!-- <div>${PlanDto2dList_e}</div>  
											"${fn : split( PlanDto2dList_e, ',' )}
											<div>"${plan}"</div>
											-->
											
											
											
											<div class="single-plan-container">
												<table class="plan-cell">
													<tr class="detail-info-head" >
											          	<td  align="left">${plan.item}</td>
											          	
														<td  align="right">${plan.time}</td>
											        </tr>
											        <tr class="detail-info-head">
											        	<td align="left">${plan.item_add}</td>
												    </tr>
												</table> 
											</div>
											
											
										</c:forEach>	
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					
					<span><input type="button" value="일정 접기" class="btn btn-default btn-primary" id='toggleBtn' style="font-size: 12px;">
					</span>
					
					<br></br>

					
					<textarea class="form-control" rows="10" name="content" id="mainText">${content.mainText}</textarea>
				</div>
				
			</div>
				
			<div class="form-group" id="functionBtnGroup">
				<div ><!-- class="col-sm-offset-1" -->
					<!-- class="col-sm-offset-2 col-sm-10"
					<input type="button" value="글수정" class="btn btn-default col-sm-1" onclick="go_update()"> 
					<input type="button" value="목록" class="btn btn-default col-sm-1" onclick="go_list()">
					 -->
				</div>
				<span><input type="button" value="좋아요(찜)하기" class=" btn-default btn-primary col-sm-2 btn col-sm-offset-5" style="font-size: 12px;" onclick="like()" ></span>
				<span><input type="button" value="글수정" class="btn btn-default btn-primary col-sm-1 btn col-sm-offset-3" style="font-size: 12px;" onclick="go_update()"></span>
				<span><input type="button" value="목록" class="btn btn-default btn-primary col-sm-1" style="font-size: 12px;" onclick="go_list()"></span>
				
			</div>
		</form>
				
		
				
		
		
		

		<!--<table class="table table-striped table-bordered table-hover"> ulList_seq -->
		<!-- 여기는 댓글 들어가는 테이블 -->	
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			<tr>
				<td align="left" colspan="2" style="background-color: #E0E0E0;" id="comment-border">댓글</td>
				
			</tr>
		</table>
		<c:forEach var="dto" items="${comment}">
			<table class="table table-striped" style="text-align: center;" id="CommentTable" border="1px solid #dddddd;">
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
			<br>
		<div>
			<form ><!-- action = "comment" method="post" -->
				<div class="form-group">
					<label class="col-sm-5  control-label" >댓글 작성하기</label>
					<!--  <div class="col-sm-15 col-sm-10"> <label for="comment">댓글 내용:</label> class="form-control col-sm-3"   -->
					<div class="form-group">
           		 	
						<textarea  rows="4" cols="100" class="form-control col-sm-3" id="comment" name="comment" placeholder='타인을 배려하는 댓글을 작성해 주세요' required></textarea>
					</div>
				</div>
				<div class="col-sm-offset-11 col-sm-5 ">
					<input type="button" class="btn btn-default btn-primary" id="writeComment" onclick ="go_insert()" style="font-size: 12px;" value="댓글작성">
					<!-- class right-button -->
				</div>
			</form>
		</div>
	</div>
</body>
</html>