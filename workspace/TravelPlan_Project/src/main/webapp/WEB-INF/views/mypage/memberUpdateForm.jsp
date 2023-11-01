<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- jquery CDN -->   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!DOCTYPE html>
<html lang="en">
 <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <!-- 부트스트랩 CSS 추가 -->
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
        
        .input-group {
   			display: flex;
    		justify-content: space-between;
    		align-items: center;
    		width: 300px;
    		height: 30px;
		}
		

        label {
            font-size: 18px;
        }
        
        #sample4_postcode{
			width: 155px;
            height: 35px;
            border : 1px solid rgb(89,117,196);
            border-radius:5px;
		}
        
        #postcodeBtn {
    		background-color: #E2E2E2; 
    		color: #3A3A3A; 
    		width: 110px; 
    		height: 35px; 
    		font-size: 13px; 
    		border: 1px solid rgb(89,117,196); 
    		border-radius: 5px; 
    		margin-left: 10px; 
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
    <div class="title">회원 정보 수정</div>
        <div>
            <label for="name">이름</label>
            <input class="input-field" type="text" id="name" name="name" value="${loginInfo.name}" required>
        </div>
        <div>
            <label for="email">이메일</label>
            <input class="input-field" type="email" id="email" name="email" value="${loginInfo.email}" required>
        </div>
        <div>
            <label for="phone">전화번호</label>
            <input class="input-field" type="tel" id="phone" name="phone" value="${loginInfo.phone}" required>
        </div>
        <div>
            <label for="post" style="margin-bottom: 2px;">우편번호</label>
            <span class="container row">  
            <input class="input-field" type="text" id="sample4_postcode" name="post" value="${loginInfo.post}" required>
            <input type="button" id="postcodeBtn" onclick="sample4_execDaumPostcode()" value="우편번호찾기" >
       		</span>
        </div>
        <div style="margin-top: 2px;">
			<input class="input-field" type="text" name="addr1" id="sample4_roadAddress" value="${loginInfo.addr1}">
			<input class="input-field" type="text" name="addr2" id="sample4_jibunAddress" value="${loginInfo.addr2}">
			<span id="guide" style="color:#999"></span>
        </div>
        
        <!-- 저장 버튼 -->
		<button id="saveButton" type="submit">저장</button>
		

		<!-- 취소 버튼 (mypage.jsp로 이동) -->
		<button type="button" onclick="location.href='mypage'" class="btn btn-outline-danger" style="font-size: 20px;">취소</button>
 </form>
    
	<script>
        <!--저장 버튼 클릭 시 실행-->
        document.getElementById("saveButton").addEventListener("click", function() {
            alert("회원 정보가 성공적으로 수정되었습니다.");   // 서버로 데이터 전송 후, 성공 시 알림 표시
            window.location.href = "mypage"; // memberInfo.jsp로 리디렉션
        }); 
    </script>
    
    <!-- 주소 찾기 -->
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
