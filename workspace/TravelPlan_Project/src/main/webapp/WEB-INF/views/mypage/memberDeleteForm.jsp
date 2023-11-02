<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
 <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- 부트스트랩 CSS 추가 -->
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- 외부 CSS 파일 추가 -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/memberDeleteForm.css'/>">
  </head>

<body>
<section id="container">
 <form action="memberDelete" method="post" id="delForm">
    <h1>회원 탈퇴하기</h1>
        <div>
            <label for="userID">아이디</label>
            <input class="input-field" type="text" name="userID" id="userID" value="${loginInfo.userID}" readonly>
        </div>
        <div>
            <label for="passwd">비밀번호</label>
            <input class="input-field" type="password" id="passwd" name="passwd" required>
        </div>
        
        <!-- 탈퇴 버튼 -->
		<button id="deleteBtn" class="btn btn-outline-danger" type="button" style="font-size: 20px;">탈퇴하기</button>
		
		<!-- 취소 버튼 (mypage.jsp로 이동) -->
		<button type="button" onclick="location.href='mypage'">취소</button>
		 <div id="errorMessage" style="color: red;"></div>
       
       
       <%--  <div>
		 	<c:if test="${msg == false}">
		 		<span style="color: red;">비밀번호를 다시 확인해주세요. (7자 이상의 조합)</span>
		 	</c:if>
	 	</div>      --%>
  </form>
 </section>

  <script type="text/javascript">
 	$(document).ready(function(){
 		//탈퇴하기
 		$("#deleteBtn").on("click", function(){
 			if($("#passwd").val() == ""){
 				alert("비밀번호를 입력해주세요.");
 				$("#passwd").focus();
 				return false;
 			}
 			
 			$.ajax({
 				url : "http://localhost:8091/app/checkPw",
 				type : "POST",
 				dataType : "json",
 				data : $("#delForm").serializeArray(),
 				success : function(data){
 					
 					if(data==0){
 						alert("비밀번호가 틀렸습니다.");
 						$("#errorMessage").text("비밀번호를 다시 확인해주세요. (7자 이상의 조합)");
 						return;
 					}else{
 						if(confirm("정말 탈퇴하시겠습니까?")){
 							$("#delForm").submit();
 							} else{ window.location.href="mypage"; 
 								 }
 						}
 					},
 					error: function (xhr, status, error) {
 		                console.log("오류 발생! 다시 시도해주세요 ");
 		                return;
 		            }
 		        });
 			
 		    });
 		});
  </script>  
</body>
</html>
