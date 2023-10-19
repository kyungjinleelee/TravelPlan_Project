<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
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
    <form>
        <div class="title">회원 정보</div>
        <div class="msg">${msg}</div>

        <div>
            <label for="userID">아이디</label>
            <input class="input-field" type="text" name="userID" id="userID" value="${login.userID}" readonly>
        </div>
        <div>
            <label for="name">이름</label>
            <input class="input-field" type="text" name="name" id="name" value="${login.name}" readonly>
        </div>
        <div>
            <label for="email">이메일</label>
            <input class="input-field" type="text" name="email" id="email" value="${login.email}" readonly>
        </div>
        <div>
            <label for="phone">휴대전화</label>
            <input class="input-field" type="text" name="phone" id="phone" value="${login.phone}" readonly>
        </div>
        <div>
            <label for="post">우편번호</label>
            <input class="input-field" type="text" name="post" id="post" value="${login.post}" readonly>
        </div>
        <div>
            <label for="addr1">주소</label>
            <input class="input-field" type="text" name="addr1" id="addr1" value="${login.addr1}" readonly>
        </div>
        <div>
            <label for="addr2">상세주소</label>
            <input class="input-field" type="text" name="addr2" id="addr2" value="${login.addr2}" readonly>
        </div>

        <button onclick="location.href='memberUpdate.jsp'">수정하기</button>
<!-- 수정버튼으로 해당 아이디를 가지고 수정하기 페이지로 연결 
<button type="button" id="memberUpdatebtn" onclick="location.href='${contextPath}/member/memberUpdate?id=${login.userID}'">수정 &gt;</button> -->

    </form>
</body>
</html>
    
   
 