<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <style>
        * { box-sizing:border-box; }

        form {
            width:500px;
            height:700px;
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

        .input-field {
            width: 300px;
            height: 250px;
            border : 1px solid rgb(89,117,196);
            border-radius:5px;
            padding: 0 6px;
            margin-bottom: 7px;
        }
        label {
            width:300px;
            height:30px;
            margin-top :4px;
        }

        button {
            background-color: rgb(53,99,233);
            color : white;
            width:300px;
            height:290px;
            font-size: 17px;
            border : none;
            border-radius: 5px;
            margin : 20px 0 50px 0;
        }

        .title {
            font-size : 50px;
            font-weight: bold;
            margin: 40px 0 20px 0;
        }

        .msg {
            height: 30px;
            text-align:center;
            font-size:16px;
            color:red;
            margin-bottom: 20px;
        }
        
    </style>
    <title>회원가입</title>
</head>
<body>

   <form action="/app/loginForm" method="post" onsubmit="return formCheck(this)"><!-- 이벤트 설정, true면 submit false면 제출 x -->
    <div class="title">회원가입</div>
    <div id="msg" class="msg"></div> 
    
    <label for="">아이디</label>
    <input class="input-field" type="text" name="userID" placeholder="8자 이상의 문자" autofocus>
    <label for="">비밀번호</label>
    <input class="input-field" type="text" name="passwd" placeholder="8자 이상의 문자">
    <label for="">이름</label>
    <input class="input-field" type="text" name="name" placeholder="홍길동">
    <label for="">이메일</label>
    <input class="input-field" type="text" name="email" placeholder="example@fastcampus.co.kr"> 
    <label for="">우편번호</label>
    <input class="input-field" type="text" name="post" placeholder="01645">
    <label for="">주소</label>
    <input class="input-field" type="text" name="addr" placeholder="주소">
    <label for="">전화번호</label>
    <input class="input-field" type="text" name="phone" placeholder="010-1234-5678">
    <button>회원 가입</button>
   </form> 
   <script>
       function formCheck(frm) {
            let msg ='';

            if(frm.id.value.length<8) {
                setMessage('id의 길이는 8자 이상이어야 합니다.', frm.userID);
                return false;
            }

            if(frm.pwd.value.length<8) {
                setMessage('pwd의 길이는 8자 이상이어야 합니다.', frm.passwd);
                return false;
            }           
           
           return true;
       }

       function setMessage(msg, element){
            document.getElementById("msg").innerHTML = `<i class="fa fa-exclamation-circle"> ${'${msg}'}</i>`;

            if(element) {
                element.select(); // 양식이 잘못되었을 때 자동 커서 위치
            }
       }
   </script>
</body>
</html>