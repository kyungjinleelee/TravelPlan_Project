<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여담: 비밀번호 찾기</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
	* { box-sizing:border-box; font-family: 'SUIT-Medium'; }
	a { text-decoration: none; }
	form {
		width:600px;
		height:500px;
		display : flex;
		flex-direction: column;
		align-items:center;
		position : absolute;
		top:50%;
		left:50%;
		transform: translate(-50%, -50%) ;
		border: 1px solid rgb(158,158,158);
		border-radius: 10px;
	}
	 input[type='text'], input[type='password'] {
		width: 300px;
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
		margin: 60px 0 30px 0;
	}
	 #msg {
		height: 30px;
		text-align:center;
		font-size:16px;
		color:red;
		margin-bottom: 20px;
	}
	 #info {
		height: 30px;
		text-align:center;
		font-size:16px;
		margin-bottom: 30px;
		color: gray;
	}
</style>

<form action="findPwSendMail" method="post" name="frm" onsubmit="return formCheck(this);">
	<h3 id="title">비밀번호 찾기</h3>
	<div id="info">
		가입 시 입력한 이메일 주소가 같아야<br>인증 메일을 받을 수 있습니다.
	</div>
	<div id="msg"></div>
	<input type="text" name="userID" id="userID" placeholder="아이디를 입력해주세요.">
	<input type="text" name="email" id="email" placeholder="이메일 형식으로 입력해주세요.">
	<button id="sbtn">인증메일 받기</button>
</form>
<script>
$(document).ready(function(){
	$("form").on("submit", function(){
		var userID = $("#userID").val();
		var email = $("#email").val();
		var cmsg = "";
		if(email.includes('@') == false){
			event.preventDefault();
			cmsg = "올바른 이메일 형식이 아닙니다.";
        }
		if(email.length == 0) {
			event.preventDefault();
			cmsg = "이메일을 입력해주세요.";
		}
		if(userID.length == 0) {
			event.preventDefault();
			cmsg = "아이디를 입력해주세요.";
		}
		if(cmsg.length != 0) {
			$("#msg").html("<i class='fa fa-exclamation-circle'> "+cmsg);
		}
	});
});
</script>