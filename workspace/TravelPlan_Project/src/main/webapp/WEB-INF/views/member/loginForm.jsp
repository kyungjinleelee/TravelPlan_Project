<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
   * { box-sizing:border-box; }
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
    button {
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
</style>

<form action="login" method="post" onsubmit="return formCheck(this);">
    <h3 id="title">로그인</h3>
    <div id="msg"></div>
       <input type="text" name="userID" id="userID" placeholder="아이디 " autofocus>
       <input type="password" name="passwd" id="passwd" placeholder="비밀번호">
       <button>로그인</button>
       <div>
           <a href="findIdForm">아이디 찾기</a> |
           <a href="findPwForm">비밀번호 찾기</a> |
           <a href="memberUI">회원가입</a>
       </div>
</form>
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