<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
<form action="memberUpdate" method="post">
    <h1>회원 정보 수정</h1>

        <div>
            <label for="name">이름</label>
            <input class="input-field" type="text" id="name" name="name" value="${loginInfo.name}" required>
        </div>
        <div>
            <label for="email">이메일</label>
            <input class="input-field" type="email" id="email" name="email" value="${loginInfo.email}" required>
        </div>
        <div>
            <label for="phone">휴대전화</label>
            <input class="input-field" type="tel" id="phone" name="phone" value="${loginInfo.phone}" required>
        </div>
        <div>
            <label for="post">우편번호</label>
            <input class="input-field" type="text" id="post" name="post" value="${loginInfo.post}" required>
        </div>
        <div>
            <label for="addr1">주소</label>
            <input class="input-field" type="text" id="addr1" name="addr1" value="${loginInfo.addr1}" required>
        </div>
        <div>
            <label for="addr2">상세주소</label>
            <input class="input-field" type="text" id="addr2" name="addr2" value="${loginInfo.addr2}" required>
        </div>

        <!-- 저장 버튼 -->
		<button type="submit">저장</button>

		<!-- 취소 버튼 (mypage.jsp로 이동) -->
		<button type="button" onclick="location.href='mypage'">취소</button>
    </form>
</body>
</html>
