<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<title>여담: 아이디 찾기</title>
<style>

   * { box-sizing:border-box; font-family: 'SUIT-Medium'; }
   a { text-decoration: none; }
    #border {
        width:700px;
        height:600px;
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
    .class {
        background-color: rgb(53,99,233);
        color : white;
        width:150px;
        height:50px;
        font-size: 17px;
        border : none;
        border-radius: 5px;
        margin : 20px 5px 30px 5px;
    }
    #title {
        font-size : 50px;
        margin: 100px 0 30px 0;
    }
    #info {
		height: 30px;
		text-align:center;
		font-size:16px;
		margin-bottom: 70px;
		color: gray;
	}
	#btn {
		float: left;
	}
	label {
		font-weight: bold;
	}
	#list{
		margin-bottom: 50px
	}
</style>
</head>
<body>

<!-- header -->
<jsp:include page="../common/top.jsp" flush="true" />

<!-- content -->
<div id='wrapper'>
  <div>
	<div id="border">
		<h3 id="title">아이디 찾기 결과입니다.</h3>
		<div id="info">
			고객님 정보와 일치하는 아이디 목록은 다음과 같습니다.
		</div>
		<div id="msg">
			<c:if test="${empty idList}">
				등록된 아이디가 없습니다.
			</c:if>
		</div>
		<div id="list">
			<c:forEach var="idList" items="${idList}" varStatus="status">
				<label>ID ${status.count}</label>　　　|　　　${idList.userID}<br>
			</c:forEach>
		</div>
		<div id="btn">
			<button class="class" type="button" onclick="location.href='loginForm'">로그인</button>
			<button class="class" type="button" onclick="location.href='findPwForm'">비밀번호 찾기</button>
		</div>
	</div>
  </div>
</div>
</body>
</html>