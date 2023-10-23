<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            position: relative;
            width: 1440px;
            height: 1024px;
            background: #FFFFFF;
        }
        
           .custom-text {
            position: absolute;
            width: 394px;
            height: 125px;
            left: 600px;
            top: 233px;
            font-family: 'Inter';
            font-style: normal;
            font-weight: 500;
            font-size: 50px;
            line-height: 61px;
            display: flex;
            align-items: center;
            text-align: center;
            letter-spacing: 0.2px;
            color: #000000;
        }
        
        /* 전체보기 사각형 */
        .custom-rectangle {
           box-sizing: border-box;
            position: absolute;
            width: 109.5px;
            height: 48px;
            left: 247px;
            top: 432px;
            background: #FFFFFF;
            border: 1px solid #000000;
            display: flex;
            align-items: center;
        }
        
        /* 좋아요 사각형 */
        .custom-rectangle2 {
           box-sizing: border-box;
            position: absolute;
            width: auto;
            height: 48px;
            left: 370px;
            top: 432px;
            background: #FFFFFF;
            border: 1px solid #000000;
            display: flex;
            align-items: center;
            padding: 0 10px; /* 텍스트와 경계 사이 여백을 추가 */
        }
        
        /* 내가 쓴 글 사각형 */
        .custom-rectangle3 {
           box-sizing: border-box;
            position: absolute;
            width: auto;
            height: 48px;
            left: 510px;
            top: 432px;
            background: #FFFFFF;
            border: 1px solid #000000;
            display: flex;
            align-items: center;
            padding: 0 10px; /* 텍스트와 경계 사이 여백을 추가 */
        }
        
        /* 게시판 등록 사각형 */
        .custom-rectangle4 {
           box-sizing: border-box;
            position: absolute;
            width: auto;
            height: 48px;
            left: 1200px;
            top: 432px;
            background: #FFFFFF;
            border: 1px solid #000000;
            display: flex;
            align-items: center;
            padding: 0 10px; /* 텍스트와 경계 사이 여백을 추가 */
        }
        
        /* 새 일정 만들기 사각형 */
        .custom-rectangle5 {
            box-sizing: border-box;
            position: absolute;
            width: 355px;
            height: 270px;
            left: 247px;
            top: 512px;
            background: #FFFFFF;
            border: 1px solid #000000;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        /* 글1 사각형 */
        .custom-rectangle6 {
            position: absolute;
            width: 355px;
            height: 270px;
            left: 650px;
            top: 512px;
            background: #D9D9D9;
            border: 1px solid #000000;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        /* 글2 사각형 */
        .custom-rectangle7 {
            position: absolute;
            width: 355px;
            height: 270px;
            left: 1050px;
            top: 512px;
            background: #D9D9D9;
            border: 1px solid #000000;
            display: flex;
            align-items: center;
            justify-content: center;
        }


        
        /* 전체보기 */
        .custom-all {
             font-family: 'Inter';
            font-style: normal;
            font-weight: 500;
            font-size: 20px;
            line-height: 24px;
            text-align: center;
            letter-spacing: 0.2px;
            color: #000000;
            margin: auto;
        }
        
        /* 좋아요 목록 */
        .custom-like {
             font-family: 'Inter';
            font-style: normal;
            font-weight: 500;
            font-size: 20px;
            line-height: 24px;
            text-align: center;
            letter-spacing: 0.2px;
            color: #000000;
            margin: auto;
        }
        
        /* 내가 쓴 글 */
        .custom-write {
            font-family: 'Inter';
            font-style: normal;
            font-weight: 500;
            font-size: 20px;
            line-height: 24px;
            text-align: center;
            letter-spacing: 0.2px;
            color: #000000;
            margin: auto;
        }
        
        /* 게시판 등록 */
        .custom-goBoard {
            font-family: 'Inter';
            font-style: normal;
            font-weight: 500;
            font-size: 20px;
            line-height: 24px;
            text-align: center;
            letter-spacing: 0.2px;
            color: #000000;
            margin: auto;
        }
        
        /* 새 일정 만들기 */
        .custom-new {
            font-family: 'Inter';
            font-style: normal;
            font-weight: 500;
            font-size: 20px;
            line-height: 24px;
            text-align: center;
            letter-spacing: 0.2px;
            color: #000000;
        }
        
        /* Icon/새 일정 만들기 아이콘 */
        .custom-icon {
            position: absolute;
            width: 24px;
            height: 24px;
            left: 92px; /* 조절이 필요할 수 있음 */
            top: 12px; /* 조절이 필요할 수 있음 */
        }
        
        
        /* 글1 */
         .custom-list {
            font-family: 'Inter';
            font-style: normal;
            font-weight: 500;
            font-size: 20px;
            line-height: 24px;
            text-align: center;
            letter-spacing: 0.2px;
            color: #000000;
        }
        
        /* 화면 캡처  */
 		.capture {
            position: absolute;
            width: 365px;
            height: 160px;
            left: 539px;
            top: 519px;
            background: url(화면 캡처 2023-10-11 142315.png);
        }
        
        
        
        
        
    </style>
     <script src="https://kit.fontawesome.com/xxxxxxxxcxc.js" crossorigin="anonymous"></script>
</head>

<body>
    <div class="custom-text">
    	일정 보관함
    </div>
    <br>
    <div class="custom-rectangle">
    	<div class="custom-all">전체보기</div>
	</div>
    <div class="custom-rectangle2">
    	<div class="custom-like">좋아요 목록</div>
	</div>
    <div class="custom-rectangle3">
    	<div class="custom-write">내가 쓴 글</div>
	</div>
    <div class="custom-rectangle4">
    	<div class="custom-goBoard">게시판 등록</div>
	</div>
	<br>
	<div class="custom-rectangle5">
        <a href="일정만들기.jsp" class="custom-new">새 일정 만들기</a>
	    </div>
	</div>    
	<div class="custom-rectangle6">    
		<div class="custom-list">
		<!-- 여기에 조회된 글 내용을 출력 -->
        <c:forEach items="${planList}" var="plan">
        <a href="planDetail?planID=${plan.planID}">
            <p>${plan.planID}</p>
            <p>${plan.travelID}</p>
            <p>${plan.item}</p>
        </c:forEach>
	    </div>
	</div>
	<div class="custom-rectangle7">    
		<div class="custom-list">
		<!-- 여기에 조회된 글 내용을 출력 -->
        <c:forEach items="${planList}" var="plan">
            <p>${plan.planID}</p>
            <p>${plan.travelID}</p>
            <p>${plan.item}</p>
        </c:forEach>
	    </div>
	</div>
	
	
</body>
</html>
