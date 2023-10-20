<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디찾기</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
	* { box-sizing:border-box; }
	a { text-decoration: none; }
	form {
		width:400px;
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
		margin: 40px 0 30px 0;
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
		margin-bottom: 20px;
	}
</style>

<form action="findId" method="post" name="frm" onsubmit="return formCheck(this);">
	<h3 id="title">아이디 찾기</h3>
	<div id="info">
		가입 시 등록하신 이름, 이메일, 휴대폰 번호를 입력해주세요.
	</div>
	<div id="msg">
		<c:if test="${not empty param.msg}">
			<i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg)}</i>
		</c:if>
	</div>
	<input type="text" name="name" id="name" placeholder="2자 이상 입력해주세요. " autofocus>
	<input type="text" name="email" id="email" placeholder="이메일 형식으로 입력해주세요.">
	<input type="text" name="phone" id="phone" placeholder="- 없이 입력하세요.">
	<button>아이디 찾기</button>
	
	<script>
		function formCheck(frm) {
			let msg ='';
			if(frm.name.value.length<2) {
			    setMessage('2자 이상 입력해주세요.', frm.name);
			    return false;
			}
			return true;
			}
			function setMessage(msg, element){
				document.getElementById("msg").innerHTML = ` ${'${msg}'}`;
				if(element) {
				    element.select();
			}
		}
	</script>
</form>