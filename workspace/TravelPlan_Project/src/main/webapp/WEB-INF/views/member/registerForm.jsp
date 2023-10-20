<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder"%>
<link rel="stylesheet" href="<c:url value='/css/register.css'/>">
 <!-- jquery CDN -->   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    
    <title>회원가입</title>
</head>
<body>

   <form action="/app/register" method="POST" name="frm" onsubmit="return formCheck(this)"><!-- 이벤트 설정, true면 submit false면 제출 x -->
    <div class="title">회원가입</div>
    <div id="msg" class="msg"></div> 
    
	<span id="result" style="color:#C13D5F; font-weight:bold"></span><br>
    <label for="">아이디</label>
    <div class="input-group" style="margin-bottom: 6px;">
    <input class="double" type="text" id="userID" name="userID" placeholder="  7자 이상의 문자" autofocus>
    <button type="button" id="idDuplicatedcheck" class="check-button" style="margin-bottom: 18px;" >중복확인</button>
	</div>
    <label for="">비밀번호</label>
    <input class="input-field" type="text" name="passwd" placeholder="7자 이상의 문자">
    <label for="">이름</label>
    <input class="input-field" type="text" name="name" placeholder="홍길동">
    <label for="">이메일</label>
    <input class="input-field" type="text" name="email" placeholder="example@naver.com"> 
    <label for="" style="margin-bottom: 2px;">우편번호</label>
    <div class="input-group">
    <input class="double" type="text" name="post" id="sample4_postcode" placeholder="  01265">
    <input class="check-button" type="button" onclick="sample4_execDaumPostcode()" value="우편번호찾기"><br>
	</div>
	<div style="margin-top: 10px;"></div>
	<input class="input-field" type="text" name="addr1" id="sample4_roadAddress" placeholder="도로명주소">
	<input class="input-field" type="text" name="addr2" id="sample4_jibunAddress" placeholder="지번주소">
    <span id="guide" style="color:#999"></span>
    <label for="">전화번호</label>
    <input class="input-field" type="text" name="phone" placeholder="010-1234-5678">
    <button type="submit">회원 가입</button>
   </form> 
   <script>
       function formCheck(frm) {  // 유효성 검사
            let msg ='';

            if(frm.userID.value.length<7) {
                setMessage('id의 길이는 7자 이상이어야 합니다.', frm.userID);
                return false;
            }

            if(frm.passwd.value.length<7) {
                setMessage('pwd의 길이는 7자 이상이어야 합니다.', frm.passwd);
                return false;
            }
            if(frm.name.value.length ==0){
            	setMessage('이름이 누락되었습니다.', frm.name);
            	return false;
            }
            if(frm.email.value.length ==0){
            	setMessage('이메일이 누락되었습니다.', frm.email);
            	return false;
            }
            if(frm.email.value.indexOf('@') == -1){
            	setMessage('올바른 이메일 형식이 아닙니다.', frm.passwd);
            	return false;
            }
            if(frm.post.value.length ==0){
            	setMessage('우편번호가 누락되었습니다.', frm.post);
            	return false;
            }
            if(frm.phone.value.length ==0){
            	setMessage('전화번호가 누락되었습니다.', frm.phone);
            	return false;
            }
            if(isNaN(frm.phone.value)){
            	setMessage('전화번호는 숫자만 입력가능합니다.', frm.phone);
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
       
       // 비번 일치/불일치 확인 작업
       $(document).ready(function(){
       $("#passwd2").on("keyup", function(){
			var passwd = $("#passwd").val();
			var passwd2 = $("#passwd2").val();
			var msg="비번 일치";
			if(passwd != passwd2){
				msg="비번 불일치";
			}
			$("#idcheck").text(msg);
		});
       
       // id 중복 체크
       $("#idDuplicatedcheck").on("click",function(){
			// submit 비활성시키기 (아래 '중복체크' button태그 때문에- button은 기본적으로 submit 된다)
			event.preventDefault();
			// ajax 연동
			 $.ajax({
                type:"get",
                url:"memberIdCheck", // get 방식으로 멤버아이디체크서블릿으로 넘어간다는 소리
                data:{
                  userID:$("#userID").val()
                },  // 요청코드
                dataType:'text',  // 응답받은 데이터 타입
                success:function(data, status, xhr){ // 그 문자열을 data에 저장
                  console.log(data);
                  $("#result").text(data);
                },
                error:function(xhr, status, error){
                     console.log("erro 발생");
                }

             });
		});
       });
   </script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
</body>
</html>