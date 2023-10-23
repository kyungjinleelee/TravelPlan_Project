<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 상세 보기 : 일정 만들기 또는 공유일정자세히보기 ui와 비슷하게 만들기</title>
</head>
<body>
<div class="custom-rectangle6">
        <div class="custom-list">
            <c:choose>
                <c:when test="${empty plan}">
                    <p>계획 정보를 찾을 수 없습니다.</p>
                </c:when>
                <c:otherwise>
                    <p>계획 ID: ${plan.planID}</p>
                    <p>여행 ID: ${plan.travelID}</p>
                    <p>날짜: ${plan.day_num}</p>
                    <p>아이템: ${plan.item}</p>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>