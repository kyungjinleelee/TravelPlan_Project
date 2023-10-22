<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jquery CDM -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<title>여담: 비밀번호 재설정</title>
<style>
   * { box-sizing:border-box; }
   a { text-decoration: none; }
    form {
        width:600px;
        height:550px;
        display : flex;
        flex-direction: column;
        align-items:center;
        position : absolute;
        top:50%;
        left:50%;
        transform: translate(-50%, -50%) ;
        border: 1px solid rgb(89,117,196);
        border-radius: 20px;
    }
    #passwd {
        width: 300px;
        height: 40px;
        border : 1px solid rgb(53,99,233);
        border-radius:5px;
        padding: 0 10px;
        margin-bottom: 30px;
        margin-top: 10px;
    }
    #pwCheck {
        width: 230px;
        height: 40px;
        border : 1px solid rgb(53,99,233);
        border-radius:5px;
        padding: 0 10px;
        margin-bottom: 10px;
    }
    #sbtn {
        background-color: rgb(53,99,233);
        color : white;
        width:300px;
        height:50px;
        font-size: 17px;
        border : none;
        border-radius: 5px;
        margin : 20px 0 30px 0;
    }
    #title {
        font-size : 50px;
        margin: 55px 0 30px 0;
    }
    .msg {
        height: 30px;
        text-align:center;
        font-size:16px;
        color:red;
        margin-bottom: 20px;
    }
    #btn {
        background-color: white;
        color : rgb(53,99,233);
        font-weight: bold;
        width:60px;
        height:40px;
        font-size: 17px;
        border : 1px solid rgb(53,99,233);
        border-radius: 5px;
        margin : 10px 0 0 10px;
    }
    label {
    	font-weight: bold;
    	font-size : 17px;
    }
</style>

<!-- jquery -->
<script>
	$(document).ready(function(){
		// 비밀번호 일치 불일치 검사
		$("#btn").on("click", function(){
			event.preventDefault();
			var passwd = $("#passwd").val();
			var pwCheck = $("#pwCheck").val();
			var mesg = "입력하신 비밀번호와 일치합니다.";
			if(passwd != pwCheck) {
				mesg = "입력하신 비밀번호와 일치하지 않습니다.";
			}
			$("#check2").text(mesg);
		});
		
		$("form").on("submit", function(){
			var passwd = $("#passwd").val();
			var pwCheck = $("#pwCheck").val();
			var cmsg = "";
			if(passwd.length < 7) {
				event.preventDefault();
				cmsg = "7자 이상 입력해주세요.";
			}
			if(pwCheck.length < 7) {
				event.preventDefault();
				cmsg = "7자 이상 입력해주세요.";
			}
			if($("#passwd").val() != $("#pwCheck").val()) {
				event.preventDefault();
				cmsg = "비밀번호가 일치하지 않습니다.";
			}
			if($("#check2").text().length == 0) {
				event.preventDefault();
				cmsg = "비밀번호 일치 여부를 확인해 주세요.";
			}
			if(cmsg.length != 0) {
				$("#check1").html("<i class='fa fa-exclamation-circle'> "+cmsg);
			}
		});
	});
</script>
</head>
<body>

<!-- header -->
<jsp:include page="../common/top.jsp" flush="true" />

<!-- content -->
<div id='wrapper'>
  <div>
	<form action="pwAlert" method="post">
		<h3 id="title">비밀번호 재설정</h3>
		<div id="check1" class="msg"></div> 
		<div>
			<input type="hidden" name="userID" value="${resetPwInfo.userID}">
			<input type="hidden" name="email" value="${resetPwInfo.email}">
			<label>새로운 비밀번호</label><br>
			<input type="password" name="passwd" id="passwd" placeholder="비밀번호를 입력해주세요."><br>
			<label>새로운 비밀번호 확인</label><br>
			<input type="password" id="pwCheck" placeholder="비밀번호를 한번 더 입력해주세요."><button id="btn">확인</button><br>
			<span id="check2" class="msg"></span><br>
			<input type="submit" id="sbtn" value="비밀번호 재설정">
		</div>
	</form>
  </div>
</div>
</body>
</html>