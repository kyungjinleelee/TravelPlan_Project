<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<html lang="en">
<head>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여담: 로그인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<style>
   * { box-sizing:border-box; }
   a { 
   		text-decoration: none;
   		color: black;
   }
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
    #login {
        background-color: rgb(53,99,233);
        color : white;
        border : none;
        border-radius: 5px;
        font-size: 17px;
        height:50px;
        width:300px;
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
</style>

<script>
	$(document).ready(function(){
		$("form").on("submit", function(){
			var userID = $("#userID").val();
			var passwd = $("#passwd").val();
			var cmsg = "";
			if(passwd.length == 0) {
				event.preventDefault();
				cmsg = "비밀번호를 입력해주세요.";
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
</head>
<body class="container">
<form action="login" method="post" onsubmit="return formCheck(this);">
    <h3 id="title">로그인</h3>
    <div id="msg"></div>
       <input type="text" name="userID" id="userID" placeholder="아이디 " autofocus>
       <input type="password" name="passwd" id="passwd" placeholder="비밀번호">
       <button id="login">로그인</button>
       <div>
           <a href="findIdForm">아이디 찾기</a> |
           <a href="findPwForm">비밀번호 찾기</a> |
           <a href="memberUI">회원가입</a>
       </div>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>