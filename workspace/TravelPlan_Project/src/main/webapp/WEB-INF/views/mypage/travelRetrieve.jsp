<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일정 상세 보기</title>
</head>
<body>
    <div class="container">
        <h1>여행 계획 상세 정보</h1>
        <c:out value="${travel.SDate}" /><br>
        <c:out value="${travel.EDate}" /><br>
        <c:out value="${travel.travelTitle}" /><br>
        <c:out value="${travel.areaCode}" /><br>
        <c:out value="${travel.writedate}" /><br>
    </div>
</body>
</html>

