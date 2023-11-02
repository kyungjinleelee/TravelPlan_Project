<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
<!-- 헤더 안먹음!!!!!!!!!!! 확인하삼 -->
<!-- header -->
<jsp:include page="common/top.jsp" flush="true" />

<!-- content -->
<div id='wrapper'>
  <div>
    <jsp:include page="mypage/mypage.jsp" flush="true" />
  </div>
</div>

<%--  <jsp:include page="common/top.jsp" flush="true" /><br>  --%>
<!-- <hr>  -->
<%-- <jsp:include page="mypage/mypage.jsp" flush="true" /> --%>
</body>
</html>