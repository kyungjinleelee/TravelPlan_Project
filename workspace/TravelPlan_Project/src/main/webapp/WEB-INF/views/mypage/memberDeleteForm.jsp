<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
 <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
                * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background-color: #f4f4f4;
        }

        form {
            width: 500px;
            display: flex;
            flex-direction: column;
            align-items: center;
            border: 1px solid rgb(89, 117, 196);
            border-radius: 20px;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .input-field {
            width: 100%;
            height: 40px;
            border: 1px solid rgb(89, 117, 196);
            border-radius: 5px;
            padding: 0 10px;
            margin-bottom: 10px;
        }

        label {
            font-size: 18px;
        }

        button {
            background-color: rgb(53, 99, 233);
            color: white;
            width: 100%;
            height: 50px;
            font-size: 20px;
            border: none;
            border-radius: 5px;
            margin-top: 20px;
            cursor: pointer;
        }

        .title {
            font-size: 40px;
            font-weight: bold;
            text-align: center;  
            align-items: center;
            margin: 20px 0;
        }

        .msg {
            font-size: 16px;
            color: red;
            margin-bottom: 20px;
        }
        
        /* 열 맞춤 스타일 추가 */
        div {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }
    </style>
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
		<button id="deleteBtn" class="btn" type="button">탈퇴하기</button>
		
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
